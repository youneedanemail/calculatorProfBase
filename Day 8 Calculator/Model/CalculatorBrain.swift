//
//  CalculatorBrain.swift
//  Day 8 Calculator
//
//  Created by Stephen Liddle on 10/1/24.
//

import Foundation

struct CalculatorBrain {
    // MARK: - Nested types

    private enum Operation {
        case binary((Double, Double) -> Double)
        case unary((Double) -> Double)
        case calculate
    }

    // MARK: - Constants

    // MARK: - Properties

    var accumulator: Double? = 0

    // MARK: - Helpers
}
