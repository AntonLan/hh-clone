//
//  GreenButton.swift
//  hh clone
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct GreenButton: View {
    var text: String
    
    var body: some View {
        Button {
        } label: {
            Text(text)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, minHeight: 32)
                .background(.green)
                .cornerRadius(50)
                .shadow(color: .black.opacity(0.25), radius: 0, y: 4)
            
        }
    }
}

#Preview {
    GreenButton(text: "Я ищу сотрудников")
}
