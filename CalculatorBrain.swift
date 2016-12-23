//
//  CalculatorBrain.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation
import UIKit

enum BinaryOperation : String{
    case Plus = "+"
    case Minus = "-"
    case Mul = "✕"
    case Div = "÷"
    case Pow = "^"
    case Mod = "%"
}

enum UnaryOperation : String{
    case Sin = "sin"
    case Cos = "cos"
    case Tg = "tg"
    case Ctg = "ctg"
    case Sqrt = "√"
    case Ln = "ln"
    case Log = "log"
    case Sinh = "sinh"
    case Cosh = "cosh"
    case Tgh = "tgh"
    case Ctgh = "ctgh"
    case Fact = "!"
}

enum UtilityOperation : String{
    case RightBracket = ")"
    case LeftBracket = "("
    case Dot = "."
    case Equal = "="
    case Clean = "C"
    case CleanLast = "⌫"
    case MPlus = "M+"
    case MMinus = "M-"
    case MClear = "MC"
    case MRead = "MR"
}

protocol CalcBrainInterface {
    func digit()
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation) -> Bool
    var result: ((Double?, Error?)->())? {get set}
}

class CalculatorBrain:  CalcBrainInterface
{
    var stack: [String] = []
    static var counter = 0
    static var brackets = false
    static var index = 0
    var valueInMemory = 0.0
    var viewController: ViewController? = nil
    var res: Double = 0.0
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    var result: ((Double?, Error?) -> ())?
    
    func digit() {
        if CalculatorBrain.brackets && res == 0 {
            res += Double(stack[CalculatorBrain.index])!
        }
        CalculatorBrain.index += 1
    }
    
    func binary(operation: BinaryOperation) {
        switch operation {
        case .Plus:
            res += Double(String(stack[CalculatorBrain.index+1]))!
            CalculatorBrain.index += 1
        case .Minus:
            res -= Double(String(stack[CalculatorBrain.index+1]))!
            CalculatorBrain.index += 1
        case .Mul:
            res *= Double(String(stack[CalculatorBrain.index+1]))!
            CalculatorBrain.index += 1
        case .Div:
            if Double(String(stack[CalculatorBrain.index+1]))! == 0 {
                res = 0
                outputController?.setWarning(name: String("Infinity"))
            } else {
                res /= Double(String(stack[CalculatorBrain.index+1]))!
            }
            CalculatorBrain.index += 1
        case .Pow:
            res = pow(res, Double(String(stack[CalculatorBrain.index+1]))!)
            CalculatorBrain.index += 1
        case .Mod:
            res = res.truncatingRemainder(dividingBy: Double(String(stack[CalculatorBrain.index+1]))!)
            CalculatorBrain.index += 1
        }
    }
    
