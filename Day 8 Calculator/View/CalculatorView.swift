//
//  CalculatorView.swift
//  HW4 Calculator UI
//
//  Created by Stephen Liddle on 9/24/24.
//

import SwiftUI

typealias ButtonSpec = (label: String, type: CalculatorButtonType)

let buttonSpecs: [ButtonSpec] = [
    ("AC", .utility),   ("±", .utility), ("%", .utility), ("×", .compute),
    ("7", .number),     ("8", .number),  ("9", .number),  ("÷", .compute),
    ("4", .number),     ("5", .number),  ("6", .number),  ("-", .compute),
    ("1", .number),     ("2", .number),  ("3", .number),  ("+", .compute),
    ("0", .doublewide), ("", .number),   (".", .number),  ("=", .compute)
]

let columnCount = 4
let gridItems = Array<GridItem>(repeating: .init(.flexible()), count: columnCount)

struct CalculatorView: View {

    private struct Constants {
        static let displayFontSize = 90.0
    }

    var calculatorViewModel: CalculatorViewModel

    @State private var playSound: Bool = false

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Rectangle()
                    .fill(.black)
                    .ignoresSafeArea(.all)
                VStack(alignment: .trailing, spacing: DrawingConstants.buttonSpacing) {
                    Toggle("Play sound", isOn: $playSound)
                        .foregroundStyle(.white)
                    Spacer()
                    Text("1,000")
                        .font(.system(size: Constants.displayFontSize, weight: .thin))
                        .foregroundStyle(.white)
                        .padding(.trailing, DrawingConstants.buttonSpacing)
                    LazyVGrid(columns: gridItems, alignment: .leading, spacing: DrawingConstants.buttonSpacing) {
                        ForEach(buttonSpecs, id: \.label) { buttonSpec in
                            if buttonSpec.label.isEmpty {
                                Text("")
                            } else {
                                CalculatorButton(
                                    buttonSpec: buttonSpec,
                                    playSound: playSound,
                                    size: geometry.size,
                                    calculatorViewModel: calculatorViewModel
                                )
                            }
                        }
                    }
                }
                .padding()
            }
        }
    }
}

//#Preview {
//    CalculatorView()
//}
