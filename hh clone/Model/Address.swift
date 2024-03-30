//
//  Address.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation

struct Address: Codable {
    var town: String?
    var street: String?
    var house: String?
    
    enum CodingKeys: CodingKey {
        case town
        case street
        case house
    }
}
