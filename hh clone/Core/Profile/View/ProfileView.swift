//
//  ProfileView.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.coordinator) private var coordinator: Coordinator
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        NavigationStack {
            Text("Profile")
                .toolbar {
                    ToolbarItem (placement: .topBarTrailing) {
                        Button {
                            UserDefaults.standard.removeObject(forKey: "email")
                            viewModel.clearLocalBase()
                        } label: {
                            Image(systemName: "line.3.horizontal")
                                .foregroundStyle(.white)
                        }
                    }
                }
        }
        .onAppear {
            coordinator.home()
            coordinator.selectedTab = 4
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView(viewModel: MainViewModel())
            .preferredColorScheme(.dark)
    }
}
