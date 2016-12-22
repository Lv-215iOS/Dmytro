//
//  InputController.swift
//  Calc
//
//  Created by adminaccount on 12/14/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol InputProtocol {
    func Input()
}

class InputController: UIInputViewController {
    @IBOutlet weak var btnPow: UIButton!
    @IBOutlet weak var btnFact: UIButton!
    @IBOutlet weak var btnTgh: UIButton!
    @IBOutlet weak var btnCtgh: UIButton!
    @IBOutlet weak var btnCosh: UIButton!
    @IBOutlet weak var btnSinh: UIButton!
    @IBOutlet weak var btnSin: UIButton!
    @IBOutlet weak var bthCtg: UIButton!
    @IBOutlet weak var btnLog: UIButton!
    @IBOutlet weak var btnLn: UIButton!
    @IBOutlet weak var btnPi: UIButton!
    @IBOutlet weak var btnE: UIButton!
    @IBOutlet weak var btnCos: UIButton!
    @IBOutlet weak var btnTg: UIButton!
    @IBOutlet weak var btnRand: UIButton!
    @IBOutlet weak var btnLeftBracket: UIButton!
    @IBOutlet weak var btnRightBracket: UIButton!
    @IBOutlet weak var btn0: UIButton!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btnC: UIButton!
    @IBOutlet weak var btnMPlus: UIButton!
    @IBOutlet weak var btnMRead: UIButton!
    @IBOutlet weak var btnMMinus: UIButton!
    @IBOutlet weak var btnMClean: UIButton!
    @IBOutlet weak var btnForDesign: UIButton!
    @IBOutlet weak var btnMul: UIButton!
    @IBOutlet weak var btnDiv: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnAdd: UIButton!
    @IBOutlet weak var btnMod: UIButton!
    @IBOutlet weak var btnSqrt: UIButton!
    @IBOutlet weak var btnPlusMinus: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    @IBOutlet weak var btnDot: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    
    var viewController: ViewController? = nil
    var myFrame = CGPoint(x: 0, y: 0)
    var screenWidth = 0.0
    var screenHeight = 0.0
    var xySize = 0.0
    var screenSize = UIScreen.main.bounds
    var x = 0.0
    var y = 0.0
    
