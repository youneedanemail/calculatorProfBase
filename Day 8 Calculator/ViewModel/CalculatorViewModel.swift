//
//  CalculatorViewModel.swift
//  Day 8 Calculator
//
//  Created by Stephen Liddle on 9/26/24.
//

import Foundation

@Observable class CalculatorViewModel {

    // MARK: - Constants
    
    private struct Constants {
        static let decimal = OperationSymbol.decimal.rawValue
        static let defaultDisplayText = OperationSymbol.zero.rawValue
        static let errorDisplay = "Error"
    }
    // MARK: - Properties

    var preferences = Preferences()
    
    private var calculatorModel = CalculatorBrain()
    private var soundPlayer = SoundPlayer()
    private var textBeingEdited: String? = Constants.defaultDisplayText

    // MARK: - Model access
    
    var displayText: String {
        if let text = textBeingEdited {
            text
        } else if let value = calculatorModel.accumulator {
            "\(value)"
        } else if let value = calculatorModel.pendingLeftOperand {
            "\(value)"
        } else {
            Constants.errorDisplay
        }
    }
    // "\(value)" displays as a string the same as string(value). this is called STRING INTERPULATION
    
    
    // MARK: - User intents

    func handleButtonTap(for buttonSpec: ButtonSpec) {
        if preferences.soundIsEnabled {
            Task {
                await soundPlayer.playSound(named: "Click.m4a")
            }
        }
        
        switch buttonSpec.type {
            case .compute:
                handleOperationTap(symbol: buttonSpec.symbol)
            case .utility:
                if buttonSpec.symbol == .clear {
                    handleClearTap()
                } else {
                    handleOperationTap(symbol: buttonSpec.symbol)
                }
            case .number, .doubleWide:
                handleNumericTap(digit: buttonSpec.symbol.rawValue)
        }
    }

    // MARK: - Helpers

    private func handleClearTap() {
        
    }
    
    private func handleNumericTap(digit: String) {
        if let text = textBeingEdited {
            if digit == Constants.decimal && text.contains(digit){
                // Ignore extra tap on decimal button
                return
            }
            
            if digit != Constants.decimal && text == Constants.defaultDisplayText {
                textBeingEdited = digit
            } else {
                textBeingEdited = text + digit
            }
        } else {
            textBeingEdited = digit
        }
        
        if let updatedText = textBeingEdited {
            calculatorModel.setAccumulator(Double(updatedText))
        }
    }
    
    private func handleOperationTap(symbol: OperationSymbol) {
        if calculatorModel.accumulator != nil {
            calculatorModel.performOperation(symbol)
            textBeingEdited = nil
        }
    }
}

// async (in soundPlayer) task and await allows you to run things in the background and not slow your program down so that sound will run in a different thread
