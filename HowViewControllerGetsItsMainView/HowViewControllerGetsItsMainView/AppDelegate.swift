//
//  AppDelegate.swift
//  HowViewControllerGetsItsMainView
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//



//1. When the view controller first decides that it needs its view, loadView is always called:
//• If we override loadView, we supply and set the view in code, and we do not call super. Therefore, the process of seeking a view comes to an end.
//• If we don’t override loadView, UIViewController’s built-in default imple‐ mentation of loadView takes over, and performs the rest of the process.
//2. UIViewController’s default implementation of loadView looks for a nib:
//• If the view controller was instantiated with an explicit nibName:, a nib with that name is sought, and the process comes to an end. (If there is no such nib, the app will crash at launch.)
//• If the view controller was instantiated with a nil nibName:, then:
//1. An eponymous nib is sought. If it is found, it is loaded and the process
//comes to an end.
//2. If the view controller’s name ends in “Controller,” an eponymous nib without the “Controller” is sought. If it is found, it is loaded and the process comes to an end.
//3. If we reach this point, UIViewController’s default implementation of loadView creates a generic UIView.

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = window ?? UIWindow()
        // let rv = RootViewController()
        
        // Load from nib
        // Don't forget to connect the File’s Owner view outlet to the View object.
        
        // let rv = RootViewController(nibName: "ViewFromNib", bundle: nil)
        // let rv = RootViewController()
        let rv = WithXibFileController()
        window?.rootViewController = rv
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        return true
    }
}



