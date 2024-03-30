//
//  FavoritesView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Environment(\.coordinator) private var coordinator: Coordinator
    @StateObject var viewModel = FavoritesViewModel()
    
    var body: some View {
        @Bindable var coordinator = coordinator
        NavigationStack(path: $coordinator.path){
            Group {
                if viewModel.getUserEmail() == nil {
                    StartView(viewModel: viewModel)
                        .environment(\.coordinator, coordinator)
                } else {
                    FavoritesContent(viewModel: viewModel)
                        .environment(\.coordinator, coordinator)
                }
            }
            .navigationDestination(for: FavoritesRoute.self) { routes in
                switch routes {
                case .authWithEmail:
                    AuthView(email: $viewModel.email)
                        .environment(\.coordinator, coordinator)
                case .authWithPassword:
                    AuthWithPasswordView()
                case .vacancy:
                    VacancyView(vacancy: $viewModel.currentVacancy)
                }
            }
        }
        .onAppear {
            coordinator.home()
            coordinator.selectedTab = 1
        }
    }
}

#Preview {
    ContentView()
        .environment(Coordinator())
}
