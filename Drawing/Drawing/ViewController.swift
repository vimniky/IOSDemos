//
//  ViewController.swift
//  Drawing
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let v = CustomDraw(frame: view.frame)
        v.backgroundColor = .gray
        view.addSubview(v)
    }


}

