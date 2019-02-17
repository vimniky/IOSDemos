//
//  ViewController.swift
//  Animation
//
//  Created by viky on 2/14/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var v: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let v = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        v.backgroundColor = .red
        self.v = v
        view.addSubview(v)
        // beginAndCommit()
        // blockBased()
        propertyAnimator()
    }
    
    func propertyAnimator() {
       let anim =  UIViewPropertyAnimator(duration: 1.0, curve: .linear) {
            self.v.backgroundColor = .blue
        }
        anim.addAnimations {
            self.v.center.y += 100
        }
        anim.addCompletion { (UIViewAnimatingPosition) in
            self.v.removeFromSuperview()
        }
        anim.startAnimation()
    }
    
    func blockBased() {
        UIView.animate(withDuration: 1) {
            self.v.backgroundColor = .orange
        }
    }
    
    func beginAndCommit() {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(1)
        v.backgroundColor = .green
        UIView.commitAnimations()
    }

}

