//
//  CalculatorBrain.swift
//  Day 6 HW4 Calculator
//
//  Created by Stephen Liddle on 9/26/24.
//

import Foundation

@Observable class CalculatorBrain {

    // MARK: - Properties

    var soundPlayer = SoundPlayer()

    // MARK: - Model access

    // MARK: - User intents

    func clickButton() {
//        let path = Bundle.main.path(forResource: "Click", ofType: "m4a")
//
//        if let path {
//            let url = URL(fileURLWithPath: path)
//        }
        soundPlayer.playSound(named: "Click.m4a")
    }

    // MARK: - Helpers

}
