//
//  AppDelegate.swift
//  ios-mvp-pattern-example
//
//  Created by Ivan Podibka on 10/08/2018.
//  Copyright © 2018 Ivan Podibka. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

}

extension UIApplication {
    
    func defaultAppDelegate() -> AppDelegate {
        return delegate as! AppDelegate
    }
    
}

