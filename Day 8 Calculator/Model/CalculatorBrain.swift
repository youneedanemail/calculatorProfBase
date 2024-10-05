//
//  CalculatorBrain.swift
//  Day 8 Calculator
//
//  Created by Stephen Liddle on 10/1/24.
//
// Calculator engine

import Foundation

// var op: CalculatorBrain.Operation = .calculate // have to declare calculatorBrain if not done within the struct below

// typealis example
typealias BinaryOperation = (Double, Double) -> Double
typealias UnaryOperation = (Double) -> Double

struct CalculatorBrain {
    // MARK: - Nested types // why nested type- it has been declared within Model calculator brain

    private enum Operation {
        case binary(BinaryOperation)
        case unary(UnaryOperation)
        case calculate
    }
    
    private struct PendingBinaryOperation {
        let calculate: BinaryOperation
        let leftOperand: Double
        let symbol: OperationSymbol
        
        // perform operation
        func perform(with rightOperand: Double) -> Double {
            calculate(leftOperand, rightOperand)
        }
    }

    // MARK: - Constants
    
    private let operations: [OperationSymbol: Operation] = [  // I can use OperationSymbol as a key in the dictionary because it is hashable.  Dictionaries have to have hashable info
        
        // inline anonymus function same as .binary({ (leftOperand: Double, rightOperand: Double) in return leftOperand / rightOperand     may not be exact
        
        // .binary refers to the binary case in enum Operations
        
        .divide:        .binary({ $0 / $1 }),   // first variable / second variable  refers to variables by position
        .add:           .binary({ $0 + $1 }),
        .multiply:      .binary({ $0 * $1 }),
        .subtract:      .binary({ $0 - $1 }),
        .changeSign:    .unary({ -$0 }),
        .percent:       .unary({ $0 / 100 }),
        .calculate:     .calculate
        
        // because of type infernce it is the same as OperationSymbol.calculate: .
    ]

    // MARK: - Properties

    var accumulator: Double? = 0
    private var pendingOperation: PendingBinaryOperation?  // optional because when you start the calculator, you don't have one
    
    mutating func clearAccumulator() {
        accumulator = nil
    }
    
    mutating func clearAll() {
        pendingOperation = nil
        clearAccumulator()
    }
    
    mutating func performOperation(_ symbol: OperationSymbol) {
        guard let operation = operations[symbol] else {
        // Ignore attempt to perform unknown operation
        return
        }
    
        switch operation {
            case .binary(let function):
                performPendingOperation()
                
                if let accumulator {
                    pendingOperation = PendingBinaryOperation(
                        calculate: function,
                        leftOperand: accumulator,
                        symbol: symbol
                    )
                    clearAccumulator()
                }
            case .unary(let function):
                if let accumulator {
                self.accumulator = function(accumulator)
            }
            case .calculate:
            performPendingOperation()
        }
        
    }
    
    mutating func setAccumulator(_ value: Double?) {
        accumulator = value
    }

    // MARK: - Private Helpers

    mutating func performPendingOperation() {
        if let pendingOperation, let accumulator {  // same as  =
            self.accumulator = pendingOperation.perform(with: accumulator)
            self.pendingOperation = nil
        }
    }
}

