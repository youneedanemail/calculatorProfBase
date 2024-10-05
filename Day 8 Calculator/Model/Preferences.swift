//
//  Preferences.swift
//  Day 8 Calculator
//
//  Created by Kimberly Noall Hunter on 10/3/24.
//

import Foundation

struct Preferences {
    var soundIsEnabled = UserDefaults.standard.bool(forKey: Key.soundEnabled) {
        didSet {
            UserDefaults.standard.set(soundIsEnabled, forKey: Key.soundEnabled)
        }
    }
    
    private struct Key {
        static let soundEnabled = "EnabledSound"
    }
}
