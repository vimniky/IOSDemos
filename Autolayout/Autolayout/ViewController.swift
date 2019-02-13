//
//  ViewController.swift
//  Autolayout
//
//  Created by viky on 2/10/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // autolayoutDemo()
        // autolayoutUsingAnchorNotation()
        // autolayoutDemoUsingVisualFormat()
        // moreOnVisualFormat()
        // safeAreaAndLayoutMarginsGuide()
        customLayoutGuideDemo()
    }
    
    fileprivate func autolayoutDemo() {
        let v = UIView()
        v.backgroundColor = .black
        let v1 = UIView()
        v1.backgroundColor = .orange
        let v2 = UIView()
        v2.backgroundColor = .cyan
        
        view.addSubview(v)
        v.addSubview(v1)
        v.addSubview(v2)
        
        // It's super important
        v.translatesAutoresizingMaskIntoConstraints = false
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addConstraint(
            NSLayoutConstraint(
                item: v,
                attribute: .centerX,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerX,
                multiplier: 1,
                constant: 0
            )
        )
        
        view.addConstraint(
            NSLayoutConstraint(
                item: v,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: view,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v,
                attribute: .width,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 240
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v,
                attribute: .height,
                relatedBy: .equal,
                toItem: nil,
                attribute: .notAnAttribute,
                multiplier: 1,
                constant: 128
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v1,
                attribute: .leading,
                relatedBy: .equal,
                toItem: v,
                attribute: .leading,
                multiplier: 1,
                constant: 10
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v1,
                attribute: .top,
                relatedBy: .equal,
                toItem: v,
                attribute: .top,
                multiplier: 1,
                constant: 10
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v1,
                attribute: .bottom,
                relatedBy: .equal,
                toItem: v,
                attribute: .bottom,
                multiplier: 1,
                constant: -10
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v2,
                attribute: .trailing,
                relatedBy: .equal,
                toItem: v,
                attribute: .trailing,
                multiplier: 1,
                constant: -10
            )
        )
        
        v.addConstraint(
            NSLayoutConstraint(
                item: v1,
                attribute: .centerY,
                relatedBy: .equal,
                toItem: v2,
                attribute: .centerY,
                multiplier: 1,
                constant: 0
            )
        )
        
        // Horizontal spece between v1 and v2
        v.addConstraint(
            NSLayoutConstraint(
                item: v2,
                attribute: .leading,
                relatedBy: .equal,
                toItem: v1,
                attribute: .trailing,
                multiplier: 1,
                constant: 10
            )
        )
        
        // v1.height = v2.height
        v.addConstraint(
            NSLayoutConstraint(
                item: v2,
                attribute: .width,
                relatedBy: .equal,
                toItem: v1,
                attribute: .width,
                multiplier: 1,
                constant: 0
            )
        )
        
        // v1.width = v2.width
        v.addConstraint(
            NSLayoutConstraint(
                item: v2,
                attribute: .height,
                relatedBy: .equal,
                toItem: v1,
                attribute: .height,
                multiplier: 1,
                constant: 0
            )
        )
    }
    
    fileprivate func autolayoutUsingAnchorNotation() {
        // autolayoutDemo()
        
        let v = UIView()
        v.backgroundColor = .black
        let v1 = UIView()
        v1.backgroundColor = .red
        let v2 = UIView()
        v2.backgroundColor = .green
        
        view.addSubview(v)
        v.addSubview(v1)
        v.addSubview(v2)
        
        // It's super important
        v.translatesAutoresizingMaskIntoConstraints = false
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            v.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            v.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            v.widthAnchor.constraint(equalToConstant: 240),
            v.heightAnchor.constraint(equalToConstant: 128),
            v1.leadingAnchor.constraint(equalTo: v.leadingAnchor, constant: 10),
            v1.topAnchor.constraint(equalTo: v.topAnchor, constant: 10),
            v1.bottomAnchor.constraint(equalTo: v.bottomAnchor, constant: -10),
            v1.centerYAnchor.constraint(equalTo: v2.centerYAnchor),
            v2.heightAnchor.constraint(equalTo: v1.heightAnchor),
            v2.widthAnchor.constraint(equalTo: v1.widthAnchor),
            v2.leadingAnchor.constraint(equalTo: v1.trailingAnchor, constant: 10),
            v2.trailingAnchor.constraint(equalTo: v.trailingAnchor, constant: -10),
        ])
        
    }

    fileprivate func autolayoutDemoUsingVisualFormat() {
        // Visual format
        // "<orientation>:?<superview><connection>?[view](<connection><view>*<connection><superview>?"
        // H            ––> vertical, the defualt
        // V            ––> horizontal
        // <=, >=       ––> less than, greater than
        // |            ––> superview
        // @            ––> priority
        // -            ––> standard space
        // ==           ––> equal width
        
        //        NSLayoutConstraint.constraints(
        //            withVisualFormat: <#T##String#>,
        //            options: <#T##NSLayoutConstraint.FormatOptions#>,
        //            metrics: <#T##[String : Any]?#>,
        //            views: <#T##[String : Any]#>
        //        )
        
        let v = UIView()
        v.backgroundColor = .black
        let v1 = UIView()
        v1.backgroundColor = .orange
        let v2 = UIView()
        v2.backgroundColor = .cyan
        
        view.addSubview(v)
        v.addSubview(v1)
        v.addSubview(v2)
        
        // It's super important
        v.translatesAutoresizingMaskIntoConstraints = false
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["superview": view!, "v": v, "v1": v1, "v2": v2]
        let metrics = ["gutter": 10, "padding": 10]
        
        // How to centering a view in it's superview: https://github.com/evgenyneu/center-vfl
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:[superview]-(<=1)-[v(240)]",
                options: .alignAllCenterY,
                metrics: metrics,
                views: views),
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:[superview]-(<=1)-[v(128)]",
                options: .alignAllCenterX,
                metrics: metrics,
                views: views),
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-(padding)-[v1(==v2)]-(gutter)-[v2]-(padding)-|",
                options: .alignAllCenterY,
                metrics: metrics,
                views: views),
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-(padding)-[v1(==v2)]-(padding)-|",
                options: [],
                metrics: metrics,
                views: views),
            ].flatMap {$0})
    }
    
    fileprivate func moreOnVisualFormat() {
        
        let v = UIView()
        v.backgroundColor = .gray
        
        let v1 = UIView()
        v1.backgroundColor = .orange
        let v2 = UIView()
        v2.backgroundColor = .cyan
        let v3 = UIView()
        v3.backgroundColor = .red
        let v4 = UIView()
        v4.backgroundColor = .green
        let v5 = UIView()
        v5.backgroundColor = .yellow
        
        view.addSubview(v)
        v.addSubview(v1)
        v.addSubview(v2)
        v.addSubview(v3)
        v.addSubview(v4)
        v.addSubview(v5)
        
        // It's super important
        v.translatesAutoresizingMaskIntoConstraints = false
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        v4.translatesAutoresizingMaskIntoConstraints = false
        v5.translatesAutoresizingMaskIntoConstraints = false
        
        let views = ["superview": view!, "v": v, "v1": v1, "v2": v2, "v3": v3, "v4": v4, "v5": v5]
        let metrics = ["gutter": 10]
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v]-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v]-|", options: [], metrics: metrics, views: views),
            
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v1(==v2,==v3,==v4)]-(gutter)-[v2]-(gutter)-[v3]-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "H:|-[v4]", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v1(==v4)]-(gutter)-[v4]-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v2]-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:|-[v3]-|", options: [], metrics: metrics, views: views),
            
            NSLayoutConstraint.constraints(withVisualFormat: "H:[v5(50)]-0-|", options: [], metrics: metrics, views: views),
            NSLayoutConstraint.constraints(withVisualFormat: "V:[v5(50)]-0-|", options: [], metrics: metrics, views: views),
            ].flatMap {$0})
    }
    
    fileprivate func safeAreaAndLayoutMarginsGuide() {
        additionalSafeAreaInsets.top = 50
        // additionalSafeAreaInsets.bottom = 50
        // additionalSafeAreaInsets.left = 50
        // additionalSafeAreaInsets.right = 50
        
        let v = UIView()
        v.backgroundColor = .red
        v.translatesAutoresizingMaskIntoConstraints = false
        // Add subview first, or it will crash at run time
        view.addSubview(v)
        
        let v1 = UIView()
        v1.backgroundColor = .green
        v1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v1)
        
        let v2 = UIView()
        v2.backgroundColor = .gray
        v2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(v2)
        
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: view.topAnchor),
            v.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            v1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            v1.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            v1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            v1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            ])
        
        NSLayoutConstraint.activate([
            v2.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
            v2.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor),
            v2.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            v2.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            ])
    }
    
    func customLayoutGuideDemo() {
        let v = UIView()
        v.backgroundColor = .gray
        
        
        let v1 = UIView()
        v1.backgroundColor = .red
        
        let v2 = UIView()
        v2.backgroundColor = .green
        
        let v3 = UIView()
        v3.backgroundColor = .orange
        
        let v4 = UIView()
        v4.backgroundColor = .cyan
        
        v.translatesAutoresizingMaskIntoConstraints = false
        v1.translatesAutoresizingMaskIntoConstraints = false
        v2.translatesAutoresizingMaskIntoConstraints = false
        v3.translatesAutoresizingMaskIntoConstraints = false
        v4.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(v)
        view.addSubview(v1)
        view.addSubview(v2)
        view.addSubview(v3)
        view.addSubview(v4)
        
        let views = [v1, v2, v3, v4]
        
        let guides = [
            UILayoutGuide(),
            UILayoutGuide(),
            UILayoutGuide(),
        ]
        
        for guide in guides {
            view.addLayoutGuide(guide)
        }
        
        NSLayoutConstraint.activate([
            v.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            v.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            v.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            v.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            guides[0].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            guides[1].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            guides[2].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            // Guides widthAnchor are aibitrary here,
            guides[0].widthAnchor.constraint(equalToConstant: 1),
            guides[1].widthAnchor.constraint(equalToConstant: 1),
            guides[2].widthAnchor.constraint(equalToConstant: 1),
            guides[1].heightAnchor.constraint(equalTo: guides[0].heightAnchor),
            guides[2].heightAnchor.constraint(equalTo: guides[0].heightAnchor),
            
            views[0].bottomAnchor.constraint(equalTo: guides[0].topAnchor),
            views[1].bottomAnchor.constraint(equalTo: guides[1].topAnchor),
            views[2].bottomAnchor.constraint(equalTo: guides[2].topAnchor),
            
            views[1].topAnchor.constraint(equalTo: guides[0].bottomAnchor),
            views[2].topAnchor.constraint(equalTo: guides[1].bottomAnchor),
            views[3].topAnchor.constraint(equalTo: guides[2].bottomAnchor),
            
            views[0].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            views[0].trailingAnchor.constraint(equalTo: v.trailingAnchor),
            views[1].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            views[1].trailingAnchor.constraint(equalTo: v.trailingAnchor),
            views[2].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            views[2].trailingAnchor.constraint(equalTo: v.trailingAnchor),
            views[3].leadingAnchor.constraint(equalTo: v.leadingAnchor),
            views[3].trailingAnchor.constraint(equalTo: v.trailingAnchor),
            
            views[0].topAnchor.constraint(equalTo: v.topAnchor),
            views[0].heightAnchor.constraint(equalToConstant: 60),
            views[1].heightAnchor.constraint(equalTo: views[0].heightAnchor),
            views[2].heightAnchor.constraint(equalTo: views[0].heightAnchor),
            views[3].heightAnchor.constraint(equalTo: views[0].heightAnchor),
            views[3].bottomAnchor.constraint(equalTo: v.bottomAnchor),
            ])
    }
    
}

