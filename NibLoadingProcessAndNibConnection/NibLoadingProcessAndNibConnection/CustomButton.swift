//
//  CustomButton.swift
//  NibLoadingProcessAndNibConnection
//
//  Created by viky on 2/9/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
        }
        get {
            guard let color = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: color)
        }
    }
    
    // The awakeFromNib message is sent to all nib-initantiated objects just after they are instantiated by the loading of the nib
    override func awakeFromNib() {
        backgroundColor = .red
    }
}

// See: https://stackoverflow.com/questions/12301256/is-it-possible-to-set-uiview-border-properties-from-interface-builder/17993890#17993890

extension CALayer {
    var borderUIColor: UIColor {
        set {
            self.borderColor = newValue.cgColor
        }
        get {
            return UIColor(cgColor: self.borderColor!)
        }
    }
}
