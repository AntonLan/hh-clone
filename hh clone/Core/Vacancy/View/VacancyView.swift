//
//  VacancyView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 29.03.2024.
//

import SwiftUI

struct VacancyView: View {
    @Binding var vacancy: FavoritesVacancy?
    @Environment(\.coordinator) private var coordinator: Coordinator
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Text(vacancy?.title ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Требуемый опыт: \(vacancy?.experience?.previewText ?? "")")
                        
                        
                        Text("\(vacancy?.schedules?.joined(separator: ", ") ?? "")")
                    }
                    
                    HStack(spacing: 8) {
                        if let appliedNumber = vacancy?.appliedNumber {
                            HeadVacancyCard(title: appliedNumber, icon: "personIcon", description: "уже откликнулся")
                        }
                        
                        if let lookingNumber = vacancy?.lookingNumber {
                            HeadVacancyCard(title: lookingNumber, icon: "eyeIcon", description: "сейчас смотря")
                        }
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 16) {
                        Text(vacancy?.company ?? "")
                            .font(.title3)
                        Image("map")
                        
                        Text("\(vacancy?.address?.town ?? ""), \(vacancy?.address?.street ?? ""), \(vacancy?.address?.house ?? "")")
                    }
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 141)
                    .background(Color.formBackground)
                    .cornerRadius(8)
                    
                    Text(vacancy?.descript ?? "")
                        .multilineTextAlignment(.leading)
                    
                    Text("Ваши задачи")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(vacancy?.responsibilities ?? "")
                        .multilineTextAlignment(.leading)
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Задайте вопрос работодателю")
                        
                        Text("Он получит его с откликом на вакансию")
                            .foregroundStyle(.gray)
                    }
                    
                    ForEach(vacancy?.questions ?? [], id: \.self) { quastion in
                        Text(quastion)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding()
                            .foregroundColor(.white)
                            .frame(minHeight: 32)
                            .background(Color.formBackground)
                            .cornerRadius(50)
                            .shadow(color: .black.opacity(0.25), radius: 0, y: 4)
                    }
                    
                }
            }
            
            Button {
            } label: {
                Text("Откликнуться")
                    .frame(maxWidth: .infinity, minHeight: 40)
                    .background(.green)
                    .foregroundStyle(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                NavigationBackButton {
                    coordinator.path.removeLast()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image(systemName: "eye")
                        .resizable()
                        .frame(width: 28, height: 24)
                        .foregroundStyle(.white)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    
                } label: {
                    Image("linkIcon")
                        .resizable()
                        .frame(width: 28, height: 24)
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    vacancy?.isFavorite.toggle()
                } label: {
                    Image(systemName: vacancy?.isFavorite ?? false ? "heart.fill" : "heart")
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundStyle(.white)
                }
                
            }
        }
        
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
        .preferredColorScheme(.dark)
}
