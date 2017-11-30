//
//  ViewController.swift
//  Calculator
//
//  Created by Pedro Henrique on 22/11/2017.
//  Copyright © 2017 IESB. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    
    var usuerIsInMiddleOfTyping = false
    
    private var brain = CalculatorBrain()
    
    private var displayValue: Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func touchDigit(_ sender: UIButton) {
        
        if let digit = sender.titleLabel?.text {
            
            let currentValue = display.text
            
            if usuerIsInMiddleOfTyping {
                display.text = currentValue! + digit
            }else {
                display.text = digit
                usuerIsInMiddleOfTyping = true
            }
            
        }
        
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
       brain.setOperand(displayValue)
        usuerIsInMiddleOfTyping = false
        if let symbol = sender.currentTitle {
            brain.performOperation(symbol)
            displayValue = brain.result!
        }
    }
    
    
}

