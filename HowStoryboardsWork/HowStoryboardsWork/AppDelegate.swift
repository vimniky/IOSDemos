//
//  AppDelegate.swift
//  HowStoryboardsWork
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = window ?? UIWindow()
        window?.makeKeyAndVisible()
        
        // createStoryboardFromScrach()
        segueDemo()
        
        return true
    }
    
    func segueDemo() {
        let storyboard = UIStoryboard(name: "SegueDemo", bundle: nil)
        let rvc = storyboard.instantiateInitialViewController()
        window?.rootViewController = rvc
    }
    
    func createStoryboardFromScrach() {
        let storyboard = UIStoryboard.init(name: "MyMain", bundle: nil)
        let myInitialVC = storyboard.instantiateViewController(withIdentifier: "myInitialViewController")
        window?.rootViewController = myInitialVC
    }

}

