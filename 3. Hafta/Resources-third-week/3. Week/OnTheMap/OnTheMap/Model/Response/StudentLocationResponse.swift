//
//  StudentLocationResponse.swift
//  OnTheMap

import Foundation

struct StudentLocationResponse: Codable {
    let results: [StudentInformation]
}

struct StudentInformation: Codable {
    let firstName: String
    let lastName: String
    let latitude: Double
    let longitude: Double
    let mapString: String
    let mediaURL: String
    let uniqueKey: String
}
