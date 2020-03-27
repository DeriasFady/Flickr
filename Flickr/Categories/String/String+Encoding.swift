//
//  String+Encoding.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

extension String {
    
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~")
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}