    func unary(operation: UnaryOperation) {
        switch operation {
        case .Sqrt:        
            stack[CalculatorBrain.index] = String(sqrt(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Fact:
            stack[CalculatorBrain.index] = String(Factorial(n: Int(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Sin:
            stack[CalculatorBrain.index] = String(sin(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Cos:
            stack[CalculatorBrain.index] = String(cos(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Tg:
            stack[CalculatorBrain.index] = String(tan(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Ctg:
            stack[CalculatorBrain.index] = String(1/tan(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Sinh:
            stack[CalculatorBrain.index] = String(sinh(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Cosh:
            stack[CalculatorBrain.index] = String(cosh(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Tgh:
            stack[CalculatorBrain.index] = String(tanh(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Ctgh:
            stack[CalculatorBrain.index] = String(1/tanh(Double(String(stack[CalculatorBrain.index+1]))!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Ln:
            stack[CalculatorBrain.index] = String(log(Double(stack[CalculatorBrain.index+1])!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        case .Log:
            stack[CalculatorBrain.index] = String(log10(Double(stack[CalculatorBrain.index+1])!))
            stack.remove(at: CalculatorBrain.index+1)
            print(CalculatorBrain.counter)
            CalculatorBrain.counter -= 1
            print(CalculatorBrain.counter)
            res = Double(stack[CalculatorBrain.index])!
        }
    }
    
    func utility(operation: UtilityOperation) -> Bool{
        switch operation {
        case .Equal:
            let temp = DoCalc()
            result?(temp,nil)
        case .MPlus:
            if stack == [] {
                return false
            }
        case .MMinus:
            if stack == [] {
                return false
            }
        case .MClear:
            if stack == [] && valueInMemory == 0 {
                return false
            }
        case .MRead:
            if valueInMemory == 0 && stack == [] {
                return false
            }
        case .Clean:
            viewController?.outputController?.clearScreen()
            stack = []
            CalculatorBrain.counter = 0
        default:
            break
        }
        return true
    }
    
    func DoCalc() -> Double {
        
        if !CalculatorBrain.brackets && stack != [] && !(stack[1] == "√" || stack[1] == "sin" || stack[1] == "cos" || stack[1] == "tg" || stack[1] == "ctg" || stack[1] == "ln" || stack[1] == "log" || stack[1] == "sinh" || stack[1] == "cosh" || stack[1] == "tgh" || stack[1] == "ctgh" || stack[1] == "!") {
            CalculatorBrain.index = 0
            if var _: Double = Double(stack[0]) {
                res += Double(String(stack[0]))!
            }
        }
        
        while CalculatorBrain.index < CalculatorBrain.counter {
            if stack[CalculatorBrain.index+1] == "(" {
                CalculatorBrain.brackets = true
                let temp = CalculatorBrain.index+1
                CalculatorBrain.index += 2
                stack[temp] = String(DoCalc())
                CalculatorBrain.brackets = false
                CalculatorBrain.index += 1
                while (temp < CalculatorBrain.index) {
                    stack.remove(at: CalculatorBrain.index)
                    CalculatorBrain.index -= 1
                }
                CalculatorBrain.index -= 1
                CalculatorBrain.counter = CalculatorBrain.index
            }
            
            if stack[CalculatorBrain.index+1] == ")" {
                break
            }
            
            
            if CalculatorBrain.index+2 < stack.count, var _: Double = Double(stack[CalculatorBrain.index+2]) {
                print(stack[0])
            } else {
                if stack[CalculatorBrain.index+1] == "√" || stack[CalculatorBrain.index+1] == "sin" || stack[CalculatorBrain.index+1] == "cos" || stack[CalculatorBrain.index+1] == "tg" || stack[CalculatorBrain.index+1] == "ctg" || stack[CalculatorBrain.index+1] == "ln" || stack[CalculatorBrain.index+1] == "log" || stack[CalculatorBrain.index+1] == "sinh" || stack[CalculatorBrain.index+1] == "cosh" || stack[CalculatorBrain.index+1] == "tgh" || stack[CalculatorBrain.index+1] == "ctgh" || stack[CalculatorBrain.index+1] == "!" {
                    let temp = stack[CalculatorBrain.index]
                    stack[CalculatorBrain.index] = stack[CalculatorBrain.index+1]
                    stack[CalculatorBrain.index+1] = temp
                }
            }
            
            switch stack[CalculatorBrain.index] {
            case "+":
                binary(operation: .Plus)
            case "-":
                binary(operation: .Minus)
            case "✕":
                binary(operation: .Mul)
            case "÷":
                binary(operation: .Div)
            case "^":
                binary(operation: .Pow)
            case "%":
                binary(operation: .Mod)
            case "√":
                unary(operation: .Sqrt)
            case "!":
                unary(operation: .Fact)
            case "sin":
                unary(operation: .Sin)
            case "cos":
                unary(operation: .Cos)
            case "tg":
                unary(operation: .Tg)
            case "ctg":
                unary(operation: .Ctg)
            case "sinh":
                unary(operation: .Sinh)
            case "cosh":
                unary(operation: .Cosh)
            case "tgh":
                unary(operation: .Tgh)
            case "ctgh":
                unary(operation: .Ctgh)
            case "ln":
                unary(operation: .Ln)
            case "log":
                unary(operation: .Log)
            case "ctg":
                unary(operation: .Ctg)
            default:
                digit()
                break
            }
        }
        if !CalculatorBrain.brackets && stack != [] {
            stack = []
            CalculatorBrain.counter = 0
            stack.append(String(res))
        }
        return res
    }
    
    func Factorial(n: Int) -> Int {
        if n == 0 { return 1 }
        else {
            return n*Factorial(n: n - 1)
        }
    }
    
    func Rand() -> Float {
        return Float(arc4random()) /  Float(UInt32.max) * 1000.0 - 500.0
    }
}
