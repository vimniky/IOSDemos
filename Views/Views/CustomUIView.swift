//
//  CustomUIView.swift
//  Views
//
//  Created by viky on 2/9/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class CustomUIView: UIView {

    override func willRemoveSubview(_ subview: UIView) {
        super.willRemoveSubview(subview)
    }
    
    override func willMove(toSuperview newSuperview: UIView?) {
        super.willMove(toSuperview: newSuperview)
        print("willMove to Super View")
    }
}
