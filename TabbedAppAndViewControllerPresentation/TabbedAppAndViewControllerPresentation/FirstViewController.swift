//
//  FirstViewController.swift
//  TabbedApp
//
//  Created by viky on 2/11/19.
//  Copyright © 2019 viky. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, AnotherViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func go(_ sender: Any) {
        let vc = AnotherViewController()
        vc.data = "Data from fisrt view controller"
        vc.delegate = self
//        vc.modalTransitionStyle = .flipHorizontal
//        vc.modalPresentationStyle = .fullScreen
        
        self.definesPresentationContext = true
        vc.modalPresentationStyle = .currentContext
//
        self.providesPresentationContextTransitionStyle = true
        self.modalTransitionStyle = .flipHorizontal
        
        present(vc, animated: true, completion: nil)
    }
    
    func dismissWithData(data: String, animated: Bool, compelition: (() -> ())?) {
        print(data)
        dismiss(animated: animated, completion: compelition)
    }
}

