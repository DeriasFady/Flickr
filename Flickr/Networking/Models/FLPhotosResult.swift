//
//  FLPhotosResult.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

class FLPhotosResult: Decodable {
    
    var photosList: FLPhotosList
    
    enum CodingKeys: String, CodingKey {
        case photosList = "photos"
    }
}
