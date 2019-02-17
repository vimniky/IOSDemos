//
//  ViewController.swift
//  TouchAndGuestureRecongnizer
//
//  Created by viky on 2/14/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var dest = CGPoint(x: 0.0, y: 0.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let v = UIView(frame: CGRect(x: 100, y: 200, width: 100, height: 30))
        v.backgroundColor = .red
        dest = v.center
        view.addSubview(v)
        
        let r = UITapGestureRecognizer(target: self, action: #selector(singleTap))
        r.numberOfTapsRequired = 1
        v.addGestureRecognizer(r)
        
        let r2 = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        r2.numberOfTapsRequired = 2
        v.addGestureRecognizer(r2)
        
        r.require(toFail: r2)
        
        let r3 = UIPanGestureRecognizer(target: self, action: #selector(pan))
        v.addGestureRecognizer(r3)
        
        let v4 =  UITapGestureRecognizer(target: self, action: #selector(rootViewTapped))
        v4.numberOfTapsRequired = 1
        view.addGestureRecognizer(v4)
        
    }
    
    @objc func rootViewTapped() {
        print("Root View tapped")
    }
    
    @objc func pan(_ p : UIPanGestureRecognizer) {
        let v = p.view!
        switch p.state {
        case .began, .changed:
            let delta = p.translation(in: v.superview)
            var c = v.center
            c.x += delta.x
            c.y += delta.y
            v.center = c
            p.setTranslation(.zero, in: v.superview)
        case .ended, .cancelled:
            let vel = p.velocity(in: v.superview!)
            let c = v.center
            let distx = abs(c.x - dest.x)
            let disty = abs(c.y - dest.y)
            let anim = UIViewPropertyAnimator(
                duration: 0.4,
                timingParameters: UISpringTimingParameters(
                    dampingRatio: 0.6,
                    initialVelocity: CGVector(dx: vel.x/distx, dy: vel.y/disty)))
            anim.addAnimations {
                v.center = self.dest
            }
            anim.startAnimation()
        default:
            break
        }
    }
    
    @IBAction func redViewTapped(_ sender: UITapGestureRecognizer) {
        print("tapped")
    }
    
    
    @objc func doubleTap(_ dt: UITapGestureRecognizer) {
        switch dt.state {
        case .ended:
            print("double tap")
        case .cancelled:
            print("double tap canceled")
        default:
            break
        }
    }
    
    @objc func singleTap(_ t: UITapGestureRecognizer) {
        
        switch t.state {
        case .ended:
            print("single tap")
        case .cancelled:
            print("single tap canceled")
        default:
            break
        }
    }
    
}

