//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Pedro Henrique on 29/11/2017.
//  Copyright © 2017 IESB. All rights reserved.
//

import Foundation

struct CalculatorBrain {
    
    var result: Double? {
        get {
            return accumulator
        }
    }
    
    var accumulator: Double?
    
    private enum Operation {
        case constant(Double)
        case unary((Double) -> Double)
        case binary((Double, Double) -> Double)
        case equals
    }
    
    private var operations: Dictionary<String, Operation> = [
        "π": Operation.constant(Double.pi),
        "e": Operation.constant(M_E),
        "√": Operation.unary(sqrt),
        "±": Operation.unary({ -$0 }),
        "×": Operation.binary({ $0 * $1 }),
        "+": Operation.binary({ $0 + $1 }),
        "=": Operation.equals
    ]
    
    mutating func setOperand(_ operand: Double) {
        accumulator = operand
    }
    
    mutating func performOperation(_ mathematicalSymbol: String) {
        if let operation = operations[mathematicalSymbol] {
            switch operation {
            case .constant(let constant):
                accumulator = constant
            case .unary(let function):
                if accumulator != nil {
                    accumulator = function(accumulator!)
                }
            case .binary(let function):
                if accumulator != nil {
                    pbo = PendingBinaryOperation(firstOperand: accumulator!, function: function)
                }
            case .equals:
                performPendingBinaryOperation()
                
            }
        }
    }
    
    private mutating func performPendingBinaryOperation() {
        if accumulator != nil {
            accumulator = pbo?.perform(with: accumulator!)
        }
    }
    
    private struct PendingBinaryOperation {
        let firstOperand: Double
        let function: (Double, Double) -> Double
        
        func perform(with secondOperand: Double) -> Double {
            return function(firstOperand, secondOperand)
        }
    }
    
    private var pbo: PendingBinaryOperation?
    
    
    
    
    
    
    
    
    
}
