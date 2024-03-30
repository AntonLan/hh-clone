//
//  HeadVacancyCard.swift
//  hh clone
//
//  Created by Anton Gerasimov on 29.03.2024.
//

import SwiftUI

struct HeadVacancyCard: View {
    
    var title: Int
    var icon: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(title) \(UtilsFunction.shared.checkNumber(title))")
                    .fontWeight(.semibold)
                Spacer()
                Image(icon)
                    .resizable()
                    .frame(width: 16, height: 16)
            }
            
            Text(description)
        }
        .padding(6)
        .frame(width: 176, height: 50)
        .background(.darkGreen)
        .cornerRadius(8)
    }
}

#Preview {
    HeadVacancyCard(title: 2, icon: "heart", description: "уже откликнулся")
}
