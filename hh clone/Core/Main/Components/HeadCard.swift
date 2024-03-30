//
//  HeadCard.swift
//  hh clone
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct HeadCard: View {
    var icon: String
    var tittle: String
    var textButton: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Image(icon)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.horizontal, 8)
            Text(tittle)
                .font(.system(size: 14))
                .fontWeight(.semibold)
                .foregroundStyle(.white)
                .padding(.horizontal, 2)
                .multilineTextAlignment(.leading)
                .frame(width: 134)
            
                Button {
                } label: {
                    Text(textButton)
                        .font(.system(size: 14))
                        .foregroundStyle(.green)
                        .padding(.horizontal, 8)
                        .padding(.top, 1)
                }
            
        }
        .padding(8)
        .frame(width: 132, height: 120)
        .background(Color.formBackground)
        .cornerRadius(8)
    }
}

#Preview {
    HeadCard(icon: "location", tittle: "Вакансии рядом с вами", textButton: "Поднять")
}
