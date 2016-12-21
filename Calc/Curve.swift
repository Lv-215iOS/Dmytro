//
//  Curve.swift
//  Calc
//
//  Created by adminaccount on 12/21/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class Curve: UIView {
    override func draw(_ rect: CGRect) {
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        var xySize: CGFloat = (screenWidth + screenHeight)/10*0.9
        
        var x1: CGFloat = 0
        var y1: CGFloat = 0
        var x2: CGFloat = 0
        var y2: CGFloat = 0
        var x_ctrl: CGFloat = 0
        var y_ctrl: CGFloat = 0
        
        var context = UIGraphicsGetCurrentContext()
        
        func setCurve(){
            context = UIGraphicsGetCurrentContext()
            context?.setLineWidth(1.0)
            context?.setStrokeColor(UIColor.blue.cgColor)
            context?.move(to: CGPoint(x: x1, y: y1))
            context?.addQuadCurve(to: CGPoint(x: x2, y: y2),
                                  control: CGPoint(x: x_ctrl, y: y_ctrl))
            context?.strokePath()
        }
        
        func horizontal() {
            x1 = 0.95 * screenWidth
            y1 = screenHeight
            x2 = screenWidth
            y2 = 0.57 * screenHeight
            x_ctrl = 0.58 * screenWidth
            y_ctrl = 0.95 * screenWidth
            setCurve()
            
            x1 = 0.7 * screenWidth
            y1 = screenHeight
            x2 = screenWidth
            y2 = 0.46 * screenHeight
            x_ctrl = 0.36 * screenWidth
            y_ctrl = 0.81 * screenWidth
            setCurve()
            
            x1 = 0.47 * screenWidth
            y1 = screenHeight
            x2 = screenWidth
            y2 = 0.35 * screenHeight
            x_ctrl = 0.15 * screenWidth
            y_ctrl = 0.66 * screenWidth
            setCurve()
            
            x1 = 0.22 * screenWidth
            y1 = screenHeight
            x2 = screenWidth
            y2 = 0.25 * screenHeight
            x_ctrl = 0.02 * screenWidth
            y_ctrl = 0.46 * screenWidth
            setCurve()
            
            x1 = -1
            y1 = 0.65 * screenHeight
            x2 = screenWidth
            y2 = 0.14 * screenHeight
            x_ctrl = 0.08 * screenWidth
            y_ctrl = 0.3 * screenWidth
            setCurve()
            
            x1 = -1
            y1 = 0.3 * screenHeight
            x2 = screenWidth
            y2 = 0.03 * screenHeight
            x_ctrl = 0.22 * screenWidth
            y_ctrl = 0.1 * screenWidth
            setCurve()
        }
        
        func checkOrientation () {
            print("cool")
            switch UIDevice.current.orientation.isLandscape {
            case true:
                context = nil
                print("ok")
            case false:
                horizontal()
                print("not ok")
            }
        }
        
        checkOrientation()
    }
    
    func drawing() {
        var dr = Curve()
        
        
    }
}
