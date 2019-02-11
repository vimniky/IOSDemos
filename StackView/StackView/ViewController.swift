//
//  ViewController.swift
//  StackView
//
//  Created by viky on 2/10/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v1 = UIView()
        let v2 = UIView()
        let v3 = UIView()
        v1.backgroundColor = .red
        v2.backgroundColor = .black
        v3.backgroundColor = .green
        
        let sv = UIStackView(arrangedSubviews: [v1, v2, v3])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.alignment = .fill
        sv.backgroundColor = .gray
        sv.spacing = 10
        view.addSubview(sv)
        sv.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                sv.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                sv.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                sv.widthAnchor.constraint(equalToConstant: 240),
                sv.heightAnchor.constraint(equalToConstant: 360),
            ])
    }
}

