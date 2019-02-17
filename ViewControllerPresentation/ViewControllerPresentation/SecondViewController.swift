//
//  SecondViewController.swift
//  ViewControllerPresentation
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBAction func prev(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
        // Or
        // dismiss(animated: true, completion: nil)
    }
    
    @IBAction func next(_ sender: Any) {
        let tvc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController")
        present(tvc, animated: true, completion: nil)
    }
}
