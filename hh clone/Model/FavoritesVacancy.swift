//
//  FavoritesVacancy.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import SwiftData

@Model 
class FavoritesVacancy {
    
    var id: String?
    var lookingNumber: Int?
    var title: String?
    var address: Address?
    var company: String?
    var experience: Experience?
    var publishedDate: String?
    var isFavorite: Bool
    var salary: Salary?
    var schedules: [String]?
    var appliedNumber: Int?
    var descript: String?
    var responsibilities: String?
    var questions: [String]?
    
    init(id: String? = nil, lookingNumber: Int? = nil, title: String? = nil, address: Address? = nil, company: String? = nil, experience: Experience? = nil, publishedDate: String? = nil, isFavorite: Bool, salary: Salary? = nil, schedules: [String]? = nil, appliedNumber: Int? = nil, description: String? = nil, responsibilities: String? = nil, questions: [String]? = nil) {
        self.id = id
        self.lookingNumber = lookingNumber
        self.title = title
        self.address = address
        self.company = company
        self.experience = experience
        self.publishedDate = publishedDate
        self.isFavorite = isFavorite
        self.salary = salary
        self.schedules = schedules
        self.appliedNumber = appliedNumber
        self.descript = description
        self.responsibilities = responsibilities
        self.questions = questions
    }
}
