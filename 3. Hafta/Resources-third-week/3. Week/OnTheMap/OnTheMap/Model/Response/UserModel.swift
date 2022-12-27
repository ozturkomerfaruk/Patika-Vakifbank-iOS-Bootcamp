//
//  UserModel.swift
//  OnTheMap

import Foundation

struct UserModel: Codable {
    let firstName: String
    let lastName: String
    let key: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case key
    }
}
