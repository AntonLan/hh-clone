//
//  FilterButton.swift
//  hh clone
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct FilterButton: View {
    var body: some View {
        Button {
        } label: {
            RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
                .fill(.textfieldBackground)
                .frame(width: 40, height: 40)
                .overlay {
                    Image("filter")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
            
        }
    }
}

#Preview {
    FilterButton()
}
