//
//  FavoritesViewModel.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import Foundation
import Combine
import SwiftData

final class FavoritesViewModel: ObservableObject {
    @Published var email = ""
    @Published var isValidEmail = true
    @Published var currentVacancy: FavoritesVacancy?
    @Published var favoritesVacancies: [FavoritesVacancy] = []
    private let dataSource: ItemDataSource

    
    init(dataSource: ItemDataSource = ItemDataSource.shared) {
        self.dataSource = dataSource
        fetchFavoritesVacancies()
    }
    
    func getUserEmail() -> String? {
        let email = UserDefaults.standard.string(forKey: "email")
        return email
    }
    
    func fetchFavoritesVacancies() {
        favoritesVacancies = dataSource.fetchVacancies()
    }
    
    func checkValidEmail() {
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        isValidEmail = emailPredicate.evaluate(with: email)
    }
    
    func checkCountVacancies() -> Int {
        return favoritesVacancies.filter { $0.isFavorite }.count
    }
}
