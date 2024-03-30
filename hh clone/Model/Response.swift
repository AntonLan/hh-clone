//
//  Responce.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation

struct Response: Codable {
    var offers: [Offer]
    var vacancies: [Vacancy]
}
