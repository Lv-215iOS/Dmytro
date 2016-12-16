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
    
    func appendSymbol(symbol: String) {
        if display.text != nil {
            display.text = display.text! + symbol
        } else {
            display.text = symbol
        }
    }
    
    func clearScreen() {
        display.text = ""
    }
    
    func clearLastSymbol() {
        display.text?.remove(at: (display.text?.index(before: (display.text?.endIndex)!))!)
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
