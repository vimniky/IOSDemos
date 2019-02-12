//
//  ViewController.swift
//  ViewControllerPresentation
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func go(_ sender: Any) {
        let svc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
        definesPresentationContext = true
        
        present(svc, animated: true, completion: nil)
    }
}

