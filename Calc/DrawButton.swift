//
//  DrawButton.swift
//  Calc
//
//  Created by adminaccount on 12/19/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

@IBDesignable class DrawButton: UIButton {
    
    @IBInspectable var fillColor: UIColor = UIColor.green

    override func draw(_ rect: CGRect) {
        var path = UIBezierPath(ovalIn: rect)
        
        fillColor.setFill()
        path.fill()
        
        drawSign()
    }
    
    func drawSign() {
        drawHorizontalDash()
    }
    
    func drawHorizontalDash() {
        let plusHeigh: CGFloat = 3.0
        let plusWidth: CGFloat = min(bounds.width, bounds.height) * 0.6
        
        var plusPath = UIBezierPath()
        plusPath.lineWidth = plusHeigh
        
        plusPath.move(to: CGPoint(x: bounds.width/2 - plusWidth/2, y: bounds.height/2))
        plusPath.addLine(to: CGPoint(x: bounds.width/2 + plusWidth/2, y: bounds.height/2))
        
        plusPath.move(to: CGPoint(x: bounds.width/2 + 0.5, y: bounds.width/2 - plusWidth/2 + 0.5))
        plusPath.addLine(to: CGPoint(x: bounds.width/2 + 0.5, y: bounds.width/2 + plusWidth/2 + 0.5))
        
        UIColor.white.setStroke()
        plusPath.stroke()
        
    }
    
//    func setPosition
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
