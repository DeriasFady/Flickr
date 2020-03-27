//
//  FLPhotosList.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

class FLPhotosList: Decodable {
    
    var page: Int
    var pages: Int
    var perPage: Int
    var total: String
    var photos: [FLPhoto]
    
    enum CodingKeys: String, CodingKey {
        case page = "page",
        pages = "pages",
        perPage = "perpage",
        total = "total",
        photos = "photo"
    }
}
