//
//  Head.swift
//  hh clone
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct Head: View {
    var body: some View {
        HStack {
            SearchTextField()
            FilterButton()
        }
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HeadCard(icon: "location", tittle:
                            "Вакансии рядом с вами", textButton: "")
                
                HeadCard(icon: "searchIcon", tittle: "Поднять резюме в поиске", textButton: "Поднять")
                
                HeadCard(icon: "timeJobIcon", tittle: "Временная работа и подработка",
                         textButton: "")
            }
        }
    }
}

#Preview {
    Head()
}
