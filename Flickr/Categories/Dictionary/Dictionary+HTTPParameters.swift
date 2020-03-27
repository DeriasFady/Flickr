//
//  Dictionary+HTTPParameters.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

extension Dictionary where Key == String, Value == String {
    
    func stringFromHttpParameters() -> String {
        
        let parameterArray = self.map { (key, value) -> String in
            guard let percentEscapedKey = key.addingPercentEncodingForURLQueryValue(),
                let percentEscapedValue = value.addingPercentEncodingForURLQueryValue() else {
                 return ""
            }
            
            return String(format: "%@=%@", percentEscapedKey, percentEscapedValue)
        }
        
        return "?\(parameterArray.joined(separator: "&"))"
    }
}
