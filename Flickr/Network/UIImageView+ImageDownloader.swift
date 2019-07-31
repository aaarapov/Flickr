//
//  UIImageView+ImageDownloader.swift
//  Flickr
//
//  Created by Александр on 25/06/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func imageDownload(urlString: String) {
        
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if data != nil {
                DispatchQueue.main.async {
                    let image = UIImage(data: data!)
                    self.image = image
                }
            }
        }
        dataTask.resume()
    }
}
