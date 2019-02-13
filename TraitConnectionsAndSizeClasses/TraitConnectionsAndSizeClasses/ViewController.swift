//
//  ViewController.swift
//  TraitConnectionsAndSizeClasses
//
//  Created by viky on 2/13/19.
//  Copyright © 2019 viky. All rights reserved.
//


import UIKit

class ViewController: UIViewController {

    //Read the documentation
    var myTrainCollection: UITraitCollection?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // The dimensional characteristics of the environment are embodied in a set of size classes which are vended by a view’s traitCollection property. Every view in the interface, from the window on down, as well as any view controller whose view is part of the interface, inherits from the environment the value of its traitCollection property, which it has by virtue of implementing the UITraitEnvironment protocol.
        
        // The traitCollection is a UITraitCollection, a value class. UITraitCollection was introduced in iOS 8; it has grown since then, and is now freighted with a considerable number of properties describing the environment. In addition to its displayScale (the screen resolution) and userInterfaceIdiom (the general device type, iPhone or iPad), a trait collection now also reports such things as the device’s force touch capa‐ bility and display gamut. But just two properties in particular concern us with regard to views in general:
            // horizontalSizeClass
            // verticalSizeClass
    }

}

