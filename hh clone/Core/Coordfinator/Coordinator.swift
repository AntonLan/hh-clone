//
//  Coordinator.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import Foundation
import SwiftUI
import Observation


enum FavoritesRoute: Hashable {
    case authWithEmail
    case authWithPassword
    case vacancy
}

enum MainRoute: Hashable {
    case vacancy
}

@Observable
final public class Coordinator {
    var path: NavigationPath = NavigationPath()
    var selectedTab = 1

    
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

