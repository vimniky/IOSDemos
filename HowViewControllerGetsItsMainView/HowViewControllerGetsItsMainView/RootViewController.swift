//
//  RootViewController.swift
//  HowViewControllerGetsItsMainView
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    fileprivate func populateView() {
        let v = UIView()
        v.backgroundColor = .green
        self.view = v
        let label = UILabel()
        v.addSubview(label)
        label.text = "Hello, World!"
        label.autoresizingMask = [
            .flexibleTopMargin,
            .flexibleLeftMargin,
            .flexibleBottomMargin,
            .flexibleRightMargin]
        label.sizeToFit()
        label.center = CGPoint(x: v.bounds.midX, y: v.bounds.midY)
        label.frame = label.frame.integral
    }
    
    // override func loadView() {
        // When we created our view controller’s view (self.view), we never gave it a reason‐ able frame. This is because we are relying on someone else to frame the view appro‐ priately. In this case, the “someone else” is the window, which responds to having its rootViewController property set to a view controller by framing the view control‐ ler’s view appropriately as the root view before putting it into the window as a sub‐ view. In general, it is the responsibility of whoever puts a view controller’s view into the interface to give the view the correct frame — and this will never be the view con‐ troller itself
        
        // Indeed, the size of a view controller’s view may be changed as it is placed into the interface, and you must keep in mind, as you design your view controller’s view and its subviews, that this can happen
        
        // If we don’t implement loadView, and if no view is supplied in any other way, then UIViewController’s default implementation of loadView will do exactly what we are doing: it creates a generic UIView object and assigns it to self.view.
        
         // populateView()
    // }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // A more appropriate place to populate a view controller’s view is its view- DidLoad implementation, which is called after the view exists and can be referred to as self.view.
        
        // populateView()
    }
}
