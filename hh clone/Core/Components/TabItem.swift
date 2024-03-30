//
//  TabItem.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI

struct TabItem: View {
    var icon: String
    var title: String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .environment(\.symbolVariants, .none)
            Text(title)
                .font(.title)
        }
    }
}

#Preview {
    TabItem(icon: "magnifyingglass", title: "Поиск")
}
