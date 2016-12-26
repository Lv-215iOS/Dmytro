//
//  Output Controller.swift
//  Calc
//
//  Created by adminaccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol OutputProtocol {
    func setWarning(name: String)
    func appendSymbol(symbol: String)
    func clearScreen()
    func clearLastSymbol()
    func clearLastNumber(symbol: String)
    func setResult(symbol: String)
}

class OutputController: UIViewController{
    @IBOutlet weak var labelError: UILabel!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var displayResult: UILabel!
    var viewController : ViewController? = nil
    var isResult = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setWarning(name: String) {
        labelError.text = name
    }
    
    func appendSymbol(symbol: String) {
        if display.text != nil {
            display.text = display.text! + symbol
        } else {
            display.text = symbol
        }
    }
    
    func clearScreen() {
        display.text = ""
        displayResult.text = "0"
    }
    
    func clearLastSymbol() {
        if display.text != "" {
            display.text?.remove(at: (display.text?.index(before: (display.text?.endIndex)!))!)
        }
        
    }
    
    func getLastSymbol() -> Character {
        if display.text?.characters.last == nil {
            return "1"
        }
        return (display.text?.characters.last)!
    }
    
    func getNLastSymbol(n: Int) -> String {
        if display.text?.characters.last == nil || CalculatorBrain.counter < 0{
            return "1"
        } else if (display.text?.characters.count)! >= n {
            return (display.text?.substring(from: (display.text?.index((display.text?.endIndex)!, offsetBy: n*(-1)))!))!
        }
        return "0"
    }
    
    func clearLastNumber(symbol: String) {
        var symb = symbol
        while symb != "" {
            display.text?.remove(at: (display.text?.index(before: (display.text?.endIndex)!))!)
            symb.remove(at: (symb.index(before: (symb.endIndex))))
        }
    }
    
    func setResult(symbol: String) {
        if Double(symbol) == Double(Int(Double(symbol)!)) {
            displayResult.text = String(Int(Double(symbol)!))
        } else {
            displayResult.text = symbol
        }
        isResult = true
    }
}
