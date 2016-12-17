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
    static var counter = 0
    static var brackets = false
    static var index = 0
    
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
//            res = 0
            result?(temp,nil)
//            inputString = "\(temp)"
        } else {
            inputString += operation.rawValue
        }
    }
    
    var result: ((Double?, Error?) -> ())?
    
    func DoCalc() -> Double {
        var res: Double = 0.0
        if !CalculatorBrain.brackets {
            CalculatorBrain.index = 0
            if var tmp: Double = Double(stack[0]) {
                res += Double(String(stack[0]))!
//                CalculatorBrain.index += 1
            }
            
        }
        while CalculatorBrain.index < CalculatorBrain.counter {
            print("counter = \(CalculatorBrain.counter)")
            if stack[CalculatorBrain.index+1] == "(" {
                CalculatorBrain.brackets = true
                var temp = CalculatorBrain.index+1
                CalculatorBrain.index += 2
                stack[temp] = String(DoCalc())
                CalculatorBrain.brackets = false
                CalculatorBrain.index += 1
                print(CalculatorBrain.index)
                while (temp < CalculatorBrain.index) {
                    stack.remove(at: CalculatorBrain.index)
                    CalculatorBrain.index -= 1
                }
                CalculatorBrain.index -= 1
                CalculatorBrain.counter = CalculatorBrain.index
                print(CalculatorBrain.index)
//                break
            }
            print(CalculatorBrain.index)
            if  stack[CalculatorBrain.index+1] == ")" {
                break
            }
            switch stack[CalculatorBrain.index] {
            case "√":
                stack[CalculatorBrain.index] = String(sqrt(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "!":
                stack[CalculatorBrain.index] = String(Factorial(n: Int(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "sin":
                stack[CalculatorBrain.index] = String(sin(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "cos":
                stack[CalculatorBrain.index] = String(cos(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "tg":
                stack[CalculatorBrain.index] = String(tan(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "ctg":
                stack[CalculatorBrain.index] = String(1/tan(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "sinh":
                stack[CalculatorBrain.index] = String(sinh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "cosh":
                stack[CalculatorBrain.index] = String(cosh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "tgh":
                stack[CalculatorBrain.index] = String(tanh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "ctgh":
                stack[CalculatorBrain.index] = String(1/tanh(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "ln":
                stack[CalculatorBrain.index] = String(log(Double(stack[CalculatorBrain.index+1])!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "log":
                stack[CalculatorBrain.index] = String(log10(Double(stack[CalculatorBrain.index+1])!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "ctg":
                stack[CalculatorBrain.index] = String(1/tan(Double(String(stack[CalculatorBrain.index+1]))!))
                stack.remove(at: CalculatorBrain.index+1)
                print(CalculatorBrain.counter)
                CalculatorBrain.counter -= 1
                print(CalculatorBrain.counter)
                res = Double(stack[CalculatorBrain.index])!
            case "+":
                res += Double(String(stack[CalculatorBrain.index+1]))!
                CalculatorBrain.index += 1
            case "-":
                res -= Double(String(stack[CalculatorBrain.index+1]))!
                CalculatorBrain.index += 1
            case "✕":
                res *= Double(String(stack[CalculatorBrain.index+1]))!
                CalculatorBrain.index += 1
            case "÷":
                res /= Double(String(stack[CalculatorBrain.index+1]))!
                CalculatorBrain.index += 1
            case "^":
                res = pow(res, Double(String(stack[CalculatorBrain.index+1]))!)
                CalculatorBrain.index += 1
            case "%":
                res = res.truncatingRemainder(dividingBy: Double(String(stack[CalculatorBrain.index+1]))!)
                CalculatorBrain.index += 1
            default:
//                if CalculatorBrain.index == 0 {
//                    res += Double(stack[CalculatorBrain.index])!
//                }
                if CalculatorBrain.brackets && res == 0 {
                    print(CalculatorBrain.index)
                    res += Double(stack[CalculatorBrain.index])!
                }
                CalculatorBrain.index += 1
                break
            }
        }
        if !CalculatorBrain.brackets {
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
