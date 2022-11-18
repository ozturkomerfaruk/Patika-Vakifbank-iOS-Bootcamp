//
//  CompanyProtocol.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import Foundation

//MARK: Protocol Company
//external control of the company's budget with a protocol
protocol CompanyProtocol {
    var budget: Double? { get set }
    var incomeInfo: Double? { get set }
    var expenseInfo: Double? { get set }
    
    func balanceOfIncomeAndExpense() -> Double
}
