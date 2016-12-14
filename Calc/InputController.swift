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
//    @IBOutlet weak var display: UILabel!
    
    var viewController: ViewController? = nil
    
    private var userIsInTheMiddleOfTyping = false
    private var dot = false
    
    var savedProgram: CalculatorBrain.PropertyList?     //PropertyList = AnyObject
    private var brain: CalculatorBrain = CalculatorBrain()
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        if let digit = sender.currentTitle {
            if digit == "." && dot == true {
                return
            }
            if userIsInTheMiddleOfTyping {
                let textCurrentlyInDispaly = viewController?.outputController?.display.text!
                viewController?.outputController?.display.text = textCurrentlyInDispaly! + digit
                
                //            let textCurrentlyInDisplay = self.outputController?.display.text!
                //            self.outputController?.display.text = textCurrentlyInDisplay! + digit
                //            let textCurrentlyInDisplay = display.text!
                //            display.text = textCurrentlyInDisplay + digit
            } else {
                viewController?.outputController?.display.text = digit
                
                //            self.outputController?.display.text = digit
                //            display.text = digit
            }
            if digit == "." {
                dot = true
            }
            userIsInTheMiddleOfTyping = true
            
        } else {
            print("Sender does not contain a value \(sender)")
        }
        
    }

    @IBAction func save() {
        savedProgram = brain.program
    }
    
    
    @IBAction func restore() {
        if savedProgram != nil {
            brain.program = savedProgram!
            viewController?.displayValue = brain.result
            
//            displayValue = brain.result
        }
    }

    @IBAction private func performedOperation(_ sender: UIButton) {
        dot = false
        if userIsInTheMiddleOfTyping {
            brain.setOperand(operand: (viewController?.displayValue)!)  //catch it
//            brain.setOperand(operand: displayValue) //i've change it 1
            userIsInTheMiddleOfTyping = false
        }
        
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol) //i've change it 2
        }
        viewController?.displayValue = brain.result
//        displayValue = brain.result
    }

    @IBAction func clear(_ sender: UIButton) {
        viewController?.outputController?.display.text = String("0")
//        self.outputController?.display.text = String("0")
        //        display.text = String("0")
        brain.clear()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InputControllerSegue" {
            viewController = segue.source as? ViewController
        }
    }
}
