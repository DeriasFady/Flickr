//
//  AppDelegate.swift
//  Flickr
//
//  Created by Fady Derias on 3/26/20.
//  Copyright © 2020 Andela. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .white
        let homeSearchTableViewController = HomeSearchTableViewController()
        window?.rootViewController = UINavigationController(rootViewController: homeSearchTableViewController)
        setAppearance()
        return true
    }
    
    func setAppearance() {
        self.window?.backgroundColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
    }
}

