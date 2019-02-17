//
//  RootViewController.swift
//  HowViewControllerGetsItsMainView
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    
    override var prefersStatusBarHidden : Bool {
        return isHiddenStatuBar
    }
    
    var isHiddenStatuBar = false
    
    fileprivate func createViewInCode() {
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
    
    override func viewDidLoad() {
        // super.viewDidLoad()
        
        createViewInCode()
    }
}
