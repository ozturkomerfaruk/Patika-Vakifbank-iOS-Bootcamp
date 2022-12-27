//
//  LoginRequest.swift
//  OnTheMap

import Foundation

struct LoginRequest: Codable {
    let udacity: UdacityModel
}

struct UdacityModel: Codable {
    let username: String
    let password: String
}
