//
//  Employee.swift
//  CompanyManagementApp
//
//   
//

import Foundation

final class Employee {
    var name: String
    var age: Int
    var id: Int
    var maritalStatus: MaritalStatus
    var title: EmployeeType
    var salary: Double {
        ((Double(age) / 100.0) + 1.0) * title.rawValue * 12_000
    }
    
    init(name: String, age: Int, maritalSatatus: MaritalStatus, title: EmployeeType, employeeId id: Int) {
        self.name           = name
        self.age            = age
        self.maritalStatus  = maritalSatatus
        self.title          = title
        self.id             = id
    }
    
    static func calculateSalary(age: Int, title: EmployeeType) -> Double {
        return ((Double(age) / 100.0) + 1.0) * title.rawValue * 12_000
    }
}
