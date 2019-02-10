//
//  ViewController.swift
//  Autoresizing
//
//  Created by viky on 2/10/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // addViews()
        let w = view.bounds.width
        let h = view.bounds.height
        let v = UIView(frame: CGRect(x: w / 2 - 100, y: h / 2 - 100, width: 200, height: 200))
        v.backgroundColor = .red
        v.autoresizingMask = [
            .flexibleWidth,
            .flexibleTopMargin,
            .flexibleBottomMargin,
        ]
        view.addSubview(v)
    }
    
    func addViews() {
        let w = view.bounds.width
        let h = view.bounds.height
        
        let v1 = UIView(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        v1.backgroundColor = .black
        view.addSubview(v1)
        
        let v2 = UIView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        v2.backgroundColor = .red
        v1.addSubview(v2)
        
        
        let v3 = UIView(frame: CGRect(x: w - 150, y: h - 150, width: 100, height: 100))
        v3.autoresizingMask = [.flexibleTopMargin, .flexibleLeftMargin]
        v3.backgroundColor = .red
        view.addSubview(v3)
        
        let vCentered = UIView(frame: CGRect(x: w / 2 - 50, y: h / 2 - 50, width: 100, height: 100))
        vCentered.backgroundColor = .green
        vCentered.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin,
            .flexibleBottomMargin,
        ]
        
        view.addSubview(vCentered)
    }

}

