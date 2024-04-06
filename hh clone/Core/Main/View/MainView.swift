//
//  MainView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    @Environment(\.coordinator) private var coordinator: Coordinator
    
    var body: some View {
        @Bindable var coordinator = coordinator
        NavigationStack(path: $coordinator.path) {
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading, spacing: 16) {
                    Head()
                    
                    Text("Вакансии для вас")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    VStack {
                        ForEach(0..<3) { index in
                            CardVacancy(vacancy: $viewModel.dataBaseVacancies[index])
                                .onTapGesture {
                                    viewModel.currentVacancy = viewModel.dataBaseVacancies[index]
                                    coordinator.navigate(route: MainRoute.vacancy)
                                }
                        }
                        
                        Button {
                        } label: {
                            Text("Еще \(viewModel.dataBaseVacancies.count - 3) вакансии")
                                .frame(maxWidth: .infinity, minHeight: 40)
                                .background(.blue)
                                .foregroundStyle(.white)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .navigationDestination(for: MainRoute.self) { routes in
                switch routes {
                case .vacancy:
                    VacancyView(vacancy: $viewModel.currentVacancy)
                        .environment(\.coordinator, coordinator)
                }
            }
            .onAppear {
                coordinator.home()
                coordinator.selectedTab = 0
            }
        }
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
        .preferredColorScheme(.dark)
}
