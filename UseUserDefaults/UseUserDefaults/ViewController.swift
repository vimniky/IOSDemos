//
//  ViewController.swift
//  UseUserDefaults
//
//  Created by viky on 2/7/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let defaults = UserDefaults.standard
    
    var isDarkMode = false {
        didSet {
            if isDarkMode {
                view.backgroundColor = .gray
            } else {
                view.backgroundColor = .white
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkDarkMode()
    }
    
    @IBAction func setLightMode() {
        isDarkMode = false
        defaults.set(false, forKey: "isDarkMode")
    }
    
    @IBAction func setDarkMode() {
        isDarkMode = true
        defaults.set(true, forKey: "isDarkMode")
    }
    
    func checkDarkMode() {
        isDarkMode = defaults.bool(forKey: "isDarkMode")
        
        if isDarkMode {
            setDarkMode()
        } else {
            setLightMode()
        }
    }
    
}

