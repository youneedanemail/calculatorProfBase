//
//  CalculatorView.swift
//  HW4 Calculator UI
//
//  Created by Stephen Liddle on 9/24/24.
//

import SwiftUI

enum CalculatorButtonType {
    case utility
    case compute
    case number
    case doublewide

    var backgroundColor: Color {
        switch self {
            case .utility:
                .utilityBackground
            case .compute:
                .computeBackground
            case .number, .doublewide:
                .numberBackground
        }
    }

    var foregroundColor: Color {
        self == .utility ? .black : .white
    }
}

typealias ButtonSpec = (label: String, type: CalculatorButtonType)

let buttonSpecs: [ButtonSpec] = [
    ("AC", .utility),   ("±", .utility), ("%", .utility), ("×", .compute),
    ("7", .number),     ("8", .number),  ("9", .number),  ("÷", .compute),
    ("4", .number),     ("5", .number),  ("6", .number),  ("-", .compute),
    ("1", .number),     ("2", .number),  ("3", .number),  ("+", .compute),
    ("0", .doublewide), ("", .number),   (".", .number),  ("=", .compute)
]

let gridItems = Array<GridItem>(repeating: .init(.fixed(50)), count: 4)

struct CalculatorView: View {
    var body: some View {
        VStack {
            Text("1,000")
            LazyVGrid(columns: gridItems) {
                ForEach(buttonSpecs, id: \.label) { buttonSpec in
                    if buttonSpec.label == "" {
                        Text("")
                    } else {
                        CalculatorButton(buttonSpec: buttonSpec)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    CalculatorView()
}
