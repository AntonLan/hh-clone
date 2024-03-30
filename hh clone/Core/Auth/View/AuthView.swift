//
//  AuthView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI
import Combine

enum FocusText {
    case first, second, third, fourth
}

struct AuthView: View {
    @Binding var email: String
    @FocusState var focusField: FocusText?
    @ObservedObject var viewModel = AuthViewModel()
    @Environment(\.coordinator) private var coordinator: Coordinator
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Отправили код на \(email)")
                .font(.title)
            
            Text("Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет")
                .font(.title3)
            
            HStack {
                SecureField("*", text: $viewModel.first)
                    .focused($focusField, equals: .first)
                    .submitLabel(.next)
                    .onReceive(Just(viewModel.first)) { _ in
                        viewModel.limitText("first") }
                    .onChange(of: viewModel.first) {
                        focusField = .second
                    }
                    .modifier(SecureTextFieldModifiers())
                
                SecureField("*", text: $viewModel.second)
                    .focused($focusField, equals: .second)
                    .submitLabel(.next)
                    .onReceive(Just(viewModel.second)) { _ in
                        viewModel.limitText("second") }
                    .onChange(of: viewModel.second) {
                        focusField = .third
                    }
                    .modifier(SecureTextFieldModifiers())
                
                SecureField("*", text: $viewModel.third)
                    .focused($focusField, equals: .third)
                    .submitLabel(.next)
                    .onReceive(Just(viewModel.third)) { _ in viewModel.limitText("third") }
                    .onChange(of: viewModel.third) {
                        focusField = .fourth
                    }
                    .modifier(SecureTextFieldModifiers())
                
                SecureField("*", text: $viewModel.fourth)
                    .focused($focusField, equals: .fourth)
                    .submitLabel(.next)
                    .onReceive(Just(viewModel.fourth)) { _ in viewModel.limitText("fourth") }
                    .modifier(SecureTextFieldModifiers())
            }
            
            
            
            Button {
                coordinator.home()
                coordinator.selectedTab = 0
                UserDefaults.standard.setValue(email, forKey: "email")
                email = ""
            } label: {
                Text("Продолжить")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(viewModel.accessСheck() ? .darkBlue : .blue)
                    .cornerRadius(8)
                    .shadow(color: .black.opacity(0.25), radius: 0, y: 4)
                    .overlay {
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(.black, lineWidth: 1)
                    }
            }
            .disabled(viewModel.accessСheck())
        }
        .padding()
        .onAppear {
            focusField = .first
        }
    }
}

#Preview {
    AuthView(email: .constant("example@mail.com"))
        .environment(Coordinator())
        .preferredColorScheme(.dark)
}
