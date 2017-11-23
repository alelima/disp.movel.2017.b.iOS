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
    
    var accumulator: Double?
    var operand: Double?
    
    @IBAction func performOperation(_ sender: UIButton) {
        usuerIsInMiddleOfTyping = false
        if let symbol = sender.titleLabel?.text {
            switch symbol {
            case "π": displayValue = Double.pi
            case "+": performBinaryOperation(withMathematicalSymbol: symbol)
            default: break
                
            }
        }
    }
    
    private func performBinaryOperation(withMathematicalSymbol symbol: String) {
        if accumulator != nil {
            switch symbol {
            case "+": displayValue = accumulator! + displayValue
            default: break
            }
            
        }else {
            accumulator = displayValue
            displayValue = 0
        }
    }
    
}

