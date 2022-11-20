//
//  AnimalsProtocol.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 19.11.2022.
//

import Foundation

protocol AnimalsProtocol {
    var name: String? { get }
    var zookeeper: ZookeeperModel? { get set }
    var animalType: String? { get set }
}   
