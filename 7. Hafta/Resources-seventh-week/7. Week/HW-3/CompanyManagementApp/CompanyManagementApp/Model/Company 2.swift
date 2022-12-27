//
//  Company.swift
//  CompanyManagementApp
//
//   
//

import UIKit


// CompanyCreation işlemi yapacak class'larda uygulanması gereken fonksiyonlar
protocol CompanyCreator { // Protocol ✅
    func hireEmployee(name: String, age: Int, maritalStatus: MaritalStatus, title: EmployeeType, employeeId: Int, completion: (Employee?, String?) -> ())
    func fireEmployee(employeeName name: String, employeeId id: Int)
    func addIncome(amount: Double)
    func addExpense(amount: Double, completion: (String?) -> ())
    func paySalary(completion: (String) -> ())
}


// Şirket Class'ı
class Company: CompanyCreator { // Protocol ✅
    var companyName: String
    var budget: Double
    var establishmentYear: Int
    var employees: [Employee]?  // Optional ✅
    var logo: UIImage?
    var totalSalary: Double {
        if let employees = employees, !employees.isEmpty{
            var totalSalary = 0.0
            employees.forEach{ totalSalary += $0.salary }
            return totalSalary
        }
        return 0.0
    }
    
    // Initializer'da employees array optional'dır. Default olarak nil tanımlanmıştır.
    init(companyName name: String, companyBudget budget: Double, establishmentYear year: Int, logo: UIImage?, employees: [Employee]? = nil) {
        self.companyName        = name
        self.budget             = budget
        self.establishmentYear  = year
        self.employees          = employees
        self.logo               = logo
        print("\(name) Company is created in \(year) with \(employees?.count ?? 0) employee(s) and the budget of \(budget.formattedWithSeparator)₺")
    }
    
    // Isim ve id ile çalışan çıkarma fonksiyonu
    func fireEmployee(employeeName name: String, employeeId id: Int) {
        // employees array'inin oluşturulup oluşturulmadığı ve boş olup olmadığını kontrol ediyoruz
        guard var employees = employees, !employees.isEmpty else {
            print("There is no employee to fire.")
            return
        }
        
        var employeeFound = false
        
        for (index, employee) in employees.enumerated() {
            // Çalışan çıkarılırken aratılan isim ve id'nin mevcut çalışanlarda olup olmadığı kontrolü
            if name.lowercased() == employee.name.lowercased() && employee.id == id {
                employees.remove(at: index)
                self.employees = employees
                print("\(employee.name) with id: \(employee.id) is fired.")
                employeeFound = true
                break
            }
        }
        
        if !employeeFound {
            print("There is no \(name) with id: \(id) employee to fire.")
        } else {
            employeeFound = false
        }
    }
    
    
    func hireEmployee(name: String, age: Int, maritalStatus: MaritalStatus, title: EmployeeType, employeeId: Int, completion: (Employee?, String?) -> ()) {
        let employee = Employee(name: name, age: age, maritalSatatus: maritalStatus, title: title, employeeId: employeeId)
        var idCheck = true
        
        if var employees = employees {
            // Çalışan eklenirken, eklemek istenen id'ye sahip daha önce bir çalışan olup olmadığı kontrolü.
            employees.forEach{
                if $0.id == employeeId {
                    let error = "There is already an employee with id: \(employeeId). Please try another id."
                    completion(nil, error)
                    idCheck = false
                    return
                }
            }
            // eğer eklenen id'li çalışan varsa fonksiyonu devam ettirmemek için guard
            guard idCheck else { return }
            
            employees.append(employee)
            completion(employee, nil)
            self.employees = employees
        } else {
            var employees = [Employee]()
            employees.append(employee)
            completion(employee, nil)
            self.employees = employees
        }
        
        print("Employee \(name) is hired.")
    }
    
    // gelir eklemek için kullanılır
    func addIncome(amount: Double) {
        let previousBudget  = budget
        budget             += amount
        print("Income is added. Previos budget: \(previousBudget.formattedWithSeparator)₺, new budget: \(budget.formattedWithSeparator)₺")
    }
    
    // gider eklemek için kullanılır
    func addExpense(amount: Double, completion: (String?) -> ()) {
        // eğer budget'da yeterli para yoksa uyarı verir ve gider oluşmaz.
        if budget >= amount {
            let previousBudget  = budget
            budget             -= amount
            print("Expense is added. Previos budget: \(previousBudget.formattedWithSeparator)₺, new budget: \(budget.formattedWithSeparator)₺")
        } else {
            completion("There is not enough money to pay expense. Please add income to budget case.")
        }
    }
    
    
    func getEmployeeInfo(fromId id: Int, completion: (Employee?, String?) -> ()) {
        if let employees = employees {
            var selectedEmployee: Employee?
            employees.forEach{
                if $0.id == id {
                    selectedEmployee = $0
                    completion(selectedEmployee, nil)
                }
            }
            if selectedEmployee == nil {
                completion(nil, "There is no \(id) id employee.")
            }
        }
    }
    
    
    func paySalary(completion: (String) -> () ) { // Closure ✅
        var message = String()
        if let employees = employees, !employees.isEmpty{
            if budget >= totalSalary {
                budget -= totalSalary
                message = "\(totalSalary.formattedWithSeparator)₺ employee salaries are paid. Remaining budget: \(budget.formattedWithSeparator)₺."
                completion(message)
            } else {
                // eğer budget'da maaşlar için yeterli para yoksa uyarı verir ve gider oluşmaz.
                message = "There is not enough money to pay salaries. Please add income to budget case."
                completion(message)
            }
        } else {
            message = "There is no employee to pay salary."
            completion(message)
        }
    }
}
