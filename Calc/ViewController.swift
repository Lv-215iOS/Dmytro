//
//  ViewController.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var outputController : OutputController? = nil
//    var inputController : InputController? = nil
    
//    @IBOutlet private weak var display: UILabel!
    
//    var outputControllerMSegued = "OutputControllerMSegued"
//    var outputcontroller: OutputController? = nil
    
    
    private var userIsInTheMiddleOfTyping = false
    private var dot = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if digit == "." && dot == true {
            return
        }
        
        if userIsInTheMiddleOfTyping {
            let textCurrentlyInDisplay = self.outputController?.display.text!
            self.outputController?.display.text = textCurrentlyInDisplay! + digit
//            let textCurrentlyInDisplay = display.text!
//            display.text = textCurrentlyInDisplay + digit
        } else {
            self.outputController?.display.text = digit
//            display.text = digit
        }
        if digit == "." {
            dot = true
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double((self.outputController?.display.text)!)!
//            return Double(display.text!)!
        }
        set {
//            let z: = newValue - Int(newValue)
            if round(newValue) == newValue {
                self.outputController?.display.text = String(Int(newValue))
//                display.text = String(Int(newValue))
            } else {
                self.outputController?.display.text = String(newValue)
//               display.text = String(newValue)
            }
            
        }
    }
    
    var savedProgram: CalculatorBrain.PropertyList?     //PropertyList = AnyObject
    
    @IBAction func save() {
        savedProgram = brain.program
    }
    
    @IBAction func restore() {
        if savedProgram != nil {
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction private func performedOperation(_ sender: UIButton) {
        dot = false
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: displayValue) //i've change it 1
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol) //i've change it 2
        }
        displayValue = brain.result
    }
    
    @IBAction func clear(_ sender: UIButton) {
        self.outputController?.display.text = String("0")
//        display.text = String("0")
        brain.clear()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerSegue" {
            outputController = segue.destination as? OutputController
            outputController?.viewController = self
        } else if segue.identifier == "InputControllerSegue" {
//            inputController = segue.destination as? InputController
//            inputController?.viewController = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

