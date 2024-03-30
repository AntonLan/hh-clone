//
//  Offer.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation

struct ButtonText: Codable {
    var text: String
    
    enum CodingKeys: CodingKey {
        case text
    }
}

struct Offer: Codable, Identifiable {
    var id: String?
    var title: String
    var button: ButtonText?
    var link: String
    
    enum CodingKeys: CodingKey {
        case id
        case title
        case link
    }
}
