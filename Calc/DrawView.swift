//
//  DrawView.swift
//  Calc
//
//  Created by adminaccount on 12/19/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class DrawView: UIView {

    func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalIn: rect)
        UIColor.green.setFill()
        path.fill()
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
