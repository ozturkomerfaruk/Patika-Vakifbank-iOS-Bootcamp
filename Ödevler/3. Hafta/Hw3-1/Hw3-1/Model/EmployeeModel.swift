//
//  Employee.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import Foundation

//MARK: Employee
//The class that contains the employee's information.
class Employee {
    var name: String?
    var age: Int?
    var maritalStatus: MaritalStatusEnum?
    var homeCity: String?
    var hometown: String?
    var salary: Double?
    
    //Exponentially increasing salary in certain age ranges and extra salary if married.
    var employeeType: EmployeeTypeEnum? {
        get {
            return .junior
        }
        set {
            if let age = self.age {
                if age < 20 {
                    self.salary = 0
                } else if age < 30 && age >= 20 {
                    self.salary = (newValue?.rawValue ?? 0) * 1
                } else if age < 40 && age >= 30 {
                    self.salary = ((newValue?.rawValue ?? 0)) * 2
                } else if age < 50 && age >= 40 {
                    self.salary = ((newValue?.rawValue ?? 0)) * 3
                } else if age < 60 && age >= 50 {
                    self.salary = ((newValue?.rawValue ?? 0)) * 4
                } else {
                    self.salary = 0
                }
            }
            if let maritalStatus = self.maritalStatus {
                if maritalStatus == .married {
                    self.salary! += 2500
                }
            }
            
        }
    }
    
    init() {
        
    }
    
    //initialize method
    init(name: String, age: Int, maritalStatus: MaritalStatusEnum, homeCity: String, hometown: String, employeeType: EmployeeTypeEnum) {
        self.name = name
        self.age = age
        self.maritalStatus = maritalStatus
        self.homeCity = homeCity
        self.hometown = hometown
        self.employeeType = employeeType
    }
}
