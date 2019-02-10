//
//  ViewController.swift
//  Views
//
//  Created by viky on 2/9/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var v: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
    }
    
    func keyPoints() {
        // A view can be assigned a background color through its backgroundColor property. A color is a UIColor. A view whose background color is nil (the default) has a trans‐ parent background. If such a view does no additional drawing of its own, it will be invisible! Such a view is perfectly reasonable, however; for example, a view with a transparent background might act as a convenient superview to other views, making them behave together.
        
        // A view’s isOpaque property, on the other hand, is a horse of a different color; chang‐ ing it has no effect on the view’s appearance. Rather, this property is a hint to the drawing system. If a view is completely filled with opaque material and its alpha is 1.0, so that the view has no effective transparency, then it can be drawn more effi‐ ciently (with less drag on performance) if you inform the drawing system of this fact by setting its isOpaque to true. Otherwise, you should set its isOpaque to false. The isOpaque value is not changed for you when you set a view’s backgroundColor or alpha! Setting it correctly is entirely up to you; the default, perhaps surprisingly, is true.
        
        // When a UIView is instantiated from a nib, its init(frame:) is not called — init(coder:) is called instead. (Implementing init(frame:) in a UIView subclass, and then wondering why your code isn’t called when the view is instantiated from a nib, is a common beginner mistake.)
        
        // A view’s frame property, a CGRect, is the position of its rectangle within its super‐ view, in the superview’s coordinate system.
        
        // Every view has its own coordinate system, expressed by its bounds, and that a view’s coordinate system has a clear relationship to its superview’s coordi‐ nate system, expressed by its center.
        
        // If you change a view’s bounds size, you change its frame. The change in the view’s frame takes place around its center, which remains unchanged. A view’s bounds and center are orthogonal (independ‐ ent), and completely describe the view’s size and its position within its superview.
    }
    
    func waysToReferenceTheMainWindow() {
        // How to reference to the window instance
        // 1. view?.window
        // 2. UIApplication.shared.delegate?.window!
        // 3. UIApplication.shared.delegate?.keyWindow (maybe or maybe not the Main Window)
        // mainWindow?.rootViewController -> which in this case is `self` (the ViewController instance itself)
    }
    
    func addViews() {
        let v = CustomUIView(frame: CGRect(x: 100, y: 100, width: 80, height: 80))
        v.backgroundColor = .red
        view.addSubview(v)
        
        let subView = CustomUIView(frame: CGRect(x: 60, y: 60, width: 40, height: 40))
        subView.backgroundColor = .green
        v.clipsToBounds = true
        v.addSubview(subView)
        
        print(subView.isDescendant(of: view)) // true
        print(subView.superview === v) // true
        print(view.subviews.count) // 1
        print(v.subviews.count) // 1
        self.v = subView
        // subView is a direct subview of v, v is a direct subview of view
        // The following line will move subView from `v` to `view`
        // view.addSubview(subView)
        
        // View Methods
        // view.insertSubview(_:at:)
        // view.insertSubview(:aboveSubview:)
        // view.insertSubview(:belowSubview:)
        // ...
        
        let v1 = UIView(frame: CGRect(x: 100, y: 200, width: 120, height: 120))
        v1.backgroundColor = .red
        let v2 = UIView(frame: v1.bounds.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)))
        v2.backgroundColor = .green
        view.addSubview(v1)
        v1.addSubview(v2)
        
        v2.transform = CGAffineTransform(rotationAngle: 45 * .pi / 180)
        // v2.bounds.size.height += 10
        // v2.bounds.size.width += 10
    }
    
    @IBAction func move(_ sender: Any) {
        if v?.frame.height == 60 {
            v?.frame = CGRect(x: 60, y: 60, width: 40, height: 40)
        } else {
            v?.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        }
    }
    
    func removeAllSubViews(from superView: UIView) {
        superView.subviews.forEach {$0.removeFromSuperview()}
    }
    
    func viewProperties() {
        // view.isHidden
        // view.alpha
        // view.backgroundColor
        // view.isOpaque
        // view.isFocused
        // view.frame
        // view.bounds
        // view.transform
        // view.layer
        // view.traitCollection
        // ...
    }
}

