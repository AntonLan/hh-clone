//
//  ItemDataSource.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation
import SwiftData

final class ItemDataSource {
    private let modelContainer: ModelContainer
    private let modelContext: ModelContext

    @MainActor
    static let shared = ItemDataSource()

    @MainActor
    private init() {
        self.modelContainer = try! ModelContainer(for: FavoritesVacancy.self)
        self.modelContext = modelContainer.mainContext
    }

    func appendVacancy(vacancy: FavoritesVacancy) {
        modelContext.insert(vacancy)
        do {
            try modelContext.save()
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func fetchVacancies() -> [FavoritesVacancy] {
        do {
            return try modelContext.fetch(FetchDescriptor<FavoritesVacancy>())
        } catch {
            fatalError(error.localizedDescription)
        }
    }

    func removeItem(_ vacancy: FavoritesVacancy) {
        modelContext.delete(vacancy)
    }
    
    func removeAll() {
        do {
            try modelContext.delete(model: FavoritesVacancy.self)
        } catch {
            print(error.localizedDescription)
        }
    }
}
