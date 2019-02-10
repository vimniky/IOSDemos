//
//  LoginViewController.swift
//  Navigation
//
//  Created by viky on 2/7/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func login(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let navigationController = mainStoryboard.instantiateViewController(withIdentifier: "MainNavigationController")
        present(navigationController, animated: true, completion: nil)
    }

}

class A: UINavigationController {
    
}
