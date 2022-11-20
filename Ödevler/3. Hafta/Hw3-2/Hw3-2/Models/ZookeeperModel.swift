//
//  ZookeeperModel.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import Foundation

//Zookeeper class for the zoo.
class ZookeeperModel {
    var name: String?
    
    //A Zookeeper can babysit more than one animal.
    var animalList: [any AnimalsProtocol] = [any AnimalsProtocol]()
    
    //The more animals a zookeeper cares for, the more money he makes.
    var salary: Double? {
        let count = animalList.count
        if count >= 1 && count <= 9 {
            return 1000 * Double(count)
        } else if count >= 10 {
            return 3000 * Double(count)
        } else {
            return 0
        }
    }
    
    //Initialize
    init(name: String) {
        self.name = name
    }
}
