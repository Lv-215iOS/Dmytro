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
    @IBOutlet weak var imageView: UIImageView!    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brain.result = { (value, error)->() in
            if (value != nil) {
                self.outputController?.setResult(symbol: "\(value!)")
            }
        }
        inputController?.buttonTouched = { [unowned self] (operation)->() in self.touchButton(symbols: operation)}
        
        let min = CGFloat(-30)
        let max = CGFloat(30)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionEffectGroup = UIMotionEffectGroup()
        motionEffectGroup.motionEffects = [xMotion,yMotion]
        
        imageView.addMotionEffect(motionEffectGroup)
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
    
    func checkEqual() {
        if outputController?.getLastSymbol() == "=" {
            if Double(Int.max) >= Double(brain.res) {
                outputController?.appendSymbol(symbol: Double(brain.res) == Double(String(Int(Double(brain.res)))) ? String(Int(Double(brain.res))) : String(brain.res))
            } else {
                outputController?.appendSymbol(symbol: String(brain.res))
            }
            if Double(brain.stack[CalculatorBrain.counter]) != Double(String(brain.res)) {
                if Double(brain.stack[CalculatorBrain.counter]) == 0 {
                    brain.stack[CalculatorBrain.counter] = String(brain.res)
                } else {
                    brain.stack.append(String(brain.res))
                }
            }
        }
    }
    
    func actionForSwitch(symbol: String) -> Bool {
        if outputController?.display.text == "" || (Double(String(describing: outputController!.getLastSymbol())) == nil && String(describing: outputController!.getLastSymbol()) != ")" && String(describing: outputController!.getLastSymbol()) != "(") {
            return false
        }
        return true
    }
    
    func append(symbol: String) {
        if !(prevSymbol == "sin" || prevSymbol == "cos" || prevSymbol == "tg" || prevSymbol == "ctg" || prevSymbol == "sinh" || prevSymbol == "cosh" || prevSymbol == "tgh" || prevSymbol == "ctgh" || prevSymbol == "ln" || prevSymbol == "log" || prevSymbol == "√" || prevSymbol == "!") {
            outputController?.appendSymbol(symbol: symbol)
        }
        brain.stack.append(symbol)
        CalculatorBrain.counter += 1
    }
    
    func touchButton(symbols: String) {
        do {
            try process(symbols: symbols)
        } catch let error as MyError {
            outputController?.clearScreen()
            brain.stack = []
            CalculatorBrain.counter = 0
            brain.res = 0
            brain.isFirstEnter = true
            outputController?.setWarning(name: String(describing: error.description()))
            return
        } catch let error as AnotherError {
            outputController?.setWarning(name: String(describing: error.description()))
            return
        } catch let error {
            outputController?.clearScreen()
            brain.stack = []
            CalculatorBrain.counter = 0
            brain.res = 0
            brain.isFirstEnter = true
            outputController?.setWarning(name: error as! String)
            return
        }
    }
    
    func Trigonometry(symb: String) throws -> Bool {
        if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
            let temp = Double(brain.stack[CalculatorBrain.counter])!
            if Double(brain.stack[CalculatorBrain.counter]) != nil {
                switch symb {
                case "sin":
                    brain.stack[CalculatorBrain.counter] = String(sin(Double(brain.stack[CalculatorBrain.counter])!))
                case "cos":
                    brain.stack[CalculatorBrain.counter] = String(cos(Double(brain.stack[CalculatorBrain.counter])!))
                case "tg":
                    brain.stack[CalculatorBrain.counter] = String(tan(Double(brain.stack[CalculatorBrain.counter])!))
                case "ctg":
                    brain.stack[CalculatorBrain.counter] = String(1/tan(Double(brain.stack[CalculatorBrain.counter])!))
                case "sinh":
                    brain.stack[CalculatorBrain.counter] = String(sinh(Double(brain.stack[CalculatorBrain.counter])!))
                case "cosh":
                    brain.stack[CalculatorBrain.counter] = String(cosh(Double(brain.stack[CalculatorBrain.counter])!))
                case "tgh":
                    brain.stack[CalculatorBrain.counter] = String(tanh(Double(brain.stack[CalculatorBrain.counter])!))
                case "ctgh":
                    brain.stack[CalculatorBrain.counter] = String(1/tanh(Double(brain.stack[CalculatorBrain.counter])!))
                case "ln":
                    brain.stack[CalculatorBrain.counter] = String(log(Double(brain.stack[CalculatorBrain.counter])!))
                case "log":
                    brain.stack[CalculatorBrain.counter] = String(log10(Double(brain.stack[CalculatorBrain.counter])!))
                default:
                    break
                }
                if (Double(brain.stack[CalculatorBrain.counter])?.isNaN)! {
                    brain.stack[CalculatorBrain.counter] = "0"
                }
                prevSymbol = brain.stack[CalculatorBrain.counter]
            } else {
                throw MyError(type: .Trigonometry)
            }
            outputController?.clearLastNumber(symbol: String(describing: temp))
            if Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! {
                if (Double(brain.stack[CalculatorBrain.counter])?.isNaN)! {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    brain.isFirstEnter = true
                    throw MyError(type: .NaN)
                } else if (Double(brain.stack[CalculatorBrain.counter])?.isInfinite)! {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = 0
                    brain.res = 0
                    brain.isFirstEnter = true
                    throw MyError(type: .Infinity)
                }
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
            } else {
                outputController?.appendSymbol(symbol: String(brain.stack[CalculatorBrain.counter]))
            }
            
            outputController?.setResult(symbol: String(brain.res))
            return false
        }
        return true
    }
    
    func process(symbols: String) throws {
        var symbol: String = symbols
        if symbol != "=" {
            isEqual = false
        }
        if (outputController?.isResult)! {
            outputController?.isResult = false
        }
        if brain.stack == [] && symbol != "⌫" && symbol != "=" && symbol != "Clear" {
            CalculatorBrain.counter -= 1
        }
        switch symbol {
        case "+", "-":
            if outputController?.display.text == "" {
                if symbol == "-" {
                    outputController?.appendSymbol(symbol: symbol)
                }
                invert = (symbol == "+" ? false : true)
                break
            }
            if outputController?.getLastSymbol() != nil && brain.stack != [] && outputController?.getLastSymbol() == "-" || outputController?.getLastSymbol() == "+" {
                outputController?.clearLastSymbol()
                outputController?.appendSymbol(symbol: symbol)
                brain.stack[CalculatorBrain.counter] = symbol
                invert = (symbol == "+" ? false : true)
                break
            }
            if outputController?.display.text == "-" || prevSymbol == "^" {
                outputController?.clearLastSymbol()
                invert = (symbol == "+" ? false : true)
                break
            }
            checkEqual()
            if !actionForSwitch(symbol: symbol) && prevSymbol != "X" {
                break
            }
            append(symbol: symbol)
        case "✕", "÷", "^", "%":
            checkEqual()
            if !actionForSwitch(symbol: symbol) && prevSymbol != "X"  {
                break
            }
            append(symbol: symbol)
            prevSymbol = symbol
        case "√":
            checkEqual()
            if CalculatorBrain.counter >= brain.stack.count {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = 0
                brain.res = 0
                brain.isFirstEnter = true
                throw MyError(type: .Sqrt)
            }
            if (brain.stack != [] && Double(brain.stack[CalculatorBrain.counter]) != nil && Double(brain.stack[CalculatorBrain.counter])! < 0) {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = 0
                brain.res = 0
                brain.isFirstEnter = true
                throw MyError(type: .NegativeRoot)
            }
            if brain.stack != [] && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) && (Double(brain.stack[CalculatorBrain.counter]) != nil) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                brain.stack[CalculatorBrain.counter] = String(sqrt(Double(brain.stack[CalculatorBrain.counter])!))
                outputController?.clearLastNumber(symbol: String(describing: temp))
                if Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! {
                    outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                } else {
                    outputController?.appendSymbol(symbol: String(brain.stack[CalculatorBrain.counter]))
                }
                
                if outputController?.displayResult.text != "y=" {
                    outputController?.setResult(symbol: String(brain.res))
                }
                break
            }
            if isOperand(symbol: prevSymbol) {
                break
            }
            append(symbol: symbol)
            prevSymbol = symbol
        case "!":
            checkEqual()
            if isOperand(symbol: prevSymbol) {
                break
            }
            if brain.stack != [] && (outputController?.getLastSymbol()) != nil && (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) {
                let temp = Double(brain.stack[CalculatorBrain.counter])!
                if Double(brain.stack[CalculatorBrain.counter]) != nil && Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! {
                    if Double(brain.stack[CalculatorBrain.counter])! >= 0 && Double(brain.stack[CalculatorBrain.counter])! == Double(Int(Double(brain.stack[CalculatorBrain.counter])!)) {
                        self.brain.stack[CalculatorBrain.counter] = String(self.brain.Factorial(n: Int(self.brain.stack[CalculatorBrain.counter])!))
                    } else {
                        outputController?.clearScreen()
                        brain.stack = []
                        CalculatorBrain.counter = 0
                        brain.res = 0
                        brain.isFirstEnter = true
                        throw MyError(type: .Factorial)
                    }
                } else {
                    if Double(brain.stack[CalculatorBrain.counter])! >= 0 {
                        self.brain.stack[CalculatorBrain.counter] = String(self.brain.Factorial(n: Int.max))
                    } else {
                        outputController?.clearScreen()
                        brain.stack = []
                        CalculatorBrain.counter = 0
                        brain.res = 0
                        brain.isFirstEnter = true
                        throw MyError(type: .Factorial)
                    }
                }
                
                outputController?.clearLastNumber(symbol: String(describing: temp))
                if Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! {
                    outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
                } else {
                    outputController?.appendSymbol(symbol: String(brain.stack[CalculatorBrain.counter]))
                }
                if outputController?.displayResult.text != "y=" {
                    outputController?.setResult(symbol: String(brain.res))
                }
                break
            }
            append(symbol: symbol)
            prevSymbol = symbol
        case "sin", "cos", "tg", "ctg", "sinh", "cosh", "tgh", "ctgh", "ln", "log":
            checkEqual()
            if isOperand(symbol: prevSymbol) {
                prevSymbol = symbol
                break
            }
            let isCorrect = try Trigonometry(symb: symbol)
            if !isCorrect {
                break
            }
            append(symbol: symbol)
            prevSymbol = symbol
        case "+/-":
            checkEqual()
            if outputController?.display.text == "" || prevSymbol == "^" {
                outputController?.appendSymbol(symbol: "-")
                invert = true
                break
            } else if outputController!.getLastSymbol() == "-" {
                outputController?.clearLastSymbol()
                invert = false
                break
            } else if Double(String(describing: outputController!.getLastSymbol())) == nil {
                break
            }
            outputController?.clearLastNumber(symbol: brain.stack[CalculatorBrain.counter])
            brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])!*(-1))
            if Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! {
                outputController?.appendSymbol(symbol: Double(brain.stack[CalculatorBrain.counter]) == Double(String(Int(Double(brain.stack[CalculatorBrain.counter])!))) ? String(Int(Double(brain.stack[CalculatorBrain.counter])!)) : String(brain.stack[CalculatorBrain.counter]))
            } else {
                outputController?.appendSymbol(symbol: String(brain.stack[CalculatorBrain.counter]))
            }
            
        case "π", "e", "rand":
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
                brain.isFirstEnter = true
            }
            
            if isConstSymbol(symbol: prevSymbol) && outputController?.display.text != "" {
                break
            }
            if symbol == "rand" {
                append(symbol: String(brain.Rand()))
            } else {
                if isOperand(symbol: prevSymbol) {
                } else {
                    outputController?.appendSymbol(symbol: symbol == "e" ? String(M_E) : String(M_PI))
                }
                brain.stack.append(symbol == "e" ? String(M_E) : String(M_PI))
                CalculatorBrain.counter += 1
            }
            if prevSymbol == "sin" || prevSymbol == "cos" || prevSymbol == "tg" || prevSymbol == "ctg" || prevSymbol == "sinh" || prevSymbol == "cosh" || prevSymbol == "tgh" || prevSymbol == "ctgh" || prevSymbol == "ln" || prevSymbol == "log" {
                if symbol == "rand" {
                    outputController?.clearLastNumber(symbol: brain.stack[CalculatorBrain.counter])
                } else {
                    outputController?.clearLastSymbol()
                }
                switch prevSymbol {
                case "sin":
                    brain.stack[CalculatorBrain.counter] = String(sin(Double(brain.stack[CalculatorBrain.counter])!))
                case "cos":
                    brain.stack[CalculatorBrain.counter] = String(cos(Double(brain.stack[CalculatorBrain.counter])!))
                case "tg":
                    brain.stack[CalculatorBrain.counter] = String(tan(Double(brain.stack[CalculatorBrain.counter])!))
                case "ctg":
                    brain.stack[CalculatorBrain.counter] = String(1/tan(Double(brain.stack[CalculatorBrain.counter])!))
                case "sinh":
                    brain.stack[CalculatorBrain.counter] = String(sinh(Double(brain.stack[CalculatorBrain.counter])!))
                case "cosh":
                    brain.stack[CalculatorBrain.counter] = String(cosh(Double(brain.stack[CalculatorBrain.counter])!))
                case "tgh":
                    brain.stack[CalculatorBrain.counter] = String(tanh(Double(brain.stack[CalculatorBrain.counter])!))
                case "ctgh":
                    brain.stack[CalculatorBrain.counter] = String(1/tanh(Double(brain.stack[CalculatorBrain.counter])!))
                case "ln":
                    brain.stack[CalculatorBrain.counter] = String(log(Double(brain.stack[CalculatorBrain.counter])!))
                case "log":
                    brain.stack[CalculatorBrain.counter] = String(log10(Double(brain.stack[CalculatorBrain.counter])!))
                default:
                    break
                }
                prevSymbol = brain.stack[CalculatorBrain.counter]
                brain.stack.remove(at: CalculatorBrain.counter-1)
                CalculatorBrain.counter -= 1
                break
            }
            if prevSymbol == "√" || prevSymbol == "!" {
                if symbol == "rand" {
                    outputController?.clearLastNumber(symbol: brain.stack[CalculatorBrain.counter])
                } else {
                    outputController?.clearLastSymbol()
                }
                switch prevSymbol {
                case "√":
                    if Double(brain.stack[CalculatorBrain.counter])! >= 0 {
                        brain.stack[CalculatorBrain.counter] = String(sqrt(Double(brain.stack[CalculatorBrain.counter])!))
                    } else {
                        throw MyError(type: .Sqrt)
                    }
                case "!":
                    throw MyError(type: .Factorial)
                default:
                    break
                }
                prevSymbol = brain.stack[CalculatorBrain.counter]
                outputController?.appendSymbol(symbol: prevSymbol)
                brain.stack.remove(at: CalculatorBrain.counter-1)
                CalculatorBrain.counter -= 1
                break
            }
        case ".":
            if prevSymbol == symbol {
                return
            }
            let new_symbol: String = String(describing: outputController!.getLastSymbol())
            if isConstSymbol(symbol: prevSymbol) {
                outputController?.appendSymbol(symbol: "✕")
                brain.stack.append("✕")
                CalculatorBrain.counter += 1
            }
            if Int(new_symbol) != nil && !(Int(new_symbol)! >= 0 && Int(new_symbol)! < 0) {
            } else if isOperandAction(symbol: brain.stack[CalculatorBrain.counter]) {
                brain.stack.append("0")
                dot *= 10
                outputController?.appendSymbol(symbol: "0.")
            } else {
                outputController?.clearScreen()
                brain.stack[CalculatorBrain.counter] = String(0)
                brain.res = 0
                dot = 1
                brain.isFirstEnter = true
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
                if (CalculatorBrain.counter >= 0 && (Double(brain.stack[CalculatorBrain.counter]) != nil)) || isConstSymbol(symbol: prevSymbol) {
                    if dot >= 1 {
                        if outputController?.display.text == "" {
                            outputController?.appendSymbol(symbol: "0")
                        }
                        outputController?.appendSymbol(symbol: symbol)
                        if isConstSymbol(symbol: prevSymbol) {
                            brain.stack.append(String(0))
                            CalculatorBrain.counter += 1
                        }
                        dot *= 0.1
                    }
                    
                }
            }
            prevSymbol = symbol
        case "C":
            outputController?.clearScreen()
            brain.stack = []
            CalculatorBrain.counter = 0
            brain.res = 0
            brain.isFirstEnter = true
        case "M+":
            if !brain.utility(operation: .MPlus) {
                throw AnotherError(type: .NoEnter)
            } else {
                if let value = Double(brain.stack[0]) {
                    brain.valueInMemory += value
                } else {
                    prevSymbol = symbol
                    throw AnotherError(type: .M_plus_error)
                }
            }
        case "M-":
            if !brain.utility(operation: .MMinus) {
                throw AnotherError(type: .NoEnter)
            } else {
                if let value = Double(brain.stack[0]) {
                    brain.valueInMemory -= value
                } else {
                    prevSymbol = symbol
                    throw AnotherError(type: .M_minus_error)
                }
            }
        case "MC":
            if !brain.utility(operation: .MClear) {
                throw AnotherError(type: .NothingInMemory)
            } else {
                brain.valueInMemory = 0
            }
        case "⌫":
            outputController?.clearLastSymbol()
            if brain.stack != [] {
                if Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! {
                    let smth: Int? = Int(brain.stack[CalculatorBrain.counter])
                    if smth == nil || smth!/10 == 0 {
                        brain.stack.remove(at: CalculatorBrain.counter)
                        CalculatorBrain.counter -= 1
                    } else {
                        brain.stack[CalculatorBrain.counter].remove(at: brain.stack[CalculatorBrain.counter].index(before: brain.stack[CalculatorBrain.counter].endIndex))
                    }
                } else {
                    let smth: Double? = Double(brain.stack[CalculatorBrain.counter])!
                    if smth == nil || smth!/10 == 0 {
                        brain.stack.remove(at: CalculatorBrain.counter)
                        CalculatorBrain.counter -= 1
                    } else {
                        brain.stack[CalculatorBrain.counter].remove(at: brain.stack[CalculatorBrain.counter].index(before: brain.stack[CalculatorBrain.counter].endIndex))
                    }
                }
                
                
            }
        case "=":
            if brain.stack == [] {
                break
            }
            
            if !brain.isBracketEqual() {
                throw MyError(type: .Brackets)
            }
            
            if isOperandAction(symbol: String(describing: outputController!.getLastSymbol())) {
                outputController?.clearLastSymbol()
            }
            if outputController?.getLastSymbol() == "." {
                throw MyError(type: .Error)
            }
            if (inputController?.isGraphic)! {
                inputController?.graphicController?.function = ""
                for str in brain.stack {
                    inputController?.graphicController?.function?.append(str)
                }
                var _ = brain.utility(operation: .Equal)
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = 0
                brain.res = 0
                brain.isFirstEnter = true
            } else {
                if !isEqual {
                    isEqual = true
                    if outputController?.getLastSymbol() != "=" {
                        outputController?.appendSymbol(symbol: symbol)
                        var _ = brain.utility(operation: .Equal)
                        if brain.stack == [] {
                            throw MyError(type: .Error)
                        }
                    }
                }
            }
            
            if CalculatorBrain.counter < 0 {
                outputController?.clearScreen()
                throw AnotherError(type: .Counter)
            }
        case "(":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case ")":
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "X":
            if outputController?.getLastSymbol() == "-" {
                append(symbol: "-1")
            }
            if outputController?.getLastSymbol() == "0" && brain.stack == [] {
                append(symbol: "1")
            }
            if Double((outputController?.getNLastSymbol(n: 1))!) != nil || outputController?.getNLastSymbol(n: 1) == "X" {
                outputController?.appendSymbol(symbol: "✕")
                brain.stack.append("✕")
                CalculatorBrain.counter += 1
            }
            outputController?.appendSymbol(symbol: symbol)
            brain.stack.append(symbol)
            CalculatorBrain.counter += 1
        case "Clear":            
            inputController?.graphicController?.data.removeAll()
            brain.data.removeAll()
        case "MR":
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
                brain.isFirstEnter = true
            }
            prevSymbol = symbol
            if !brain.utility(operation: .MRead) || brain.valueInMemory == 0 {
                throw AnotherError(type: .NothingInMemory)
            } else {
                outputController?.setResult(symbol: String(brain.valueInMemory))
                if Double(Int.max) >= Double(brain.valueInMemory) {
                    outputController?.appendSymbol(symbol: Double(brain.valueInMemory) == Double(String(Int(Double(brain.valueInMemory)))) ? String(Int(Double(brain.valueInMemory))) : String(brain.valueInMemory))
                } else {
                    outputController?.appendSymbol(symbol: String(brain.valueInMemory))
                }
                
                symbol = String(brain.valueInMemory)
                CalculatorBrain.counter += 1
                brain.res = brain.valueInMemory
                brain.stack.append(String(brain.res))
            }
        default:
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) && prevSymbol == "MR" {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.isFirstEnter = true
                brain.res = 0
            }
            if outputController?.display.text == "0" {
                outputController?.clearScreen()
            }
            if isConstSymbol(symbol: prevSymbol) {
                outputController?.clearScreen()
                brain.stack = []
                CalculatorBrain.counter = -1
                brain.res = 0
                brain.isFirstEnter = true
            }
            if (outputController?.getLastSymbol())! >= Character(String(0)) && (outputController?.getLastSymbol())! <= Character(String(9)) || outputController?.getLastSymbol() == "=" {
                if outputController?.getLastSymbol() == "=" || isConstSymbol(symbol: String(describing: outputController?.getLastSymbol())) {
                    outputController?.clearScreen()
                    brain.stack = []
                    CalculatorBrain.counter = -1
                    brain.res = 0
                    brain.isFirstEnter = true
                }
            }
            outputController?.appendSymbol(symbol: symbol)
            prevSymbol = symbol
            if CalculatorBrain.counter >= -1 {
                if CalculatorBrain.counter == -1 {
                    CalculatorBrain.counter += 1
                } else {
                    if brain.stack.count <= CalculatorBrain.counter && (inputController?.isGraphic)! {
                        CalculatorBrain.counter = -1
                    } else {
                        let smth: Double? = Double(brain.stack[CalculatorBrain.counter])
                        if smth == nil {
                            CalculatorBrain.counter += 1
                        }
                    }
                }
            }
            if brain.stack.count == CalculatorBrain.counter {
                if (inputController?.isGraphic)! {
                    brain.isConstGraph = true
                }
                brain.stack.append(symbol)
                dot = 1
            } else if brain.stack.count == 0 {
                brain.stack.append(symbol)
                prevSymbol = brain.stack[0]
                CalculatorBrain.counter = 0
            } else if dot == 1 {
                if Double(brain.stack[CalculatorBrain.counter]) != nil && Double(Int.max) >= Double(brain.stack[CalculatorBrain.counter])! && Double(brain.stack[CalculatorBrain.counter]) != Double(Int(Double(brain.stack[CalculatorBrain.counter])!)) {
                    brain.stack[CalculatorBrain.counter] = String(0)
                    outputController?.clearScreen()
                    outputController?.appendSymbol(symbol: symbols)
                }
                if Double(brain.stack[CalculatorBrain.counter]) == nil {
                    throw MyError(type: .Error)
                }
                brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])! * 10 + (Double(symbol))!)
            } else if dot < 1 {
                brain.stack[CalculatorBrain.counter] = String(Double(String(brain.stack[CalculatorBrain.counter]))! + Double(symbol)!*dot)
                dot *= 0.1
            }
            if invert {
                brain.stack[CalculatorBrain.counter] = String(Double(brain.stack[CalculatorBrain.counter])! * -1)
                invert = false
            }
        }
        if brain.stack.count != 1 {
            prevSymbol = symbol
        }
        
    }
}
