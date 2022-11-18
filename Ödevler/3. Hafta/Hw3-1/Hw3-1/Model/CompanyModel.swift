//
//  CompanyModel.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import Foundation

//The class that contains the Company's information.
class Company: CompanyProtocol {
    var budget: Double?
    var incomeInfo: Double?
    var expenseInfo: Double?
    
    var companyName: String?
    var foundationDate: String?
    static var employeeList: [Employee] = [Employee]()
    
    init() {
        
    }
    
    //initialize method
    init(name: String, foundationDate: String, budget: Double, incomeInfo: Double, expenseInfo: Double) {
        self.companyName = name
        self.foundationDate = foundationDate
        self.budget = budget
        self.incomeInfo = incomeInfo
        self.expenseInfo = expenseInfo
    }
    
    //If an external employee is wanted to be added
    func addEmployee(employee: Employee) {
        Company.employeeList.insert(employee, at: 0)
    }
    
    //If you want to see what the balance between income and expense is
    func balanceOfIncomeAndExpense() -> Double {
        var totalSalary = 0.0
        for i in Company.employeeList {
            totalSalary += (i.salary ?? 0)
        }
        self.expenseInfo! += totalSalary
        let balance = self.incomeInfo! - self.expenseInfo!
        return balance
    }
    
    //Even if the budget is a negative value, the employee must be given his due. This is the work of the employee. Therefore, if the budget is negative, I did not want to make a mistake directly. If the business owner wants to control their budget and there is a negative value in the budget, I just wanted to suppress it.
    var currentBudget: Double {
        self.budget! += self.incomeInfo!
        self.budget! -= self.expenseInfo!
        
        return budget!
    }
    
    //If you want to add income externally
    func addIncomeExtra(add: Double) {
        self.budget! += add
    }
    
    //If you want to add an expense externally
    func addExpenseExtra(add: Double) {
        self.budget! -= add
    }
    
    //Location of Error
    func companyErrorFunc(budget: Double, incomeInfo: Double, expenseInfo: Double) throws {
//        if budget + incomeInfo < budget - expenseInfo {
//            throw CompanyBudgetError.debtSituation
//        }
        
        //1 error handling situation came to my mind.
        guard budget >= 0 else {
            throw CompanyBudgetError.debtSituation
        }
    }
}
