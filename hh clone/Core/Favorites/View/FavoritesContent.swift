//
//  FavoritesContent.swift
//  hh clone
//
//  Created by Anton Gerasimov on 29.03.2024.
//

import SwiftUI

struct FavoritesContent: View {
    @Environment(\.coordinator) private var coordinator: Coordinator
    @ObservedObject var viewModel: FavoritesViewModel

    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    if viewModel.checkCountVacancies() == 0 {
                        ContentUnavailableView (
                            "Добавьте вакансии в избранное", image: "heart"
                        )
                        .offset(y: 80)
                    } else {
                        Text("\(viewModel.checkCountVacancies()) вакансия")
                            .foregroundStyle(.gray)
                        
                        ForEach(viewModel.favoritesVacancies.filter { $0.isFavorite }, id: \.id) { vacancy in
                            
                            VStack(alignment: .leading, spacing: 16) {
                                HStack {
                                    if let number = vacancy.lookingNumber {
                                        Text("Сейчас просматривает \(number) \(UtilsFunction.shared.checkNumber(number))")
                                            .foregroundStyle(.green)
                                    }
                                    Spacer()
                                    Button {
                                        vacancy.isFavorite.toggle()
                                    } label: {
                                        Image(systemName: vacancy.isFavorite ? "heart.fill" : "heart")
                                    }
                                }
                                
                                Text(vacancy.title ?? "")
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                                
                                Text(vacancy.salary?.short ?? "")
                                    .font(.title3)
                                    .multilineTextAlignment(.leading)
                                
                                
                                VStack(alignment: .leading) {
                                    Text(vacancy.address?.town ?? "")
                                        .font(.subheadline)
                                    
                                    Text(vacancy.company ?? "")
                                        .font(.subheadline)
                                }
                                
                                HStack {
                                    Image(systemName: "gym.bag")
                                        .resizable()
                                        .frame(width: 16, height: 16)
                                    
                                    Text(vacancy.experience?.previewText ?? "")
                                }
                                
                                
                                Text("Опубликовано \(UtilsFunction.shared.checkDate(vacancy.publishedDate))")
                                    .font(.subheadline)
                                    .foregroundStyle(.gray)
                                
                                GreenButton(text: "Откликнуться")
                            }
                            .padding()
                            .frame(minHeight: 260)
                            .foregroundStyle(.white)
                            .background(Color.formBackground)
                            .cornerRadius(8)
                            .onTapGesture {
                                viewModel.currentVacancy = vacancy
                                coordinator.favoritesNavigate(route: .vacancy)
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle("Избранное")
    }
}

#Preview {
ContentView()
}
