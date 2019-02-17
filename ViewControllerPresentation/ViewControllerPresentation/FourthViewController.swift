//
//  FourthViewController.swift
//  ViewControllerPresentation
//
//  Created by viky on 2/17/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class FourthViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func first(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        present(vc, animated: true, completion: nil)
    }
    @IBAction func second(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SecondViewController")
        present(vc, animated: true, completion: nil)
    }
    @IBAction func third(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ThirdViewController")
        present(vc, animated: true, completion: nil)
    }
}
