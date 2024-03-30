//
//  NavigationBackButton.swift
//  hh clone
//
//  Created by Anton Gerasimov on 30.03.2024.
//

import SwiftUI

struct NavigationBackButton: View {
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "chevron.left")
        }
        .foregroundStyle(.white)
    }
}
