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
    var x1: CGFloat = 0
    var y1: CGFloat = 0
    var x2: CGFloat = 0
    var y2: CGFloat = 0
    var x_ctrl: CGFloat = 0
    var y_ctrl: CGFloat = 0
    var inputController = InputController()
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    var xySize: CGFloat = 0.0
    var myFrame = CGPoint(x: 0, y: 0)
    
    func setCurve(){
        context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(1.0)
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.move(to: CGPoint(x: x1, y: y1))
        context?.addQuadCurve(to: CGPoint(x: x2, y: y2),
                              control: CGPoint(x: x_ctrl, y: y_ctrl))
        context?.strokePath()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        screenWidth = 414
        screenHeight = 511
//        screenWidth = UIScreen.main.bounds.width
//        screenHeight = UIScreen.main.bounds.height
//        inputController.viewWillLayoutSubviews()
        print(self.inputController.view.frame.height)
    }
    
    func horizontal() {
        xySize = (screenWidth + screenHeight)/10*0.9
        
        //95-80=
        //57+23=
        x1 = 0.81 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.85 * screenHeight
        x_ctrl = 0.75 * screenWidth
        y_ctrl = 0.99 * screenWidth
        setCurve()
        
        x1 = 0.61 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.69 * screenHeight
        x_ctrl = 0.55 * screenWidth
        y_ctrl = 0.79 * screenWidth
        setCurve()
        
        x1 = 0.42 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.53 * screenHeight
        x_ctrl = 0.36 * screenWidth
        y_ctrl = 0.6 * screenWidth
        setCurve()
        
        x1 = 0.23 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.38 * screenHeight
        x_ctrl = 0.16 * screenWidth
        y_ctrl = 0.41 * screenWidth
        setCurve()
        
        x1 = 0.04 * screenWidth
        y1 = screenHeight
        x2 = screenWidth
        y2 = 0.22 * screenHeight
        x_ctrl = -0.04 * screenWidth
        y_ctrl = 0.23 * screenWidth
        setCurve()
        
        x1 = 0
        y1 = 0.38 * screenHeight
        x2 = screenWidth
        y2 = 0.06 * screenHeight
        x_ctrl = 0.3 * screenWidth
        y_ctrl = 0.03 * screenWidth
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
    
    override func draw(_ rect: CGRect) {
        checkOrientation()
    }
    
    override func pressesBegan(_ presses: Set<UIPress>, with event: UIPressesEvent?) {
    }
    
}
