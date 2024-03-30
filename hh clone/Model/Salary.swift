//
//  Salary.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation

struct Salary: Codable {
    var short: String?
    var full: String?
    
    enum CodingKeys: CodingKey {
        case short
        case full
    }
}
