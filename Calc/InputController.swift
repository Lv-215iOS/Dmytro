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
    var viewController: ViewController? = nil
    var curve: Curve = Curve()
    
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
    
    
    @IBAction func touchButton(_ sender: UIButton) {
        viewController?.touchButton(symbol: sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch UIDevice.current.orientation.isLandscape {
        case true:
            verticalPosition()
            curve = Curve()
            //                RoundButton.frame.origin = CGPoint(x: 450, y: 150)
            print("ok")
        case false:
            horizontalPosition()
            //                RoundButton.frame.origin = CGPoint(x: 50, y: 50)
            print("not ok")
            curve = Curve()
        }
        
//        btn0.frame.origin = CGPoint(x: 0.05*screenWidth, y: 0.6*screenHeight)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBOutlet weak var RoundButton: UIButton!
    weak var btn: UIButton!
    
    var l: CALayer {
        return btn.layer
    }
    
    func setUpLayer() {
//        l.backgroundColor = UIColor.blue.cgColor
        l.borderWidth = 1.0
        l.borderColor = UIColor.black.cgColor
        
//        l.shadowOpacity = 0.7
//        l.shadowRadius = 10.0
        l.cornerRadius = 35.0
        
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
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        var xySize: CGFloat = screenWidth/5*0.9
        var x: CGFloat
        var y: CGFloat
        
        func setButton(btn: UIButton) {
            btn.frame = CGRect(x: x, y: y, width: xySize, height: xySize)
        }
        
        x = 0.8 * screenWidth
        y = 0.58 * screenHeight
        setButton(btn: btnEqual)
        
        x = 0.6 * screenWidth
        y = 0.57 * screenHeight
        setButton(btn: btnAdd)
        
        x = 0.76 * screenWidth
        y = 0.47 * screenHeight
        setButton(btn: btnMinus)
        
        x = 0.4 * screenWidth
        y = 0.58 * screenHeight
        setButton(btn: btnMul)
        
        x = 0.46 * screenWidth
        y = 0.48 * screenHeight
        setButton(btn: btnDiv)
        
        x = 0.61 * screenWidth
        y = 0.39 * screenHeight
        setButton(btn: btnMod)
        
        x = 0.8 * screenWidth
        y = 0.36 * screenHeight
        setButton(btn: btnSqrt)
        
        x = 0.21 * screenWidth
        y = 0.58 * screenHeight
        setButton(btn: btnC)
        
        x = 0.26 * screenWidth
        y = 0.47 * screenHeight
        setButton(btn: btnMRead)
        
        x = 0.39 * screenWidth
        y = 0.36 * screenHeight
        setButton(btn: btnMPlus)
        
        x = 0.59 * screenWidth
        y = 0.28 * screenHeight
        setButton(btn: btnMMinus)
        
        x = 0.8 * screenWidth
        y = 0.26 * screenHeight
        setButton(btn: btnMClean)
        
        x = 0.01 * screenWidth
        y = 0.58 * screenHeight
        setButton(btn: btnBack)
        
        x = 0.06 * screenWidth
        y = 0.47 * screenHeight
        setButton(btn: btn0)
        
        x = 0.13 * screenWidth
        y = 0.37 * screenHeight
        setButton(btn: btn1)
        
        x = 0.25 * screenWidth
        y = 0.28 * screenHeight
        setButton(btn: btn2)
        
        x = 0.41 * screenWidth
        y = 0.21 * screenHeight
        setButton(btn: btn3)
        
        x = 0.6 * screenWidth
        y = 0.17 * screenHeight
        setButton(btn: btn4)
        
        x = 0.8 * screenWidth
        y = 0.15 * screenHeight
        setButton(btn: btnPlusMinus)
        
        x = 0.01 * screenWidth
        y = 0.27 * screenHeight
        setButton(btn: btnDot)
        
        x = 0.13 * screenWidth
        y = 0.19 * screenHeight
        setButton(btn: btn5)
        
        x = 0.28 * screenWidth
        y = 0.13 * screenHeight
        setButton(btn: btn6)
        
        x = 0.45 * screenWidth
        y = 0.08 * screenHeight
        setButton(btn: btn7)
        
        x = 0.63 * screenWidth
        y = 0.05 * screenHeight
        setButton(btn: btn8)
        
        x = 0.81 * screenWidth
        y = 0.04 * screenHeight
        setButton(btn: btn9)
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
        
//        btn = btnPow
//        setUpLayer()
//        
//        btn = btnFact
//        setUpLayer()
//        
//        btn = btnTgh
//        setUpLayer()
//        
//        btn = btnCtgh
//        setUpLayer()
//        
//        btn = btnCosh
//        setUpLayer()
//        
//        btn = btnSinh
//        setUpLayer()
//        
//        btn = btnSin
//        setUpLayer()
//        
//        btn = bthCtg
//        setUpLayer()
//        
//        btn = btnLog
//        setUpLayer()
//        
//        btn = btnLn
//        setUpLayer()
//        
//        btn = btnPi
//        setUpLayer()
//        
//        btn = btnE
//        setUpLayer()
//        
//        btn = btnCos
//        setUpLayer()
//        
//        btn = btnTg
//        setUpLayer()
//        
//        btn = btnRand
//        setUpLayer()
//        
//        btn = btnLeftBracket
//        setUpLayer()
//        
//        btn = btnRightBracket
//        setUpLayer()
//        
//        btn = RoundButton
//        setUpLayer()
//        
//        btn = btnForDesign
//        setUpLayer()
//        
//        btn = btn0
//        setUpLayer()
        
        btn = btn1
        setUpLayer()

//        btn = btn2
//        setUpLayer()
//        
//        btn = btn3
//        setUpLayer()
//        
//        btn = btn4
//        setUpLayer()
//        
//        btn = btn5
//        setUpLayer()
//        
//        btn = btn6
//        setUpLayer()
//        
//        btn = btn7
//        setUpLayer()
//        
//        btn = btn8
//        setUpLayer()
//        
//        btn = btn9
//        setUpLayer()
//        
//        btn = btnMClean
//        setUpLayer()
//        
//        btn = btnMPlus
//        setUpLayer()
//        
//        btn = btnMMinus
//        setUpLayer()
//        
//        btn = btnC
//        setUpLayer()
//        
//        btn = btnMRead
//        setUpLayer()
//        
//        btn = btnMul
//        setUpLayer()
//        
//        btn = btnDiv
//        setUpLayer()
//        
//        btn = btnMod
//        setUpLayer()
//        
//        btn = btnSqrt
//        setUpLayer()
//        
//        btn = btnAdd
//        setUpLayer()
//        
//        btn = btnMinus
//        setUpLayer()
//        
//        btn = btnPlusMinus
//        setUpLayer()
//        
//        btn = btnEqual
//        setUpLayer()
//        
//        btn = btnDot
//        setUpLayer()
//        
//        btn = btnBack
//        setUpLayer()
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        var xySize: CGFloat = screenWidth/5*0.9
        var x: CGFloat
        var y: CGFloat
        
        func setButton(btn: UIButton) {
            btn.frame = CGRect(x: x, y: y, width: xySize, height: xySize)
        }
        
        x = 0.4 * screenWidth
        y = 0.6 * screenHeight
        setButton(btn: btn1)

    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        switch UIDevice.current.orientation.isLandscape {
        case true:
            verticalPosition()
            //                RoundButton.frame.origin = CGPoint(x: 450, y: 150)
            print("ok")
        case false:
            horizontalPosition()
            //                RoundButton.frame.origin = CGPoint(x: 50, y: 50)
            print("not ok")
        }
    }
    
//
//    
//    @IBAction private func touchDigit(_ sender: UIButton) {
//        valueFromButton = sender.currentTitle!
////        viewController?.valueFromInput = sender.currentTitle!
//
//        if let digit = sender.currentTitle {
//            if digit == "." && dot == true {
//                return
//            }
//            if userIsInTheMiddleOfTyping {
//                let textCurrentlyInDispaly = viewController?.outputController?.display.text!
//                viewController?.outputController?.display.text = textCurrentlyInDispaly! + digit
//            } else {
//                viewController?.outputController?.display.text = digit
//            }
//            if digit == "." {
//                dot = true
//            }
//            userIsInTheMiddleOfTyping = true
//            
//        } else {
//            print("Sender does not contain a value \(sender)")
//        }
//    }
//
//    @IBAction func save() {
////        viewController?.valueFromInput = "save"
//        
//        savedProgram = brain.program
//    }
//    
//    
//    @IBAction func restore() {
////        viewController?.valueFromInput = "restore"
//        
//        if savedProgram != nil {
//            brain.program = savedProgram!
//            viewController?.displayValue = brain.result
//        }
//    }
//
//    @IBAction private func performedOperation(_ sender: UIButton) {
////        viewController?.valueFromInput = sender.currentTitle!
//        
//        dot = false
//        if userIsInTheMiddleOfTyping {
//            brain.setOperand(operand: (viewController?.displayValue)!)  //catch it
//            userIsInTheMiddleOfTyping = false
//        }
//        
//        if let mathematicalSymbol = sender.currentTitle {
//            brain.performOperation(symbol: mathematicalSymbol) //i've change it 2
//        }
//        viewController?.displayValue = brain.result
//    }
//
//    @IBAction func clear(_ sender: UIButton) {
////        viewController?.valueFromInput = "clear"
//        
//        viewController?.outputController?.display.text = String("0")
//        brain.clear()
//    }
//    
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //        if segue.identifier == "InputControllerSegue" {
    //            viewController = segue.source as? ViewController
    //        }
    //    }    
    
}
