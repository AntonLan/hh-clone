//
//  SearchTextField.swift
//  hh clone
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct SearchTextField: View {
    @State private var text = ""
    
    var body: some View {
        HStack {
            if text.isEmpty {
                Image(systemName: "arrow.left")
                    .foregroundColor(.white)
            }
            TextField("Должность по подходящим вакансиям", text: $text)
            
            if !text.isEmpty {
                Button {
                    text = ""
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding(.horizontal)
        .foregroundColor(.white)
        .frame(maxWidth: .infinity, minHeight: 40)
        .background(.textfieldBackground)
        .cornerRadius(8)
        .shadow(color: .black.opacity(0.25), radius: 0, y: 4)
    }
}

#Preview {
    SearchTextField()
}
