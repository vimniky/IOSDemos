//
//  CustomUIView.swift
//  Views
//
//  Created by viky on 2/9/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // When a UIView is instantiated from a nib, its init(frame:) is not called — init(coder:) is called instead. (Implementing init(frame:) in a UIView subclass, and then wondering why your code isn’t called when the view is instantiated from a nib, is a common beginner mistake.)
        print("Instanciated from code")
        layer.borderWidth = 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.borderWidth = 6
        print("Instanciated from xib/storyboard")
    }
    
    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("willMove to Super View")
    }
}
