//
//  SecureTextFieldModifiers.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI

struct SecureTextFieldModifiers: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .keyboardType(.numberPad)
            .frame(width: 8, height: 48)
            .padding(.horizontal, 20)
            .background(.textfieldBackground)
            .cornerRadius(8)
    }
}
