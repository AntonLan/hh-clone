//
//  Vacancy.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation


struct Vacancy: Codable, Equatable {
    static func == (lhs: Vacancy, rhs: Vacancy) -> Bool {
        lhs.isFavorite == rhs.isFavorite
    }
    
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
    var description: String?
    var responsibilities: String?
    var questions: [String]?
    
    enum CodingKeys: CodingKey {
        case id
        case lookingNumber
        case title
        case address
        case company
        case experience
        case publishedDate
        case isFavorite
        case salary
        case schedules
        case appliedNumber
        case description
        case responsibilities
        case questions
    }
}
