//
//  ViewControllerFunctions.swift
//  Calc
//
//  Created by adminaccount on 1/17/17.
//  Copyright © 2017 adminaccount. All rights reserved.
//

import Foundation

var outputController: OutputController? = nil
var inputController: InputController? = nil
var brain = CalculatorBrain()
var dot: Double = 1
var isEqual = false
var invert = false
var prevSymbol: String = ""

func isOperand(symbol: String) -> Bool {
    if symbol == "√" || symbol == "sin" || symbol == "cos" || symbol == "tg" || symbol == "ctg" || symbol == "ln" || symbol == "log" || symbol == "sinh" || symbol == "cosh" || symbol == "tgh" || symbol == "ctgh" || symbol == "!" {
        return true
    }
    return false
}

func isOperandAction(symbol: String) -> Bool {
    if symbol == "+" || symbol == "-" || symbol == "✕" || symbol == "÷" || symbol == "^" || symbol == "ln" {
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
