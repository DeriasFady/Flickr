//
//  FLPhotosManager.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import Foundation

enum FLError: Error {
    case networkFailureError
    case responseError
    case jsonParseError
}

class FLPhotosManager {
    
    private let searchBaseURL = "https://www.flickr.com/services/rest/"
    private var queriesDictionary = ["method":"flickr.photos.search",
                                     "api_key":"1508443e49213ff84d566777dc211f2a",
                                     "per_page":"25",
                                     "format":"json",
                                     "nojsoncallback":"1"]
    
    
    func fetchPhotosBySearch(page: Int, searchText: String, success: @escaping (_ photosResult: FLPhotosResult) -> Void, failure: @escaping (_ returnError: FLError) -> Void) {
        
        self.queriesDictionary["text"] = "\(searchText)"
        self.queriesDictionary["page"] = "\(page)"
        let httpParameters = self.queriesDictionary.stringFromHttpParameters()
        let urlString = searchBaseURL.appending(httpParameters)
        
        if let url = URL(string: urlString) {
            let request = NSMutableURLRequest(url: url)
            
            let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
                
                if (error == nil) {
                    if let responseData = data {
                        do {
                            let photosResult = try JSONDecoder().decode(FLPhotosResult.self, from: responseData)
                            success(photosResult)
                        } catch {
                            failure(.jsonParseError)
                        }
                    } else {
                        failure(.responseError)
                    }
                } else {
                    failure(.networkFailureError)
                }
            }
            
            task.resume()
        }
    }
}
