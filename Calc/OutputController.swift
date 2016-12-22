//
//  Output Controller.swift
//  Calc
//
//  Created by adminaccount on 12/12/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

protocol OutputProtocol {
    func Output()
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
