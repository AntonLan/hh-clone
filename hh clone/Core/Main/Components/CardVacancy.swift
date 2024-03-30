//
//  CardVacancy.swift
//  hh clone
//
//  Created by Anton Gerasimov on 28.03.2024.
//

import SwiftUI

struct CardVacancy: View {
    
    @Binding var vacancy: FavoritesVacancy
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                if let number = vacancy.lookingNumber {
                    Text("Сейчас просматривает \(number) \(UtilsFunction.shared.checkNumber(number))")
                        .foregroundStyle(.green)
                }
                Spacer()
                Button {
                    vacancy.isFavorite.toggle()
                } label: {
                    Image(systemName: vacancy.isFavorite ? "heart.fill" : "heart")
                }
            }
            
            Text(vacancy.title ?? "")
                .font(.title3)
                .multilineTextAlignment(.leading)
            
            Text(vacancy.salary?.short ?? "")
                .font(.title3)
                .multilineTextAlignment(.leading)
            
            
            VStack(alignment: .leading) {
                Text(vacancy.address?.town ?? "")
                    .font(.subheadline)
                    
                Text(vacancy.company ?? "")
                    .font(.subheadline)
            }
            
            HStack {
                Image(systemName: "gym.bag")
                    .resizable()
                    .frame(width: 16, height: 16)
                    
                Text(vacancy.experience?.previewText ?? "")
            }
                
            Text("Опубликовано \(UtilsFunction.shared.checkDate(vacancy.publishedDate))")
                .font(.subheadline)
                .foregroundStyle(.gray)
            

            GreenButton(text: "Откликнуться")
        }
        .padding()
        .frame(minHeight: 260)
        .foregroundStyle(.white)
        .background(Color.formBackground)
        .cornerRadius(8)
    }
}

#Preview {
    MainView(viewModel: MainViewModel())
        .preferredColorScheme(.dark)
}
