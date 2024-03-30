//
//  UtilsFunction.swift
//  hh clone
//
//  Created by Anton Gerasimov on 29.03.2024.
//

import Foundation

final class UtilsFunction {
    
    
    static var shared = UtilsFunction()
    
    func checkNumber(_ number: Int) -> String {
        switch number {
        case 2...4:
            return "человека"
        default:
            return "человек"
        }
    }
    
    func checkDate(_ date: String?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let date else { return "" }
        guard let dateString = formatter.date(from: date) else { return "" }
        formatter.dateFormat = "MM"
        let month = formatter.string(from: dateString)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: dateString)
        return "\(day) \(checkMonth(month))"
    }
    
    func checkMonth(_ month: String) -> String {
        switch month {
        case "1":
            return "января"
        case "2":
            return "февраля"
        case "3":
            return "марта"
        case "4":
            return "апреля"
        case "5":
            return "мая"
        case "6":
            return "июня"
        case "7":
            return "июля"
        case "8":
            return "августа"
        case "9":
            return "сентября"
        case "10":
            return "октября"
        case "11":
            return "ноября"
        default:
            return "декабря"
        }
    }
}
