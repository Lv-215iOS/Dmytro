//
//  LaunchScreenControllerViewController.swift
//  Calc
//
//  Created by Dmytro on 1/9/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import UIKit

class LaunchScreenControllerViewController: UIView {
    
    override func draw(_ rect: CGRect) {
        UIView.animate(withDuration: 0.8, animations: {
            //            sender.transform = CGAffineTransform(scaleX: 1.6, y: 1.6)
            //            sender.setTitleColor(UIColor.blue, for: .normal)
        }, completion: { _ in UIView.animate(withDuration: 0.8) {
            //            sender.transform = CGAffineTransform.identity
            //            sender.setTitleColor(UIColor.black, for: .normal)
            }
        })
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }

}
