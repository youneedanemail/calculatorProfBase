//
//  Day_6_HW4_CalculatorApp.swift
//  Day 6 HW4 Calculator
//
//  Created by Stephen Liddle on 9/24/24.
//

import SwiftUI

@main
struct Day_6_HW4_CalculatorApp: App {
    var body: some Scene {
        WindowGroup {
            CalculatorView(calculatorViewModel: CalculatorViewModel())
        }
    }
}
