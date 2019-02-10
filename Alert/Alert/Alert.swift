//
//  Alert.swift
//  Alert
//
//  Created by viky on 2/7/19.
//  Copyright © 2019 viky. All rights reserved.
//

import Foundation
import UIKit

class Alert {
    static func showBasicAlert(on viewController: UIViewController, with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
