//
//  ViewController.swift
//  IOSAppConcepts
//
//  Created by viky on 2/8/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

// TODO - Questions
// 1. How to use a nib in more than one place? (Nib/Component reuse)

class ViewController: UIViewController {
    // MARK: - Outlet connection
    @IBOutlet weak var nibViewLabel: UILabel!
    // Right Click -> Refactor -> Rename
    // Don't rename directly, or it will crash at run time
    @IBOutlet weak var nibViewBRenamed: UIView!
    
    fileprivate func loadNibB() {
        Bundle.main.loadNibNamed("NibViewB", owner: self, options: nil)
        view.addSubview(nibViewBRenamed)
    }
    
    fileprivate func loadNibA() {
        // return a array of top-level nib objects
        // We only have one top-level object –– the UIView, so it is sufficient to
        // capture the first element
        let arr = Bundle.main.loadNibNamed("NibViewA", owner: self)!
        for item in arr {
            print("There's only one element, that is the UIView element: \(item)")
        }
        // Add it to the view heiarchy
        let v = arr[0] as! UIView
        view.addSubview(v)
        
        nibViewLabel.text = nibViewLabel.text! + ": Updated!"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadNibA()
        loadNibB()
    }

    // MARK: - Action connection
    
    // The @IBAction atrribute is like the @IBOutlet attribute: it's a hint to Xcode, asking Xcode to make this method available in the nibeditor
    @IBAction func buttonPressed(_ sender: UIButton?) {
        print("pressed")
    }

}

