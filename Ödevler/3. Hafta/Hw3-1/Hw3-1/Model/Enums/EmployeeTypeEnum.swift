//
//  EmployeeTypeEnum.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import Foundation

//MARK: ENUMS
//Enum that determines salary order by employee type
enum EmployeeTypeEnum: Double {
    case junior = 5_000.0
    case midLevel = 10_000.0
    case senior = 20_000.0
    
    var stringValue: String {
        switch self {
        case .junior:
            return "Junior"
        case .midLevel:
            return "Mid Level"
        case .senior:
            return "Senior"
        }
    }
}
