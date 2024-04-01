//
//  TabMenuView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI
import SwiftData


struct TabMenuView: View {
    @State var coordinator = Coordinator()
    @StateObject var viewModel = MainViewModel()

    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            MainView(viewModel: viewModel)
                .environment(\.coordinator, coordinator)
                .tabItem {
                    TabItem(icon: "magnifyingglass", title: "Поиск")
                }
                .onAppear {
                    coordinator.selectedTab = 0
                }
                .tag(0)
            
            FavoritesView()
                .environment(\.coordinator, coordinator)
                .tabItem {
                    TabItem(icon: "heart", title: "Избранное")
                }
                .badge(viewModel.dataBaseVacancies.filter { $0.isFavorite }.count)
                .onAppear {
                    coordinator.selectedTab = 1
                }
                .tag(1)
            
            ResponsesView()
                .tabItem {
                    TabItem(icon: "envelope", title: "Отклики")
                }
                .onAppear {
                    coordinator.selectedTab = 2
                }
                .tag(2)
            
            MessagesView()
                .tabItem {
                    TabItem(icon: "message", title: "Сообщения")
                }
                .onAppear {
                    coordinator.selectedTab = 3
                }
                .tag(3)
            
            ProfileView(viewModel: viewModel)
                .environment(\.coordinator, coordinator)
                .tabItem {
                    TabItem(icon: "person", title: "Профиль")
                }
                .onAppear {
                    coordinator.selectedTab = 4
                }
                .tag(4)
        }
        .tint(.blue)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TabMenuView()
}
