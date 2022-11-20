//
//  MutualVariablesProtocol.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import Foundation

//In order to use Protocol, I took the variable name common to both Animal and Zookeeper and wanted to use it here.
protocol MutualVariablesProtocol {
    var name: String? { get set }
}
