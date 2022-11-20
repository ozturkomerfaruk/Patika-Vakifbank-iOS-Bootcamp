//
//  ZooModel.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import Foundation

class ZooModel {
    //List of all animals in the zoo
    static var allAnimalList: [any AnimalsProtocol] = []
    //List of all zookeepers in the zoo
    static var allZookeeperList: [ZookeeperModel] = [ZookeeperModel]()
    //List of all zookeepers' salary
    static var allZookeeperSalary: Double? = 0.0
    // The budget of Zoo
    static var budget: Double? = 10_000
    // The water tank limit of Zoo
    static var waterLimit: Double? = 100
    
    
    // The income value of Zoo
    var incomeInfo: Double? = 0.0
    // The expense value of Zoo
    var expenseInfo: Double? = 0.0
    // The current Water! value of Zoo
    var currentWaterTank: Double {
        return ZooModel.waterLimit!
    }
    
    init() {
        
    }
}
