//
//  SecondTabItemViewController.swift
//  HowStoryboardsWork
//
//  Created by viky on 2/17/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class SecondTabItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func unwindToSecondTabItemViewController(_ unwindSegue: UIStoryboardSegue) {
        // let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        print("unwind")
    }
    
}
