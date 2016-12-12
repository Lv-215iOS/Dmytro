//
//  ViewController.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var display: UILabel!
    
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
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + digit
        } else {
            display.text = digit
        }
        if digit == "." {
            dot = true
        }
        userIsInTheMiddleOfTyping = true
    }
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!   //1?
        }
        set {
//            let z: = newValue - Int(newValue)
            if round(newValue) == newValue {
                display.text = String(Int(newValue))
            } else {
               display.text = String(newValue)
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
        display.text = String("0")
        brain.clear()
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        
//        if segue.identifier == outputControllerMSegued {
//            outputcontroller = segue.destination as? OutputController
//        }
//    }
    
}

