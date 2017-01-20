//
//  ErrorEnums.swift
//  Calc
//
//  Created by adminaccount on 1/17/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import Foundation

enum ErrorType {
    case M_minus_error
    case M_plus_error
    case Trigonometry
    case NaN
    case Infinity
    case Sqrt
    case NegativeRoot
    case Factorial
    case NoEnter
    case NothingInMemory
    case Brackets
    case Error
    case Counter
}

struct MyError: Error {
    var type: ErrorType
    
    func description() -> String {
        switch self.type {
        case .Trigonometry:
            return "Problem with trigonometry"
        case .NaN:
            return "NaN"
        case .Infinity:
            return "Infinity(∞)"
        case .Sqrt:
            return "Error with √"
        case .NegativeRoot:
            return "Root can't take negative value"
        case .Factorial:
            return "Factorial can take Integer value and value >= 0 only"
        case .Brackets:
            return "Fail with brackets"
        default:
            return "Error"
        }
    }
}

struct AnotherError: Error {
    var type: ErrorType
    
    func description() -> String {
        switch self.type {
        case .M_minus_error:
            return "M- error"
        case .M_plus_error:
            return "M+ error"
        case .NoEnter:
            return "Write the number or press '='"
        case .NothingInMemory:
            return "Memory is empty"
        case .Counter:
            let tempCounter = CalculatorBrain.counter
            CalculatorBrain.counter = 0
            return "Infinity: \(tempCounter*(-1))÷0"
        default:
            return "Error"
        }
    }
}
