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
        display.text?.remove(at: (display.text?.index(before: (display.text?.endIndex)!))!)
    }
    func clearLastNumber(symbol: String) {
        var symb = symbol
        while symb != "" {
            display.text?.remove(at: (display.text?.index(before: (display.text?.endIndex)!))!)
            symb.remove(at: (symb.index(before: (symb.endIndex))))
        }
        
    }
    
    var isResult = false
    
    func setResult(symbol: String) {
        if Double(symbol) == Double(Int(Double(symbol)!)) {
            displayResult.text = String(Int(Double(symbol)!))
        } else {
            displayResult.text = symbol
        }
        isResult = true
    }
    
    
    @IBOutlet weak var display: UILabel!
    var viewController : ViewController? = nil
    
    @IBOutlet weak var displayResult: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "OutputControllerSegue" {
//            viewController = segue.source as? ViewController
//        }
//    }
    
}
