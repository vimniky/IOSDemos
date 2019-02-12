//
//  AppDelegate.swift
//  TabBarController
//
//  Created by viky on 2/12/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        createTabBarControllerManually()
        return true
    }
    
    func createTabBarControllerManually() {
        window = window ?? UIWindow()
        window?.backgroundColor = .gray
        window?.makeKeyAndVisible()
        let tabBarVC = UITabBarController()
        window?.rootViewController = tabBarVC
        
        let v1 = UIViewController()
        v1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 1)
        let v2 = UIViewController()
        v2.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        let v3 = UIViewController()
        v3.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        
        tabBarVC.viewControllers = [v1, v2, v3]
        tabBarVC.selectedIndex = 1
        
        v1.view.backgroundColor = .red
        v2.view.backgroundColor = .green
        v3.view.backgroundColor = .cyan
    }
}

