//
//  main.swift
//  AppLaunchProcess
//
//  Created by viky on 2/8/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

// Regardless of whether you write your own main.swift file or you rely on the Swift @UIApplicationMain attrribute,
// You are calling UIApplicationMain. This is one function call is the primary thing your app does.

// 1. UIApplicationMain creates your app's first instance –– the shared application instance
// which is going to be accessible in your code as UIApplication.shared
// 2. UIApplicationMain also creates your app's second instance –– the application instance's delegate
// 3. If there is a main storyboard (specified in the Info.plist file), UIApplicationMain loads it and
// looks inside it to find the view controller that is designated as this storyboard's intial veiw controller
// (or storyboard's entry point); it instantiates this view controller, thus creating your app's third instance,
// a UIViewController subclass.
// 4. If there's a main storyboard, UIApplicationMain now creates your app's window –– this is your app's
// fourth instance, an instance of UIWindow. It assigns this window instance as the app delegate's window property;
// it also assigns the initial view controller instance as the window instance's rootViewController property. This
// veiw controller is now the app's root view controller
// 5. UIApplicationMain now turns to the app delegate instance and starts calling some of its code, such as
// application(:_didFinishLaunchingWithOptions:).
// 6. If there's a main storyboard, UIApplicationMain now causes your app's interface to appear. It does this by calling
// the UIWindow instance method makeKeyAndVisible
// The window is now about to appear. This, in turn, causes the window to turn to the root view controller and tell it
// to obtain its main view, which will iccupy and appear in the window. If this view controller gets its view from a
// .storyboard or .xib file, that view nib file is now loaded; its objects are instantiated and initialized, and they
// become the objects of the initial interface: the view is placed into the window, where it and its subviews are visible
// to the user. The view controller's viewDidLoad is called at this time

// The app is now launched and running! It has an intital set of instances –– at a minimum:
    // 1. The shared application
    // 2. The window
    // 3. The initial view controller
    // 4. The initial view controller's view and whatever interface objects it contains
// Some of your code has run, and we are now off to the races: UIApplicationMain is still running,
// and is just sitting, watching for the user to do something, maintaining the event loop, which will
// respond to user's actions as they occur. Henceforth, your app's code will be called only in response to
// Cocoa events.

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = self.window ?? UIWindow()
        self.window!.rootViewController = UIViewController()
        self.window!.makeKeyAndVisible()
        self.window!.backgroundColor = .red
        return true
    }
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(AppDelegate.self)
)