    @IBAction func touchButton(_ sender: UIButton) {
        viewController?.touchButton(symbol: sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        myFrame = CGPoint(x: view.frame.width, y: view.frame.height)
        screenWidth = Double(myFrame.x)
        screenHeight = Double(myFrame.y)
        xySize = screenWidth/5*0.9
        
        if screenWidth > screenHeight {
            verticalPosition()
        } else {
            horizontalPosition()
        }
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        switch UIDevice.current.orientation.isLandscape {
        case true:
            verticalPosition()
            print("2ok")
        case false:
            horizontalPosition()
            print("2not ok")
        }
    }
    
    @IBOutlet weak var RoundButton: UIButton!
    weak var btn: UIButton!
    
    var l: CALayer {
        return btn.layer
    }
    
    func setUpLayer() {
        l.borderWidth = 1.0
        l.borderColor = UIColor.black.cgColor
        l.cornerRadius = 35.0
    }
    
    func setButton(x: Double, y: Double, btn: UIButton) {
        btn.frame = CGRect(x: x, y: y, width: xySize, height: xySize)
    }
    
    func horizontalPosition() {
        btnPow.frame.origin = CGPoint(x:-100, y:-100)
        btnFact.frame.origin = CGPoint(x:-100, y:-100)
        btnTgh.frame.origin = CGPoint(x:-100, y:-100)
        btnCtgh.frame.origin = CGPoint(x:-100, y:-100)
        btnCosh.frame.origin = CGPoint(x:-100, y:-100)
        btnSinh.frame.origin = CGPoint(x:-100, y:-100)
        btnSin.frame.origin = CGPoint(x:-100, y:-100)
        bthCtg.frame.origin = CGPoint(x:-100, y:-100)
        btnLog.frame.origin = CGPoint(x:-100, y:-100)
        btnLn.frame.origin = CGPoint(x:-100, y:-100)
        btnPi.frame.origin = CGPoint(x:-100, y:-100)
        btnE.frame.origin = CGPoint(x:-100, y:-100)
        btnCos.frame.origin = CGPoint(x:-100, y:-100)
        btnTg.frame.origin = CGPoint(x:-100, y:-100)
        btnRand.frame.origin = CGPoint(x:-100, y:-100)
        btnLeftBracket.frame.origin = CGPoint(x:-100, y:-100)
        btnRightBracket.frame.origin = CGPoint(x:-100, y:-100)
        RoundButton.frame.origin = CGPoint(x:-100, y:-100)
        btnForDesign.frame.origin = CGPoint(x:-100, y:-100)
        
        btn = btn0
        setUpLayer()
        
        btn = btn1
        setUpLayer()
        
        btn = btn2
        setUpLayer()
        
        btn = btn3
        setUpLayer()
        
        btn = btn4
        setUpLayer()
        
        btn = btn5
        setUpLayer()
        
        btn = btn6
        setUpLayer()
        
        btn = btn7
        setUpLayer()
        
        btn = btn8
        setUpLayer()
        
        btn = btn9
        setUpLayer()
        
        btn = btnMClean
        setUpLayer()
        
        btn = btnMPlus
        setUpLayer()
        
        btn = btnMMinus
        setUpLayer()
        
        btn = btnC
        setUpLayer()
        
        btn = btnMRead
        setUpLayer()
        
        btn = btnMul
        setUpLayer()
        
        btn = btnDiv
        setUpLayer()
        
        btn = btnMod
        setUpLayer()
        
        btn = btnSqrt
        setUpLayer()
        
        btn = btnAdd
        setUpLayer()
        
        btn = btnMinus
        setUpLayer()
        
        btn = btnPlusMinus
        setUpLayer()
        
        btn = btnEqual
        setUpLayer()
        
        btn = btnDot
        setUpLayer()
        
        btn = btnBack
        setUpLayer()
        
        //81-80=+1
        //85-58=+27
        setButton(x: 0.81 * screenWidth, y: 0.85 * screenHeight, btn: btnEqual)
        setButton(x: 0.61 * screenWidth, y: 0.84 * screenHeight, btn: btnAdd)
        setButton(x: 0.77 * screenWidth, y: 0.69 * screenHeight, btn: btnMinus)
        
        setButton(x: 0.42 * screenWidth, y: 0.85 * screenHeight, btn: btnMul)
        setButton(x: 0.45 * screenWidth, y: 0.69 * screenHeight, btn: btnDiv)
        setButton(x: 0.59 * screenWidth, y: 0.57 * screenHeight, btn: btnMod)
        setButton(x: 0.81 * screenWidth, y: 0.53 * screenHeight, btn: btnSqrt)
        
        setButton(x: 0.23 * screenWidth, y: 0.85 * screenHeight, btn: btnC)
        setButton(x: 0.25 * screenWidth, y: 0.68 * screenHeight, btn: btnMRead)
        setButton(x: 0.36 * screenWidth, y: 0.51 * screenHeight, btn: btnMPlus)
        setButton(x: 0.58 * screenWidth, y: 0.4 * screenHeight, btn: btnMMinus)
        setButton(x: 0.81 * screenWidth, y: 0.38 * screenHeight, btn: btnMClean)
        
        setButton(x: 0.04 * screenWidth, y: 0.85 * screenHeight, btn: btnBack)
        setButton(x: 0.05 * screenWidth, y: 0.69 * screenHeight, btn: btn0)
        setButton(x: 0.1 * screenWidth, y: 0.53 * screenHeight, btn: btn1)
        setButton(x: 0.22 * screenWidth, y: 0.39 * screenHeight, btn: btn2)
        setButton(x: 0.39 * screenWidth, y: 0.29 * screenHeight, btn: btn3)
        setButton(x: 0.6 * screenWidth, y: 0.24 * screenHeight, btn: btn4)
        setButton(x: 0.81 * screenWidth, y: 0.22 * screenHeight, btn: btnPlusMinus)
        
        setButton(x: 0.01 * screenWidth, y: 0.34 * screenHeight, btn: btnDot)
        setButton(x: 0.14 * screenWidth, y: 0.23 * screenHeight, btn: btn5)
        setButton(x: 0.29 * screenWidth, y: 0.15 * screenHeight, btn: btn6)
        setButton(x: 0.46 * screenWidth, y: 0.1 * screenHeight, btn: btn7)
        setButton(x: 0.64 * screenWidth, y: 0.07 * screenHeight, btn: btn8)
        setButton(x: 0.82 * screenWidth, y: 0.06 * screenHeight, btn: btn9)
    }
    
    func verticalPosition() {
        btn3.frame.origin = CGPoint(x:-100, y:-100)
        btn4.frame.origin = CGPoint(x:-100, y:-100)
        btn5.frame.origin = CGPoint(x:-100, y:-100)
        btn6.frame.origin = CGPoint(x:-100, y:-100)
        btn7.frame.origin = CGPoint(x:-100, y:-100)
        btn8.frame.origin = CGPoint(x:-100, y:-100)
        btn9.frame.origin = CGPoint(x:-100, y:-100)
        btnBack.frame.origin = CGPoint(x:-100, y:-100)
        btnMClean.frame.origin = CGPoint(x:-100, y:-100)
        btnMMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnMPlus.frame.origin = CGPoint(x:-100, y:-100)
        btnMRead.frame.origin = CGPoint(x:-100, y:-100)
        btnDot.frame.origin = CGPoint(x:-100, y:-100)
        btnAdd.frame.origin = CGPoint(x:-100, y:-100)
        btnDiv.frame.origin = CGPoint(x:-100, y:-100)
        btnMod.frame.origin = CGPoint(x:-100, y:-100)
        btnMul.frame.origin = CGPoint(x:-100, y:-100)
        btnEqual.frame.origin = CGPoint(x:-100, y:-100)
        btnSqrt.frame.origin = CGPoint(x:-100, y:-100)
        btnPow.frame.origin = CGPoint(x:-100, y:-100)
        btnFact.frame.origin = CGPoint(x:-100, y:-100)
        btnTgh.frame.origin = CGPoint(x:-100, y:-100)
        btnCtgh.frame.origin = CGPoint(x:-100, y:-100)
        btnCosh.frame.origin = CGPoint(x:-100, y:-100)
        btnSinh.frame.origin = CGPoint(x:-100, y:-100)
        btnSin.frame.origin = CGPoint(x:-100, y:-100)
        bthCtg.frame.origin = CGPoint(x:-100, y:-100)
        btnLog.frame.origin = CGPoint(x:-100, y:-100)
        btnLn.frame.origin = CGPoint(x:-100, y:-100)
        btnPi.frame.origin = CGPoint(x:-100, y:-100)
        btnE.frame.origin = CGPoint(x:-100, y:-100)
        btnCos.frame.origin = CGPoint(x:-100, y:-100)
        btnTg.frame.origin = CGPoint(x:-100, y:-100)
        btnRand.frame.origin = CGPoint(x:-100, y:-100)
        btnLeftBracket.frame.origin = CGPoint(x:-100, y:-100)
        btnRightBracket.frame.origin = CGPoint(x:-100, y:-100)
        RoundButton.frame.origin = CGPoint(x:-100, y:-100)
        btnForDesign.frame.origin = CGPoint(x:-100, y:-100)
        btn0.frame.origin = CGPoint(x:-100, y:-100)
        btn2.frame.origin = CGPoint(x:-100, y:-100)
        btn3.frame.origin = CGPoint(x:-100, y:-100)
        btn4.frame.origin = CGPoint(x:-100, y:-100)
        btn5.frame.origin = CGPoint(x:-100, y:-100)
        btn6.frame.origin = CGPoint(x:-100, y:-100)
        btn7.frame.origin = CGPoint(x:-100, y:-100)
        btn8.frame.origin = CGPoint(x:-100, y:-100)
        btn9.frame.origin = CGPoint(x:-100, y:-100)
        btnMClean.frame.origin = CGPoint(x:-100, y:-100)
        btnMPlus.frame.origin = CGPoint(x:-100, y:-100)
        btnMMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnC.frame.origin = CGPoint(x:-100, y:-100)
        btnMRead.frame.origin = CGPoint(x:-100, y:-100)
        btnMul.frame.origin = CGPoint(x:-100, y:-100)
        btnDiv.frame.origin = CGPoint(x:-100, y:-100)
        btnMod.frame.origin = CGPoint(x:-100, y:-100)
        btnSqrt.frame.origin = CGPoint(x:-100, y:-100)
        btnAdd.frame.origin = CGPoint(x:-100, y:-100)
        btnMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnPlusMinus.frame.origin = CGPoint(x:-100, y:-100)
        btnEqual.frame.origin = CGPoint(x:-100, y:-100)
        btnDot.frame.origin = CGPoint(x:-100, y:-100)
        btnBack.frame.origin = CGPoint(x:-100, y:-100)
        
        
        btn = btn1
        setUpLayer()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        var xySize: CGFloat = screenHeight/5*0.9
        var x: CGFloat
        var y: CGFloat
        
        func setButton(btn: UIButton) {
            btn.frame = CGRect(x: x, y: y, width: xySize, height: xySize)
        }
        
        x = 0.3 * screenWidth
        y = 0.9 * screenHeight
        setButton(btn: btn1)
    }
}
