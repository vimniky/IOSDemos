//
//  ViewController.swift
//  Alert
//
//  Created by viky on 2/7/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var a = "test"
    var b = "test"
    var c = "test"
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showBasicAlert(_ sender: Any) {
        Alert.showBasicAlert(on: self, with: "Basic Alert", message: "No thing")
    }
    
}

