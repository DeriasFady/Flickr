//
//  FLPhoto.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

class FLPhoto: Decodable {
    
    var photoId: String
    var ownerId: String
    var secretId: String
    var serverId: String
    var farmId: Int
    var title: String
    
    enum CodingKeys: String, CodingKey {
        case photoId = "id",
        ownerId = "owner",
        secretId = "secret",
        serverId = "server",
        farmId = "farm",
        title = "title"
    }
    
    init(photoId: String, ownerId: String, secretId: String, serverId: String, farmId: Int, title: String) {
        self.photoId = photoId
        self.ownerId = ownerId
        self.secretId = secretId
        self.serverId = serverId
        self.farmId = farmId
        self.title = title
    }
    
    func imageURL() -> URL? {
        let farmIdString = String(describing: farmId)
        let urlString = String(format: "https://farm%@.staticflickr.com/%@/%@_%@.jpg", farmIdString,serverId,photoId,secretId)
        return URL(string: urlString)
    }
}
