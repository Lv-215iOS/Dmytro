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
    
    @IBAction func touchButton(_ sender: UIButton) {
        viewController?.touchButton(symbol: sender.currentTitle!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    var currentDraw
    
//    func drawRect(rect: CGRect) {
//        var path = UIBezierPath(ovalIn: rect)
//        UIColor.green.setFill()
//        path.fill()
//    }
    

      
    
    //    private var userIsInTheMiddleOfTyping = false
    //    private var dot = false
    //    var savedProgram: CalculatorBrain.PropertyList?     //PropertyList = AnyObject
    //    private var brain: CalculatorBrain = CalculatorBrain()
    //    var valueFromButton: String = ""
    //
    
    
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
