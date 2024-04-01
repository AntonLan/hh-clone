//
//  StartView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 29.03.2024.
//

import SwiftUI

struct StartView: View {
    @Environment(\.coordinator) private var coordinator: Coordinator
    @ObservedObject var viewModel: FavoritesViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            VStack(alignment: .leading, spacing: 16) {
                Text("Поиск работы")
                    .font(.title3)
                
                CardContent(email: $viewModel.email, isValidEmail: $viewModel.isValidEmail)
                
                HStack() {
                    Button() {
                        viewModel.checkValidEmail()
                        if viewModel.isValidEmail {
                            coordinator.navigate(route: FavoritesRoute.authWithEmail)
                        }
                    } label: {
                        Text("Продолжить")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 167, height: 40)
                            .background(viewModel.email.isEmpty ? .darkBlue : .blue)
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.25), radius: 0, y: 4)
                            .overlay {
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.black, lineWidth: 1)
                            }
                    }
                    .disabled(viewModel.email.isEmpty)

                    Button {
                    } label: {
                        Spacer()
                        Text("Войти с паролем")
                    }
                }
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 179)
            .background(Color.formBackground)
            .cornerRadius(8)
            
            CardEmployer()
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Text("Вход в личный кабинет")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    StartView(viewModel: FavoritesViewModel())
}
