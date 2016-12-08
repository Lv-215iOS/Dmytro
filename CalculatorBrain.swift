//
//  CalculatorBrain.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import Foundation

//func multiply(op1: Double, op2: Double) -> Double {
//    return op1 * op2
//}
//
//func devide(op1: Double, op2: Double) -> Double {
//    if op2 == 0 {
//        return op2
//    }
//    return op1 / op2
//}
//
//func add(op1: Double, op2: Double) -> Double {
//    return op1 + op2
//}
//
//func substract(op1: Double, op2: Double) -> Double {
//    return op1 - op2
//}

class CalculatorBrain
{
    private var accumulator = 0.0
    
    private var internalProgram = [AnyObject]()
    
    func setOperand(operand: Double) { //getAlllabel
        accumulator = operand
        internalProgram.append(operand as AnyObject)
    }
    
    private var  operations: Dictionary<String,Operation> = [
        "π" : Operation.Constant(M_PI),
        "e" : Operation.Constant(M_E),
        "√" : Operation.UnaryOperation(sqrt),
        "cos" : Operation.UnaryOperation(cos),
        "✕" : Operation.BinaryOperation({ $0 * $1}),
        "=" : Operation.Equals,
        "÷" : Operation.BinaryOperation({ $0 / $1}),
        "+" : Operation.BinaryOperation({ $0 + $1}),
        "-" : Operation.BinaryOperation({ $0 - $1}),
        "+-" : Operation.UnaryOperation({ -$0 })
        
    ]
    
    private enum Operation {
        case Constant(Double)
        case UnaryOperation ((Double) -> Double)
        case BinaryOperation ((Double, Double) -> Double)
        case Equals
        
    }
    
    func performOperation(symbol: String) {
        internalProgram.append(symbol as AnyObject)
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let value) :
                accumulator = value
            case .UnaryOperation(let function) :
                accumulator = function(accumulator)
            case .BinaryOperation(let function) :
                pending = PendingDinaryOperationInfo(binaryFunction: function, firstOperand: accumulator)
            case .Equals :
                executePendingBinaryOperation()
                
            }
        }
    }
    
    private func executePendingBinaryOperation()
    {
        if pending != nil {
            accumulator = pending!.binaryFunction(pending!.firstOperand, accumulator)
            pending = nil
        }
    }
    
    private var pending: PendingDinaryOperationInfo?
    
    private struct  PendingDinaryOperationInfo {
        var  binaryFunction : (Double, Double) -> Double
        var  firstOperand : Double
        
    }
    
    typealias PropertyList = AnyObject
    
    var program: PropertyList {
        get {
            return internalProgram as CalculatorBrain.PropertyList
        }
        set {
            clear()
            if let arrayOfOps = newValue as? [AnyObject] {
                for op in arrayOfOps {
                    if let operand = op as? Double {
                        setOperand(operand: operand)
                    } else if let operation = op as? String {
                        performOperation(symbol: operation)
                    }
                }
            }
        }
    }
    
    func clear() {
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result: Double {
        get {
            return accumulator
        }
    }
}
