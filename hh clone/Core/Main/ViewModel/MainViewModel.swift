//
//  MainViewModel.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation
import Combine
import Factory

final class MainViewModel: ObservableObject {
    @Published var offers = [Offer]()
    @Published var vacancies = [Vacancy]()
    @Published var currentVacancy: FavoritesVacancy?
    @Published var dataBaseVacancies: [FavoritesVacancy] = []
    private let dataSource: ItemDataSource
    
    @Injected(\.vacancyService) private var vacancyService

    
    init(dataSource: ItemDataSource = ItemDataSource.shared) {
        self.dataSource = dataSource
        fetchFavoritesVacancies()
        if dataBaseVacancies.count == 0 {
            loadData()
        }
    }
    
    func appendToDB(_ vacancy: Vacancy) {
        let newVacancy = FavoritesVacancy(
            id: vacancy.id,
            lookingNumber: vacancy.lookingNumber,
            title: vacancy.title,
            address: vacancy.address,
            company: vacancy.company,
            experience: vacancy.experience,
            publishedDate: vacancy.publishedDate,
            isFavorite: vacancy.isFavorite,
            salary: vacancy.salary,
            schedules: vacancy.schedules,
            appliedNumber: vacancy.appliedNumber,
            description: vacancy.description,
            responsibilities: vacancy.responsibilities,
            questions: vacancy.questions
        )
        dataSource.appendVacancy(vacancy: newVacancy)
    }

    
    func loadData() {
        if let res = try? vacancyService.fetchData() {
            self.offers = res.offers
            self.vacancies = res.vacancies
        }
        vacancies.forEach { vac in appendToDB(vac) }
        fetchFavoritesVacancies()
    }
    
    func fetchFavoritesVacancies() {
        dataBaseVacancies = dataSource.fetchVacancies()
    }
    
    func clearLocalBase() {
        dataSource.removeAll()
    }
}
