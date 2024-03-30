//
//  AuthViewModel.swift
//  hh clone
//
//  Created by Anton Gerasimov on 26.03.2024.
//

import Foundation
import Combine

final class AuthViewModel: ObservableObject {
    @Published var first: String = ""
    @Published var second: String = ""
    @Published var third: String = ""
    @Published var fourth: String = ""
    let textLimit = 1
    
    func accessСheck() -> Bool {
        var result = true
        if !first.isEmpty && !second.isEmpty && !third.isEmpty && !fourth.isEmpty {
            result = false
        }
        return result
    }
    
    func limitText(_ field: String) {
        switch field {
        case "first":
            if first.count > textLimit {
                first = String(first.prefix(textLimit))
            }
        case "second":
            if second.count > textLimit {
                second = String(second.prefix(textLimit))
            }
        case "third":
            if third.count > textLimit {
                third = String(third.prefix(textLimit))
            }
        case "fourth":
            if fourth.count > textLimit {
                fourth = String(fourth.prefix(textLimit))
            }
        default:
            return
        }
    }
}
