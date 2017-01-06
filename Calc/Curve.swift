//
//  Curve.swift
//  Calc
//
//  Created by adminaccount on 12/21/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class Curve: UIView {
    var context = UIGraphicsGetCurrentContext()
    var x1: Double = 0
    var y1: Double = 0
    var x2: Double = 0
    var y2: Double = 0
    var x_ctrl: Double = 0
    var y_ctrl: Double = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        draw(frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setCurve(){
        context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.move(to: CGPoint(x: x1, y: y1))
        context?.addQuadCurve(to: CGPoint(x: x2, y: y2),
                              control: CGPoint(x: x_ctrl, y: y_ctrl))
        context?.strokePath()
        
    }
    
    func setNewCurve(){
        context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(UIColor.red.cgColor)
        context?.move(to: CGPoint(x: x1, y: y1))
        context?.addQuadCurve(to: CGPoint(x: x2, y: y2),
                              control: CGPoint(x: x_ctrl, y: y_ctrl))
        context?.strokePath()
    }
    
    func horizontal( screenWidth: Double, screenHeight: Double) {
        let screenHeight = screenHeight
        let screenWidth = screenWidth
        x1 = 0.8 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.85 * screenHeight
        x_ctrl = 0.8 * screenWidth
        y_ctrl = 1.21 * screenWidth
        setCurve()
        
        x1 = 0.61 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.69 * screenHeight
        x_ctrl = 0.6 * screenWidth
        y_ctrl = 0.93 * screenWidth
        setCurve()
        
        x1 = 0.42 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.53 * screenHeight
        x_ctrl = 0.41 * screenWidth
        y_ctrl = 0.68 * screenWidth
        setCurve()
        
        x1 = 0.23 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.38 * screenHeight
        x_ctrl = 0.21 * screenWidth
        y_ctrl = 0.41 * screenWidth
        setCurve()
      
        x1 = 0.02 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.22 * screenHeight
        x_ctrl = 0.01 * screenWidth
        y_ctrl = 0.18 * screenWidth
        setCurve()
        
        x1 = 0
        y1 = 0.38 * screenHeight
        x2 = screenWidth
        y2 = 0.06 * screenHeight
        x_ctrl = 0.25 * screenWidth
        y_ctrl = 0.04 * screenWidth
        setCurve()
    }
    
    func vertical(screenWidth: Double, screenHeight: Double) {
        let screenHeight = screenHeight
        let screenWidth = screenWidth
        x1 = 0.81 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.85 * screenHeight
        x_ctrl = 0.75 * screenWidth
        y_ctrl = 1.16 * screenWidth
        setNewCurve()
        
        x1 = 0.61 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.69 * screenHeight
        x_ctrl = 0.55 * screenWidth
        y_ctrl = 0.92 * screenWidth
        setNewCurve()
        
        x1 = 0.42 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.53 * screenHeight
        x_ctrl = 0.36 * screenWidth
        y_ctrl = 0.68 * screenWidth
        setNewCurve()
        
        x1 = 0.23 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.38 * screenHeight
        x_ctrl = 0.16 * screenWidth
        y_ctrl = 0.45 * screenWidth
        setNewCurve()
        
        x1 = 0.04 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.22 * screenHeight
        x_ctrl = -0.04 * screenWidth
        y_ctrl = 0.23 * screenWidth
        setNewCurve()
        
        x1 = 5
        y1 = 0.38 * screenHeight
        x2 = screenWidth
        y2 = 0.06 * screenHeight
        x_ctrl = 0.3 * screenWidth
        y_ctrl = 0.43 * screenWidth
        setNewCurve()
    }
    
    override func setNeedsLayout() {
    }
    
    override func draw(_ rect: CGRect) {
                if frame.width > frame.height && frame.width != 768 {
//                    vertical(screenWidth: Double(frame.width), screenHeight: Double(frame.height))
//                    context?.clear(frame)
                } else {
                    horizontal(screenWidth: Double(frame.width), screenHeight: Double(frame.height))
                }
    }        
}
