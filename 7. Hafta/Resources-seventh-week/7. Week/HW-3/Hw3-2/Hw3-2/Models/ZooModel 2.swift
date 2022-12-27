//
//  ZooModel.swift
//  Hw3-2
//
//    
//

import Foundation

class ZooModel {
    
    static let shared = ZooModel()
    
    //List of all animals in the zoo
    var allAnimalList: [any AnimalsProtocol] = []
    //List of all zookeepers in the zoo
    var allZookeeperList: [ZookeeperModel] = [ZookeeperModel]()
    //List of all zookeepers' salary
    var allZookeeperSalary: Double? = 0.0
    // The budget of Zoo
    var budget: Double? = 10_000
    // The water tank limit of Zoo
    var waterLimit: Double? = 100
    // The income value of Zoo
    var incomeInfo: Double? = 0.0
    // The expense value of Zoo
    var expenseInfo: Double? = 0.0
    // The current Water! value of Zoo
    var currentWaterTank: Double {
        return waterLimit!
    }
    
    private init() {
        
    }
}
