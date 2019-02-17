//
//  ThridViewController.swift
//  ViewControllerPresentation
//
//  Created by viky on 2/17/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ThridViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func first(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()!
        present(vc, animated: true, completion: nil)
    }
    @IBAction func previous(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    @IBAction func next(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FourthViewController")
        present(vc, animated: true, completion: nil)
    }
}
