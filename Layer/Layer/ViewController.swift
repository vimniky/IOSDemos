//
//  ViewController.swift
//  Layer
//
//  Created by viky on 2/14/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        let l1 = CALayer()
        l1.frame = CGRect(x: 50, y: 100, width: 300, height: 450)
        l1.backgroundColor = UIColor.red.cgColor
        
        let l2 = CALayer()
        l2.frame = CGRect(x: 50, y: 50, width: 100, height: 100)
        l2.backgroundColor = UIColor.blue.cgColor
        l1.addSublayer(l2)
        
        let l3 = CALayer()
        l3.backgroundColor = UIColor.green.cgColor
        l3.bounds.size.width = 100
        l3.bounds.size.height = 100
        l3.position = CGPoint(x: 50, y: 200)
        l3.anchorPoint = CGPoint(x: 0.75, y: 0.75)
        l1.addSublayer(l3)
        
        let l4 = CALayer()
        l4.backgroundColor = UIColor.orange.cgColor
        l4.bounds.size.width = 25
        l4.bounds.size.height = 25
        l4.position = CGPoint(x: 50.0, y: 200.0)
        l4.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        l1.addSublayer(l4)
        
        let l5 = CALayer()
        l5.backgroundColor = UIColor.orange.cgColor
        l5.bounds.size.width = 25
        l5.bounds.size.height = 25
        l5.position = CGPoint(x: 25.0, y: 175.0)
        l5.anchorPoint = CGPoint(x: 0.0, y: 0.0)
        l1.addSublayer(l5)
        
        print(l2.position)
        print(l2.anchorPoint)
        
        view.layer.addSublayer(l1)

    }
}

