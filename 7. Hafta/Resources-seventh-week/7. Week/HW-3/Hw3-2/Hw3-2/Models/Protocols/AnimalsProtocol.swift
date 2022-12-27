//
//  AnimalsProtocol.swift
//  Hw3-2
//
//    
//

import Foundation

protocol AnimalsProtocol {
    var name: String? { get }
    var zookeeper: ZookeeperModel? { get set }
    var animalType: String? { get set }
}   
