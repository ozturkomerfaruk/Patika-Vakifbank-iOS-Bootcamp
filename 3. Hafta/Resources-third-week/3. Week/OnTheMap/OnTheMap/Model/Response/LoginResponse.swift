//
//  LoginResponse.swift
//  OnTheMap

import Foundation

struct LoginResponse: Codable {
    let account: AccountModel
    let session: SessionModel
}

struct AccountModel: Codable {
    let registered: Bool
    let key: String
}

struct SessionModel: Codable {
    let id: String
}
