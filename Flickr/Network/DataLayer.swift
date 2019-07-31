//
//  DataLayer.swift
//  Flickr
//
//  Created by Александр on 25/06/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

import Foundation


class DataLayer {
    
    class func getImages(success: @escaping (NSMutableArray) -> Void) {
        
        NetworkService.getData { (myJson) in
            let photoArray = NSMutableArray()
            
            let photos = myJson["photos"]
            let photo = photos["photo"].arrayValue
            
            for i in 0..<photos.count {
                let photo = photo[i]
                
                let id = photo["id"].stringValue
                let farmId = photo["farm"].int64Value
                let serverId = photo["server"].int64Value
                let secret = photo["secret"].stringValue
                let photoURL = "https://farm\(farmId).staticflickr.com/\(serverId)/\(id)_\(secret).jpg"
                let title = photo["title"].stringValue
                
                let model = Model(urlImg: photoURL, nameImg: title)
                
                photoArray.add(model)
            }
            success(photoArray)
        }
    }
}
