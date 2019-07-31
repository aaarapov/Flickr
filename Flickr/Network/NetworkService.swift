//
//  NetworkService.swift
//  Flickr
//
//  Created by Александр on 25/06/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

import Foundation

class NetworkService {
    
    class func getData(success: @escaping (JSON) -> Void) {
        
        let urlString = "https://www.flickr.com/services/rest?method=flickr.interestingness.getList&api_key=3988023e15f45c8d4ef5590261b1dc53&per_page=20&page=1&format=json&nojsoncallback=1"
        
        let url = URL(string: urlString)
        
        let request = URLRequest(url: url!)
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if data != nil {
                let jsonResponse = JSON(data!)
                success(jsonResponse)
            }
        }
        dataTask.resume()
    }
}
