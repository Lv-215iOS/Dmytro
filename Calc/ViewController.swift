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
    var dot: Double = 1
    
    func touchButton(symbol: String) {
        if (outputController?.isResult)! {
            outputController?.appendSymbol(symbol: String((Double(brain.stack[0]) == Double(Int(Double(brain.stack[0])!))) ? String(Int(Double(brain.stack[0])!)) : symbol))
            
            outputController?.isResult = false
        }
        if brain.stack == [] {
            CalculatorBrain.counter -= 1
        }
        switch symbol {
        case "+":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "-":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "✕":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "÷":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "^":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "%":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "√":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "!":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Fact)
        case "sin":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Sin)
        case "cos":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Cos)
        case "tg":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Tg)
        case "ctg":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Ctg)
        case "sinh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Sinh)
        case "cosh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Cosh)
        case "tgh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Tgh)
        case "ctgh":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Ctgh)
        case "ln":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            print(CalculatorBrain.counter)
            brain.unary(operation: .Ln)
        case "log":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            brain.unary(operation: .Log)
        case "+/-":
            outputController?.clearLastNumber(symbol: brain.stack[CalculatorBrain.counter])
            brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])!*(-1))
            outputController?.appendSymbol(symbol: brain.stack[CalculatorBrain.counter])
        case "π":
            outputController?.appendSymbol(symbol: String(M_PI))
            brain.stack.append(String(M_PI))
            CalculatorBrain.counter += 1
        case "rand":
            outputController?.appendSymbol(symbol: String(brain.Rand()))
            brain.stack.append(String(brain.Rand()))
            CalculatorBrain.counter += 1
        case "e":
            outputController?.appendSymbol(symbol: String(M_E))
            brain.stack.append(String(M_E))
            CalculatorBrain.counter += 1
        case ".":
            outputController?.appendSymbol(symbol: symbol)
            //should use -> brain.utility(operation: .Dot)
            dot *= 0.1
        case "C":
            outputController?.clearScreen()
            brain.stack = []
            CalculatorBrain.counter = 0
            //should use -> brain.utility(operation: .Clean)
        case "M+":
            if !brain.utility(operation: .MPlus) {
                outputController?.setWarning(name: String("Write the number or press '='"))
            } else {
                brain.valueInMemory += Double(brain.stack[0])!
            }
        case "M-":
            if !brain.utility(operation: .MMinus) {
                outputController?.setWarning(name: String("Write the number or press '='"))
            } else {
                brain.valueInMemory -= Double(brain.stack[0])!
            }
        case "MC":
            if !brain.utility(operation: .MClear) {
                outputController?.setWarning(name: String("Memory is empty"))
            } else {
                brain.valueInMemory = 0
            }
        case "MR":
            if !brain.utility(operation: .MRead) {
                outputController?.setWarning(name: String("There is nothing in memory"))
            } else {
                outputController?.setResult(symbol: String(brain.valueInMemory))
                outputController?.appendSymbol(symbol: String(brain.valueInMemory))
//                if brain.valueInMemory != Double(brain.stack[CalculatorBrain.counter]) {
//                    brain.stack[CalculatorBrain.counter] = String(brain.valueInMemory)
//                }
            }
        case "⌫":
            outputController?.clearLastSymbol()
            print(CalculatorBrain.counter)
            let smth: Int? = Int(brain.stack[CalculatorBrain.counter])      //var -> let
            if smth == nil || smth!/10 == 0 {
                brain.stack.remove(at: CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
            } else {
                brain.stack[CalculatorBrain.counter].remove(at: brain.stack[CalculatorBrain.counter].index(before: brain.stack[CalculatorBrain.counter].endIndex))
            }
            //should use -> brain.utility(operation: .CleanLast)
        case "=":
            outputController?.appendSymbol(symbol: symbol)
            if brain.utility(operation: .Equal) {
                //do something
            }
        case "(":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            //should use -> brain.utility(operation: .LeftBracket)
        case ")":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            //should use -> brain.utility(operation: .RightBracket)
        default:
            if outputController?.display.text == "0" {
                outputController?.clearScreen()
            }
            
            outputController?.appendSymbol(symbol: symbol)
            if CalculatorBrain.counter >= -1 {
                if CalculatorBrain.counter == -1 {
                    CalculatorBrain.counter += 1
                } else {
                    let smth: Int? = Int(brain.stack[CalculatorBrain.counter])      //var -> let
                    if smth == nil {
                        CalculatorBrain.counter += 1
                    }
                }
                
            }
            
            if brain.stack.count == CalculatorBrain.counter {
                brain.stack.append(symbol)
                dot = 1
            } else if dot == 1{
                brain.stack[CalculatorBrain.counter] = String(Int(String(brain.stack[CalculatorBrain.counter]))! * 10 + Int(symbol)!)
            } else if dot < 1 {
                brain.stack[CalculatorBrain.counter] = String(Double(String(brain.stack[CalculatorBrain.counter]))! + Double(symbol)!*dot)
                dot *= 0.1
            }
        }
    }
    
    func setText(text: String) {
        outputController?.setWarning(name: text)
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
}

