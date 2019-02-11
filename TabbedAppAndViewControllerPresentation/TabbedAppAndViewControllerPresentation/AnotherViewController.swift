//
//  AnotherViewController.swift
//  TabbedApp
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

protocol AnotherViewControllerDelegate: class {
    func dismissWithData(data: String, animated: Bool, compelition: (() -> ())?)
}

class AnotherViewController: UIViewController {

    var data: String?
    weak var delegate: AnotherViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(presentingViewController == view.window?.rootViewController)
        print(data!)
    }
    
    @IBAction func back(_ sender: Any) {
        self.delegate?.dismissWithData(data: "Data pass to back FirstViewController", animated: true, compelition: nil)
    }
}
