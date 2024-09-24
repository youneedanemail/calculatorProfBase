//
//  CalculatorButton.swift
//  HW4 Calculator UI
//
//  Created by Stephen Liddle on 9/24/24.
//

import SwiftUI

struct CalculatorButton: View {
    let buttonSpec: ButtonSpec

    var body: some View {
        Button {
            // NEEDSWORK: do something with this button
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(buttonSpec.type.backgroundColor)
                Text(buttonSpec.label)
                    .font(.title)
                    .foregroundColor(buttonSpec.type.foregroundColor)
            }
        }

    }
}
