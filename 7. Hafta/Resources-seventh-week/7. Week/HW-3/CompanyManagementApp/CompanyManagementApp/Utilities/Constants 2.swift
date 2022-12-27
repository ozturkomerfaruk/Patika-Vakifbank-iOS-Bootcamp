//
//  Constants.swift
//  CompanyManagementApp
//
//   
//

import Foundation


// Çalışan title'ları enum'ı
enum EmployeeType: Double, CaseIterable{
    case junior     = 1
    case midLevel   = 1.5
    case senior     = 2
    case lead       = 2.5
    case manager    = 3
    
    init(caseString: String) {
        switch caseString {
        case "junior" :
            self = .junior
        case "lead" :
            self = .lead
        case "manager" :
            self = .manager
        case "midLevel" :
            self = .midLevel
        case "senior" :
            self = .senior
        default:
            self = .junior
        }
    }
}


// Medeni hal enum'ı
enum MaritalStatus: Bool, CaseIterable {
    case married    = true
    case single     = false
    
    init(caseString: String) {
        switch caseString {
        case "married" :
            self = .married
        case "single" :
            self = .single
        default:
            self = .single
        }
    }
}


// MaritalStatus Bool rawValue'lu enum oluşturabilmek için Bool extention'ı.
extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = value != 0
    }
}
