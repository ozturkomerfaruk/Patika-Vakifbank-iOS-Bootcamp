//
//  CatModel.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 19.11.2022.
//

import Foundation

class AnimalModel: AnimalsProtocol {
    var name: String?
    var zookeeper: ZookeeperModel?
    var waterConsumption: Double = 20.0
    var animalType: String?
    
    init(name: String, zookeeper: ZookeeperModel, animalType: String) {
        self.name = name
        self.zookeeper = zookeeper
        self.animalType = animalType
    }
    
    init() {
        
    }
}
