//
//  VacancyService.swift
//  hh clone
//
//  Created by Anton Gerasimov on 27.03.2024.
//

import Foundation

enum JsonError: Error {
    case invalidFile
}

final class VacancyService {
    
    func fetchData() throws -> Response {
        guard let url = Bundle.main.url(forResource: "offers", withExtension: "json") else {
            print("Json file not found")
            throw JsonError.invalidFile
        }
        let data = try? Data(contentsOf: url)
        return try! JSONDecoder().decode(Response.self, from: data!)
    }
}
