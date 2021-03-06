//
//  CalculatorBrain.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation
import UIKit

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
    var isFirstEnter = true
    var contentX = [Bool]()
    var data: [[CGFloat]] = []
    var isConstGraph = false
    
    func digit(value: Double) {
        if CalculatorBrain.brackets && res == 0 {
            res += value
        }
        CalculatorBrain.index += 1
    }
    
    func isContainX() -> Bool {
        var good = false
        for i in 0..<stack.count {
            if stack[i] == "X" {
                contentX[i] = true
                good = true
            }
        }
        if good {
            return true
        }
        return false
    }
    
    func changeValueFromX(into: Double) {
        for i in 0..<stack.count {
            if contentX[i] {
                stack[i] = String(into)
            }
        }
    }
    
    func changeValueIntoX() {
        for i in 0..<stack.count {
            if contentX[i] {
                stack[i] = "X"
            }
        }
    }
    
    func binary(operation: BinaryOperation) {
        if CalculatorBrain.index+1 >= stack.count {
            outputController?.clearScreen()
            stack = []
            CalculatorBrain.counter = 0
            res = 0
            isFirstEnter = true
            outputController?.setWarning(name: "Error")
        } else {
            switch operation {
            case .Plus:
                res += Double(String(stack[CalculatorBrain.index+1]))!
                stack[CalculatorBrain.index-1] = String(res)
                stack.remove(at: CalculatorBrain.index+1)
                stack.remove(at: CalculatorBrain.index)
            case .Minus:
                res -= Double(String(stack[CalculatorBrain.index+1]))!
                stack[CalculatorBrain.index-1] = String(res)
                stack.remove(at: CalculatorBrain.index+1)
                stack.remove(at: CalculatorBrain.index)
            case .Mul:
                res *= Double(String(stack[CalculatorBrain.index+1]))!
                stack[CalculatorBrain.index-1] = String(res)
                stack.remove(at: CalculatorBrain.index+1)
                stack.remove(at: CalculatorBrain.index)
            case .Div:
                if Double(String(stack[CalculatorBrain.index+1]))! == 0 {
                    CalculatorBrain.counter = -1 * Int(Double(stack[0])!)
                    stack = []
                    res = isConstGraph ? Double(Int.max) : 0
                    isFirstEnter = true
                    break
                } else {
                    res /= Double(String(stack[CalculatorBrain.index+1]))!
                }
                stack[CalculatorBrain.index-1] = String(res)
                stack.remove(at: CalculatorBrain.index+1)
                stack.remove(at: CalculatorBrain.index)
            case .Pow:
                res = pow(res, Double(String(stack[CalculatorBrain.index+1]))!)
                stack[CalculatorBrain.index-1] = String(res)
                stack.remove(at: CalculatorBrain.index+1)
                stack.remove(at: CalculatorBrain.index)
            case .Mod:
                res = res.truncatingRemainder(dividingBy: Double(String(stack[CalculatorBrain.index+1]))!)
                stack[CalculatorBrain.index-1] = String(res)
                stack.remove(at: CalculatorBrain.index+1)
                stack.remove(at: CalculatorBrain.index)
            }
        }
    }
    
    func unary(operation: UnaryOperation) {
        if CalculatorBrain.index+1 >= stack.count {
            outputController?.clearScreen()
            stack = []
            CalculatorBrain.counter = 0
            res = 0
            isFirstEnter = true
            outputController?.setWarning(name: "Error")
        } else {
            switch operation {
            case .Sqrt:
                stack[CalculatorBrain.index] = String(sqrt(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Fact:
                if Int(String(stack[CalculatorBrain.index+1])) == nil && CalculatorBrain.index >= 0{
                    stack[CalculatorBrain.index] = String(Factorial(n: Int(String(stack[CalculatorBrain.index]))!))
                } else {
                    stack[CalculatorBrain.index] = String(Factorial(n: Int(String(stack[CalculatorBrain.index+1]))!))
                    CalculatorBrain.counter -= 1
                }
                stack.remove(at: CalculatorBrain.index+1)
                res = Double(stack[CalculatorBrain.index])!
            case .Sin:
                if Double(String(stack[CalculatorBrain.index+1])) == nil {
                    outputController?.clearScreen()
                    stack = []
                    CalculatorBrain.counter = 0
                    res = 0
                    isFirstEnter = true
                    outputController?.setWarning(name: "Error")
                    return
                }
                stack[CalculatorBrain.index] = String(sin(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Cos:
                stack[CalculatorBrain.index] = String(cos(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Tg:
                stack[CalculatorBrain.index] = String(tan(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Ctg:
                stack[CalculatorBrain.index] = String(1/tan(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Sinh:
                stack[CalculatorBrain.index] = String(sinh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Cosh:
                stack[CalculatorBrain.index] = String(cosh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Tgh:
                stack[CalculatorBrain.index] = String(tanh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Ctgh:
                stack[CalculatorBrain.index] = String(1/tanh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Ln:
                stack[CalculatorBrain.index] = String(log(Double(stack[CalculatorBrain.index+1])!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            case .Log:
                stack[CalculatorBrain.index] = String(log10(Double(stack[CalculatorBrain.index+1])!))
                stack.remove(at: CalculatorBrain.index+1)
                CalculatorBrain.counter -= 1
                res = Double(stack[CalculatorBrain.index])!
            }
        }
    }
    
    func utility(operation: UtilityOperation) -> Bool{
        equal: switch operation {
        case .Equal:
            data = []
            let counter = CalculatorBrain.counter
            contentX = Array(repeating: false, count: stack.count)
            let stackCopy = stack
            if isContainX() || isConstGraph {
                for i in 0..<71 {
                    stack = stackCopy
                    CalculatorBrain.counter = counter
                    changeValueFromX(into: Double(i) * 0.1)
                    if i == 0 {
                        data.append([CGFloat(DoCalc())])
                    } else {
                        data[data.count - 1] += [CGFloat(DoCalc(number: i))]
                    }
                    changeValueIntoX()
                    res = 0
                    CalculatorBrain.index = 0
                    isFirstEnter = true
                }
                isConstGraph = false
            } else {
                let temp = DoCalc()
                result?(temp,nil)
            }
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
    
    func isOperand(symbol: String) -> Bool {
        if symbol == "+" || symbol == "-" || symbol == "✕" || symbol == "÷" || symbol == "^" || symbol == "%" {
            return true
        }
        return false
    }
    
    func isHigherPriority(numn: Int) -> Bool {
        var num = numn
        while num+1 <= stack.count {
            if stack[num] == "✕" || stack[num] == "÷" || stack[num] == "^" || stack[num] == "%" {
                return true
            }
            num += 1
        }
        return false
    }
    
    func isBracket(from: Int) -> Int? {
        var cur_index = from
        while cur_index+1 <= stack.count {
            if stack[cur_index] == "(" {
                return cur_index
            }
            cur_index += 1
        }
        return nil
    }
    
    func isBracketEqual() -> Bool {
        var possition = 0
        var status = 0
        while possition+1 <= stack.count {
            if stack[possition] == "(" {
                status += 1
            } else if stack[possition] == ")" {
                status -= 1
            }
            possition += 1
        }
        if status == 0 {
            return true
        } else {
            return false
        }
    }
    
    func DoCalc(number: Int = 0) -> Double {
        if stack.count == 1 && Double(stack[0]) != nil {
            res = Double(stack[0])!
            return res
        }
        
        if stack.count > 1 && CalculatorBrain.counter >= 1 && !CalculatorBrain.brackets && stack != [] && !(stack[1] == "√" || stack[1] == "sin" || stack[1] == "cos" || stack[1] == "tg" || stack[1] == "ctg" || stack[1] == "ln" || stack[1] == "log" || stack[1] == "sinh" || stack[1] == "cosh" || stack[1] == "tgh" || stack[1] == "ctgh" || stack[1] == "!") {
            if isFirstEnter {
                CalculatorBrain.index = 0
                isFirstEnter = false
            }
            if CalculatorBrain.index >= CalculatorBrain.counter {
                outputController?.clearScreen()
                stack = []
                CalculatorBrain.counter = 0
                res = 0
                isFirstEnter = true
                outputController?.setWarning(name: "Error")
                return 0
            } else if var _: Double = Double(stack[CalculatorBrain.index]) {
                if Double(stack[CalculatorBrain.index]) != res {
                    res += Double(String(stack[CalculatorBrain.index]))!
                }
            }
        } else if CalculatorBrain.counter == 0 {
            if Double(String(stack[0])) == nil {
                outputController?.clearScreen()
                stack = []
                CalculatorBrain.counter = 0
                res = 0
                isFirstEnter = true
                outputController?.setWarning(name: "Error")
                return 0
            }
            res += Double(String(stack[0]))!
        }
        
        while CalculatorBrain.index < CalculatorBrain.counter || (CalculatorBrain.index+1 <=  stack.count && stack[CalculatorBrain.index] == "%") {
            if CalculatorBrain.index+1 > stack.count {
                if stack.count == 1 {
                    CalculatorBrain.counter = 0
                }
                return res
            }
            if stack[CalculatorBrain.index] != "%" {
                if CalculatorBrain.index+2 < stack.count && Double(stack[CalculatorBrain.index+2]) != nil && (stack[CalculatorBrain.index+1] == "√" || stack[CalculatorBrain.index+1] == "sin" || stack[CalculatorBrain.index+1] == "cos" || stack[CalculatorBrain.index+1] == "tg" || stack[CalculatorBrain.index+1] == "ctg" || stack[CalculatorBrain.index+1] == "ln" || stack[CalculatorBrain.index+1] == "log" || stack[CalculatorBrain.index+1] == "sinh" || stack[CalculatorBrain.index+1] == "cosh" || stack[CalculatorBrain.index+1] == "tgh" || stack[CalculatorBrain.index+1] == "ctgh" || stack[CalculatorBrain.index+1] == "!") {
                    switch stack[CalculatorBrain.index+1] {
                    case "√":
                        stack[CalculatorBrain.index+1] = String(sqrt(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "sin":
                        stack[CalculatorBrain.index+1] = String(sin(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "cos":
                        stack[CalculatorBrain.index+1] = String(cos(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "tg":
                        stack[CalculatorBrain.index+1] = String(tan(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "ctg":
                        stack[CalculatorBrain.index+1] = String(1/tan(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "ln":
                        stack[CalculatorBrain.index+1] = String(log(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "log":
                        stack[CalculatorBrain.index+1] = String(log10(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "sinh":
                        stack[CalculatorBrain.index+1] = String(sinh(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "cosh":
                        stack[CalculatorBrain.index+1] = String(cosh(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "tgh":
                        stack[CalculatorBrain.index+1] = String(tanh(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "ctgh":
                        stack[CalculatorBrain.index+1] = String(1/tanh(Double(stack[CalculatorBrain.index+2])!))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    case "!":
                        stack[CalculatorBrain.index+1] = String(Factorial(n: Int(Double(stack[CalculatorBrain.index+2])!)))
                        stack.remove(at: CalculatorBrain.index+2)
                        CalculatorBrain.counter -= 1
                    default:
                        break
                    }
                }
            }
            
            if let temp_index: Int = isBracket(from: CalculatorBrain.index) {
                let cur_index = CalculatorBrain.index
                CalculatorBrain.index = temp_index+1
                let temp_res = res
                res = 0
                let _ = DoCalc()
                if temp_index >= stack.count || stack == [] {
                    outputController?.clearScreen()
                    stack = []
                    CalculatorBrain.counter = 0
                    res = 0
                    isFirstEnter = true
                    outputController?.setWarning(name: "Error")
                    break
                }
                stack[temp_index] = String(res)
                stack.remove(at: CalculatorBrain.index-1)
                CalculatorBrain.index = cur_index
                
                
                if stack.count != 1 {
                    res = temp_res
                }
                continue
            }
            
            if stack[CalculatorBrain.index] == ")" {
                stack.remove(at: CalculatorBrain.index)
                return res
            }
            switch stack[CalculatorBrain.index] {
            case "+":
                if isHigherPriority(numn: CalculatorBrain.index+1) {
                    let temp_index = CalculatorBrain.index
                    CalculatorBrain.index += 1
                    let temp_res = res
                    res = 0
                    let _ = DoCalc()
                    CalculatorBrain.index = temp_index
                    res = temp_res
                }
                binary(operation: .Plus)
            case "-":
                if isHigherPriority(numn: CalculatorBrain.index+1) {
                    let temp_index = CalculatorBrain.index
                    CalculatorBrain.index += 1
                    let temp_res = res
                    res = 0
                    let _ = DoCalc()
                    CalculatorBrain.index = temp_index
                    res = temp_res
                }
                binary(operation: .Minus)
            case "✕":
                binary(operation: .Mul)
            case "÷":
                binary(operation: .Div)
            case "^":
                binary(operation: .Pow)
            case "%":
                if CalculatorBrain.index+1 == stack.count || (CalculatorBrain.index+1 <= stack.count && Double(stack[CalculatorBrain.index+1]) == nil) {
                    stack[CalculatorBrain.index-1] = String(describing: Double(stack[CalculatorBrain.index-1])! * 0.01)
                    res = Double(stack[CalculatorBrain.index-1])!
                    stack.remove(at: CalculatorBrain.index)
                    break
                }
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
                digit(value: Double(stack[CalculatorBrain.index])!)
                break
            }
        }
        if !CalculatorBrain.brackets && stack != [] {
            if !data.isEmpty {
            } else {
                stack = []
                CalculatorBrain.counter = 0
                if !res.isInfinite {
                    stack.append(String(res == Double(Int(res)) ? String(Int(res)) : String(Double(Int(res)))))
                } else {
                    stack.append(String(Int.max))
                    res = 0
                }
            }
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
