//
//  Experience.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation

struct Experience: Codable {
    var previewText: String?
    var text: String?
    
    enum CodingKeys: CodingKey {
        case previewText
        case text
    }
}
