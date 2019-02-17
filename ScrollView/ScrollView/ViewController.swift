//
//  ViewController.swift
//  ScrollView
//
//  Created by viky on 2/16/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollViewDemo()
        // scrollViewUsingAutoLayoutDemo
        useingContentLayoutGuide()
    }
    
    func scrollViewDemo() {
        let sv = UIScrollView(frame: self.view.bounds)
        sv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(sv)
        sv.backgroundColor = .white
        var y : CGFloat = 10
        for i in 0 ..< 30 {
            let lab = UILabel()
            lab.text = "This is label \(i+1)"
            lab.sizeToFit()
            lab.frame.origin = CGPoint(x: 10,y: y)
            sv.addSubview(lab)
            y += lab.bounds.size.height + 10
        }
        var sz = sv.bounds.size
        sz.height = y
        sv.contentSize = sz // *
    }
    
    func scrollViewUsingAutoLayoutDemo() {
        let sv = UIScrollView(frame: self.view.bounds)
        sv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(sv)
        sv.backgroundColor = .white
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo:self.view.topAnchor),
            sv.leadingAnchor.constraint(equalTo:self.view.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
            ])
        
        var previousLab : UILabel? = nil
        
        for i in 0 ..< 50 {
            let lab = UILabel()
            lab.text = "This is label \(i+1)"
            // lab.sizeToFit()
            lab.translatesAutoresizingMaskIntoConstraints = false
            sv.addSubview(lab)
            lab.leadingAnchor.constraint(
                equalTo: sv.leadingAnchor, constant: 10).isActive = true
            lab.trailingAnchor.constraint(
                equalTo:sv.trailingAnchor).isActive = true
            lab.topAnchor.constraint(
                equalTo: previousLab?.bottomAnchor ?? sv.topAnchor,
                constant: 10).isActive = true
            previousLab = lab
            
        }
        
        sv.bottomAnchor.constraint(
            equalTo: previousLab!.bottomAnchor, constant: 10).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        sv.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func useingContentLayoutGuide() {
        let sv = UIScrollView()
        sv.backgroundColor = .white
        sv.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(sv)
        NSLayoutConstraint.activate([
            sv.topAnchor.constraint(equalTo:self.view.topAnchor),
            sv.bottomAnchor.constraint(equalTo:self.view.bottomAnchor),
            sv.leadingAnchor.constraint(equalTo:self.view.leadingAnchor),
            sv.trailingAnchor.constraint(equalTo:self.view.trailingAnchor),
            ])
        let svclg = sv.contentLayoutGuide
        var previousLab : UILabel? = nil
        for i in 0 ..< 50 {
            let lab = UILabel()
            // lab.backgroundColor = .red
            lab.translatesAutoresizingMaskIntoConstraints = false
            lab.text = "This is label \(i+1)"
            sv.addSubview(lab)
            lab.leadingAnchor.constraint(
                equalTo: svclg.leadingAnchor,
                constant: 10).isActive = true
            lab.topAnchor.constraint(
                // first one, pin to top; all others, pin to previous
                equalTo: previousLab?.bottomAnchor ?? svclg.topAnchor,
                constant: 10).isActive = true
            previousLab = lab
        }
        svclg.bottomAnchor.constraint(
            equalTo: previousLab!.bottomAnchor, constant: 10).isActive = true
        svclg.widthAnchor.constraint(equalToConstant:0).isActive = true // *
    }


}

