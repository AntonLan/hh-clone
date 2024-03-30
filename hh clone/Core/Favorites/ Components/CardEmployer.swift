//
//  CardEmployer.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import SwiftUI

struct CardEmployer: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Поиск сотрудников")
                .font(.title3)
            Text("Размещение вакансий и доступ к базе резюме")
                .font(.subheadline)

            GreenButton(text: "Я ищу сотрудников")
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 141)
        .background(Color.formBackground)
        .cornerRadius(8)
    }
}

#Preview {
    CardEmployer()
}
