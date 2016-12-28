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
    var isEqual = false
    var invert = false
    var prevSymbol: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.result = { (value, error)->() in
            if (value != nil) {
                self.outputController?.setResult(symbol: "\(value!)")
            }
        }
        inputController?.buttonTouched = { [unowned self] (operation)->() in self.touchButton(symbol: operation)}
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
    
    func setText(text: String) {
        outputController?.setWarning(name: text)
    }
    
    func isOperand(symbol: String) -> Bool {
        if symbol == "√" || symbol == "sin" || symbol == "cos" || symbol == "tg" || symbol == "ctg" || symbol == "ln" || symbol == "log" || symbol == "sinh" || symbol == "cosh" || symbol == "tgh" || symbol == "ctgh" || symbol == "!" {
            return true
        }
        return false
    }
    
    func isConstSymbol(symbol: String) -> Bool {
        if symbol == "e" || symbol == "π" || symbol == "rand" {
            return true
        }
        return false
    }
    
    func touchButton(symbol: String) {
        var symbol: String = symbol
        if symbol == "=" && isEqual {            
        } else if symbol != "=" {
            isEqual = false
        }
        if (outputController?.isResult)! {
            if brain.stack != [] && (Double(brain.stack[0]) == Double(Int(Double(brain.stack[0])!))) {
//                outputController?.appendSymbol(symbol: String((Double(brain.stack[0]) == Double(Int(Double(brain.stack[0])!))) ? String(Int(Double(brain.stack[0])!)) : symbol))
            }
            outputController?.isResult = false
        }
        if brain.stack == [] && symbol != "⌫" && symbol != "=" {
            CalculatorBrain.counter -= 1
        }
        
        switch symbol {
        case "+":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if outputController?.display.text == "" || Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "-":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if outputController?.display.text == "" || Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "✕":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if outputController?.display.text == "" || Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "÷":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if outputController?.display.text == "" || Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "^":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if outputController?.display.text == "" || Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "%":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(Double(Int(brain.res)) == brain.res ? String(Int(brain.res)) : String(brain.res))
                }
            }
            if outputController?.display.text == "" || Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "√":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && Double(brain.stack[CalculatorBrain.counter]) != nil && Double(brain.stack[CalculatorBrain.counter])! < 0 {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = 0
                brain.res = 0
                outputController?.setWarning(name: "Root can't take negative value")
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) && (Double(brain.stack[CalculatorBrain.counter]) != nil) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                brain.stack[CalculatorBrain.counter] = String(sqrt(Double(brain.stack[CalculatorBrain.counter])!))
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "!":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) && Int(brain.stack[CalculatorBrain.counter])! >= 0 {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) == Double(Int(brain.stack[CalculatorBrain.counter])!) {
                    self.brain.stack[CalculatorBrain.counter] = String(self.brain.Factorial(n: Int(self.brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Factorial can take Integer value only")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "sin":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(sin(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "cos":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(cos(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "tg":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(tan(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "ctg":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(1/tan(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "sinh":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(sinh(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "cosh":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(cosh(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "tgh":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(tanh(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "ctgh":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(1/tanh(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "ln":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(log(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "log":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil {
                    //TODO: sin isn't correct right now
                    brain.stack[CalculatorBrain.counter] = String(log10(Double(brain.stack[CalculatorBrain.counter])!))
                } else {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    outputController?.setWarning(name: "Problem with sin")
                    break
                }
                outputController?.clearLastNumber(symbol: String(describing: temp))
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                outputController?.setResult(symbol: String(brain.res))
                break
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "+/-":
            if outputController?.getLastSymbol() == "=" {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
                if brain.stack[CalculatorBrain.counter] != String(brain.res) {
                    brain.stack.append(String(brain.res))
                }
            }
            if outputController?.display.text == "" {
                outputController?.appendSymbol(symbol: "-")
                invert = true
                break
            } else if Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.clearLastNumber(symbol: brain.stack[CalculatorBrain.counter])
            brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])!*(-1))
            outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
        case "π":
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
            }
            if isConstSymbol(symbol: prevSymbol) && outputController?.display.text != "" {
                break
            }
            outputController?.appendSymbol(symbol: String(M_PI))
            brain.stack.append(String(M_PI))
            CalculatorBrain.counter += 1
        case "rand":
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
            }
            if isConstSymbol(symbol: prevSymbol) && outputController?.display.text != "" {
                break
            }
            outputController?.appendSymbol(symbol: String(brain.Rand()))
            brain.stack.append(String(brain.Rand()))
            CalculatorBrain.counter += 1
        case "e":
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
            }
            if isConstSymbol(symbol: prevSymbol) && outputController?.display.text != "" {
                break
            }
            outputController?.appendSymbol(symbol: String(M_E))
            brain.stack.append(String(M_E))
            CalculatorBrain.counter += 1
        case ".":
            let new_symbol: String = String(describing: outputController!.getLastSymbol())
            if Int(new_symbol) != nil && !(Int(new_symbol)! >= 0 && Int(new_symbol)! < 0) {
                outputController?.appendSymbol(symbol: "0")
            } else {
                outputController?.clearScreen()
                brain.stack[CalculatorBrain.counter] = String(0)
                brain.res = 0
                outputController?.appendSymbol(symbol: "0")
            }
            if symbol != new_symbol {
                if CalculatorBrain.counter >= 0 && Int(String(describing: brain.stack[CalculatorBrain.counter].characters.last)) != nil {
                    if !(Int(String(describing: brain.stack[CalculatorBrain.counter].characters.last))! >= 0 && Int(String(describing: brain.stack[CalculatorBrain.counter].characters.last))! <= 9) {
                        CalculatorBrain.counter += 1
                        brain.stack[CalculatorBrain.counter] = String(0)
                    }
                } else if CalculatorBrain.counter < 0{
                    CalculatorBrain.counter = 0
                    brain.stack.append(String(0))
                }
                if CalculatorBrain.counter >= 0 && (Int(brain.stack[CalculatorBrain.counter]) != nil) && Double(brain.stack[CalculatorBrain.counter]) == Double(Int(brain.stack[CalculatorBrain.counter])!) {
                    outputController?.appendSymbol(symbol: symbol)
                    dot *= 0.1
                }
            }
        case "C":
            outputController?.clearScreen()
            brain.stack = []
            CalculatorBrain.counter = 0
            brain.res = 0
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
        case "⌫":
            outputController?.clearLastSymbol()
            if brain.stack != [] {
                let smth: Int? = Int(brain.stack[CalculatorBrain.counter])
                if smth == nil || smth!/10 == 0 {
                    brain.stack.remove(at: CalculatorBrain.counter)
                    CalculatorBrain.counter -= 1
                } else {
                    brain.stack[CalculatorBrain.counter].remove(at: brain.stack[CalculatorBrain.counter].index(before: brain.stack[CalculatorBrain.counter].endIndex))
                }
            }
        case "=":
            if brain.stack == [] {
                break
            }
            if !isEqual {
                isEqual = true
                outputController?.appendSymbol(symbol: symbol)
                var _ = brain.utility(operation: .Equal)
            }
        case "(":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case ")":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
            
        case "MR":
            if !brain.utility(operation: .MRead) {
                outputController?.setWarning(name: String("There is nothing in memory"))
            } else {
                outputController?.setResult(symbol: String(brain.valueInMemory))
                outputController?.appendSymbol(symbol: Double(brain.valueInMemory) == Double(String(Int(Double(brain.valueInMemory)))) ? String(Int(Double(brain.valueInMemory))) : String(brain.valueInMemory))
                symbol = String(brain.valueInMemory)
                fallthrough
            }
        default:
            if outputController?.display.text == "0" {
                outputController?.clearScreen()
            }
            if isConstSymbol(symbol: prevSymbol) {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
            }
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
            }
            outputController?.appendSymbol(symbol: symbol)
            if CalculatorBrain.counter >= -1 {
                if CalculatorBrain.counter == -1 {
                    CalculatorBrain.counter += 1
                } else {
                    let smth: Double? = Double(brain.stack[CalculatorBrain.counter])
                    if smth == nil {
                        CalculatorBrain.counter += 1
                    }
                }
            }
            if brain.stack.count == CalculatorBrain.counter {
                brain.stack.append(symbol)
                dot = 1
            } else if brain.stack.count == 0 {
                brain.stack.append(symbol)
                CalculatorBrain.counter = 0
            } else if dot == 1 {
                brain.stack[CalculatorBrain.counter] = String(Int(String(brain.stack[CalculatorBrain.counter]))! * 10 + (Int(symbol))!)
            } else if dot < 1 {
                brain.stack[CalculatorBrain.counter] = String(Double(String(brain.stack[CalculatorBrain.counter]))! + Double(symbol)!*dot)
                dot *= 0.1
            }
            if invert {
                brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])! * -1)
                invert = false
            }
        }
        prevSymbol = symbol
    }
}

