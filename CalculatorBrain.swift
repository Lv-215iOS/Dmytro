//
//  CalculatorBrain.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation

enum BinaryOperation : String{
    case Plus = "+"
    case Minus = "-"
    case Mul = "✕"
    case Div = "÷"
    case Power = "^"
    case Mod = "%"
}

enum UnaryOperation : String{
    case Sin = "sin"
    case Cos = "cos"
    case Tg = "tg"
    case Ctg = "ctg"
    case Sqrt = "√"
}

enum UtilityOperation : String{
    case RightBracket = ")"
    case LeftBracket = "("
    case Dot = "."
    case Equal = "="
    case Clean = "C"
    case CleanLast = "⌫"
}

protocol CalcBrainInterface {
    func digit(value: Double)
    func binary(operation: BinaryOperation)
    func unary(operation: UnaryOperation)
    func utility(operation: UtilityOperation)
    var result: ((Double?, Error?)->())? {get set}
}

class CalculatorBrain: CalcBrainInterface
{
    var inputString = ""
    var stack: [String] = []
    var res: Double = 0.0
    static var counter = 0    
    
    func digit(value: Double) {
        inputString += String(Int(value))
    }
    
    func binary(operation: BinaryOperation) {
        inputString += operation.rawValue
    }
    
    func unary(operation: UnaryOperation) {
        inputString += operation.rawValue
    }
    func utility(operation: UtilityOperation){
        if operation == .Equal {
            let temp = DoCalc()
            res = 0
            result?(temp,nil)
//            inputString = "\(temp)"
        } else {
            inputString += operation.rawValue
        }
    }
    
    var result: ((Double?, Error?) -> ())?
    
    func DoCalc() -> Double {
        var index = 0
        if var tmp: Double = Double(stack[0]) {
            res += Double(String(stack[0]))!
            index += 1
        }
        while index < CalculatorBrain.counter {
            switch stack[index] {
            case "√":
                stack[index] = String(sqrt(Double(String(stack[index+1]))!))
                stack.remove(at: index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[index])!
            case "sin":
                stack[index] = String(sin(Double(String(stack[index+1]))!))
                stack.remove(at: index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[index])!
            case "cos":
                stack[index] = String(cos(Double(String(stack[index+1]))!))
                stack.remove(at: index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[index])!
            case "tg":
                stack[index] = String(tan(Double(String(stack[index+1]))!))
                stack.remove(at: index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[index])!
            case "ctg":
                stack[index] = String(1/tan(Double(String(stack[index+1]))!))
                stack.remove(at: index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[index])!
            case "+":
                res += Double(String(stack[index+1]))!
                index += 1
            case "-":
                res -= Double(String(stack[index+1]))!
                index += 1
            case "✕":
                res *= Double(String(stack[index+1]))!
                index += 1
            case "÷":
                res /= Double(String(stack[index+1]))!
                index += 1
            case "^":
                res = pow(res, Double(String(stack[index+1]))!)
                index += 1
            case "%":
                res = res.truncatingRemainder(dividingBy: Double(String(stack[index+1]))!)
                index += 1
            default:
                break
            }
        }
        stack = []
        CalculatorBrain.counter = 0
        stack.append(String(res))
        return res
    }
    
    
//    private var accumulator = 0.0
//    private var internalProgram = [AnyObject]()
//    var valueFromButton: String = ""
//    var viewController: ViewController? = nil
    
    
    
//    func getValue() {
//        button = (viewController?.getButton)!
//    }
    
    
//    func setOperand(operand: Double) { //getAlllabel
//        accumulator = operand
//        internalProgram.append(operand as AnyObject)    //??
//    }
//    
//    private var  operations: Dictionary<String,Operation> = [
//        "π" : Operation.Constant(M_PI),
//        "e" : Operation.Constant(M_E),
//        "√" : Operation.UnaryOperation(sqrt),
//        "cos" : Operation.UnaryOperation(cos),
//        "✕" : Operation.BinaryOperation({ $0 * $1}),
//        "=" : Operation.Equals,
//        "÷" : Operation.BinaryOperation({ $0 / $1}),
//        "+" : Operation.BinaryOperation({ $0 + $1}),
//        "-" : Operation.BinaryOperation({ $0 - $1}),
//        "+-" : Operation.UnaryOperation({ -$0 })
//        
//    ]
//    
//    private enum Operation {
//        case Constant(Double)
//        case UnaryOperation ((Double) -> Double)
//        case BinaryOperation ((Double, Double) -> Double)
//        case Equals
//        
//    }
//    
//    func performOperation(symbol: String) {
//        internalProgram.append(symbol as AnyObject)
//        if let operation = operations[symbol]{
//            switch operation {
//            case .Constant(let value) :
//                accumulator = value
//            case .UnaryOperation(let function) :
//                accumulator = function(accumulator)
//            case .BinaryOperation(let function) :
//                pending = PendingDinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
//            case .Equals :
//                executePendingBinaryOperation()
//                
//            }
//        }
//    }
//    
//    private func executePendingBinaryOperation()
//    {
//        if pending != nil {
//            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
//            pending = nil
//        }
//    }
//    
//    private var pending: PendingDinaryOperationInfo?
//    
//    private struct  PendingDinaryOperationInfo {
//        var  binaryFunction : (Double, Double) -> Double
//        var  firstOperand : Double
//        
//    }
//    
//    typealias PropertyList = AnyObject
//    
//    var program: PropertyList {
//        get {
//            return internalProgram as CalculatorBrain.PropertyList
//        }
//        set {
//            clear()
//            if let arrayOfOps = newValue as? [AnyObject] {
//                for op in arrayOfOps {
//                    if let operand = op as? Double {
//                        setOperand(operand: operand)
//                    } else if let operation = op as? String {
//                        performOperation(symbol: operation)
//                    }
//                }
//            }
//        }
//    }
//    
//    func clear() {
////        valueFromButton = (viewController?.valueFromButton)!
//        accumulator = 0.0
//        pending = nil
//        internalProgram.removeAll()     //??
//    }
//    
//    var result: Double {
//        get {
//            return accumulator
//        }
//    }
}
