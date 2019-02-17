//
//  ViewController.swift
//  ViewControllerPresentation
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        definesPresentationContext = true
        providesPresentationContextTransitionStyle = true
        modalTransitionStyle = .partialCurl
    }
    
    @IBAction func next(_ sender: Any) {
        let svc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
        present(svc, animated: true, completion: nil)
    }
}

