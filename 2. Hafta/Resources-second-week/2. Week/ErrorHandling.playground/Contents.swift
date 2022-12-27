import Foundation

//Representing Error

enum VendingMachineError: Error {
case invalidSelection
case insufficientFunds(coinsNeeded: Int)
case outOfStock
}

//throw VendingMachineError.invalidSelection

//Handle Errors
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Chocolate": Item(price: 5, count: 11)
    ]
    var coinsDeposed = 0
    
    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= coinsDeposed else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposed)
        }
        
        coinsDeposed -= item.price
        
        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem
        
        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Eve": "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

//Handle Errors
var vendingMachine = VendingMachine()
vendingMachine.coinsDeposed = 16

do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success Yum")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection")
} catch VendingMachineError.outOfStock {
    print("Out of stock")
} catch VendingMachineError.insufficientFunds(coinsNeeded: let coinsNeeded) {
    print("Insufficient funds. \(coinsNeeded) coins needed")
} catch {
    print("Unexpected error: \(error)")
}

//Converting Errors to Optional Values
func someThrowingFunction() throws -> Int {
    throw VendingMachineError.invalidSelection
}

let x = try? someThrowingFunction()

let y: Int?
do {
    y = try someThrowingFunction()
} catch {
    y = nil
}

let value = try! someThrowingFunction()

