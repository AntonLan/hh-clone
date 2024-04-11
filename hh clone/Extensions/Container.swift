//
//  Container.swift
//  hh clone
//
//  Created by Anton Gerasimov on 11.04.2024.
//

import Factory


extension Container {
    var vacancyService: Factory<VacancyService> {
        Factory(self) { VacancyService() }
    }
}
