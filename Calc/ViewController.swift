//
//  ViewController.swift
//  Calc
//
//  Created by adminaccount on 12/7/16.
//  Copyright © 2016 adminaccount. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var outputController: OutputController? = nil
    var inputController: InputController? = nil
    
//    @IBOutlet private weak var display: UILabel!
    
    public var displayValue: Double {
        get {
            return Double((self.outputController?.display.text)!)!
//            return Double(display.text!)!
        }
        set {
//            let z: = newValue - Int(newValue)
            if round(newValue) == newValue {
                self.outputController?.display.text = String(Int(newValue))
//                display.text = String(Int(newValue))
            } else {
                self.outputController?.display.text = String(newValue)
//               display.text = String(newValue)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OutputControllerSegue" {
            outputController = segue.destination as? OutputController
            outputController?.viewController = self
        } else if segue.identifier == "InputControllerSegue" {
            inputController = segue.destination as? InputController
            inputController?.viewController = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

