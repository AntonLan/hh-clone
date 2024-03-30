//
//  CardContent.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI

struct CardContent: View {
    @Binding var email: String
    @Binding var isValidEmail: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if email.isEmpty {
                    Image(systemName: "envelope")
                        .foregroundColor(.gray)
                }
                TextField("Электронная почта или телефон", text: $email)
                    .keyboardType(.emailAddress)
                    .textInputAutocapitalization(.none)
                    .autocorrectionDisabled(true)
                
                if !email.isEmpty {
                    Button {
                        email = ""
                        isValidEmail = true
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
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.red,
                            lineWidth: !isValidEmail && !email.isEmpty ? 1 : 0
                    )
            }
            
            if !isValidEmail && !email.isEmpty {
                Text("Некорректный ввод почты")
                    .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
