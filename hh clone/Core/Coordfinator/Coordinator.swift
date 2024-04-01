//
//  Coordinator.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import Foundation
import SwiftUI
import Observation

protocol Route: Hashable {}

enum FavoritesRoute: Route {
    case authWithEmail
    case authWithPassword
    case vacancy
}

enum MainRoute: Route {
    case vacancy
}

@Observable
final public class Coordinator {
    var path: NavigationPath = NavigationPath()
    var selectedTab = 1

    func navigate(route: some Route) {
        path.append(route)
    }
    
    func favoritesNavigate(route: FavoritesRoute) {
        path.append(route)
    }
    
    func mainNavigate(route: MainRoute) {
        path.append(route)
    }
    
    func home()  {
        path = NavigationPath()
    }
}

struct CoordinatorKey: EnvironmentKey {
    static var defaultValue: Coordinator = Coordinator()
}

extension EnvironmentValues {
    var coordinator: Coordinator {
        get { self[CoordinatorKey.self] }
        set { self[CoordinatorKey.self] = newValue }
    }
}

