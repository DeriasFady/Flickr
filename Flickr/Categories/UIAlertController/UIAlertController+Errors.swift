//
//  UIAlertController+Errors.swift
//  Flickr
//
//  Created by Fady Derias on 3/27/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func serverErrorAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Alert",
                                                message: "Sorry, there's a server side problem, please try again later.",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        return alertController
    }
    
    static func connectionErrorAlertController() -> UIAlertController {
        let alertController = UIAlertController(title: "Alert",
                                                message: "Please check your internet connection.",
                                                preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        return alertController
    }
}
