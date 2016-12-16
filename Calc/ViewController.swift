//
//  ViewController.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    var brain = CalculatorBrain()
    var prior = false
    
    func touchButton(symbol: String) {
        switch symbol {
        case "+":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 2
            brain.binary(operation: .Plus)
        case "-":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 2
            brain.binary(operation: .Minus)
        case "✕":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 2
            brain.binary(operation: .Mul)
        case "÷":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 2
            brain.binary(operation: .Div)
        case "√":
            outputController?.appendSymbol(symbol: symbol)
//            prior = true
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Sqrt)
        case "=":
            brain.utility(operation: .Equal)
        default:
            outputController?.appendSymbol(symbol: symbol)
            print("\(brain.stack.count) != \(CalculatorBrain.counter)")
            if brain.stack.count == CalculatorBrain.counter {
                brain.stack.append(symbol)
            } else {
                brain.stack[CalculatorBrain.counter] = String(Double(String(brain.stack[CalculatorBrain.counter]))! * 10 + Double(symbol)!)
            }
            
            brain.digit(value: Double(symbol)!)
        }
//        if prior == true {
//            brain.stack[CalculatorBrain.counter-1] = String(sqrt(Double(String(brain.stack[CalculatorBrain.counter]))!))
//            prior = false
//            brain.stack.remove(at: CalculatorBrain.counter)
//            CalculatorBrain.counter -= 1
//        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.result = { (value, error)->() in
            if (value != nil) {
                self.outputController?.setResult(symbol: "\(value!)")
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerSegue" {
            outputController = segue.destination as? OutputController
            outputController?.viewController = self
        } else if segue.identifier == "InputControllerSegue" {
            inputController = segue.destination as? InputController
            inputController?.viewController = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

