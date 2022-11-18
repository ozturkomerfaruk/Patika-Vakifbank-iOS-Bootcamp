//
//  CompanyBudgetError.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import Foundation

//MARK: Error Handling For Company
//Error Handling by budget deficit
enum CompanyBudgetError: Error {
    case debtSituation
    case unknownError
}
