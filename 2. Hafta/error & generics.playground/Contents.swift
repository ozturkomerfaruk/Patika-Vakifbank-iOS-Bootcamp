import Cocoa

//Representing Error
enum RocketError: Error {
    case insufficientFuel
    case insufficientAstronauts(needed: Int)
    case unknownError
}

//Error Handling
func igniteRockets(fuel:Int, astronauts: Int) throws {
    if fuel < 1000 {
        throw RocketError.insufficientFuel
    }
    else if astronauts < 3 {
        throw RocketError.insufficientAstronauts(needed : 3)
    }
    print("3....2...1...Ignition !!!LIFTOFF!!!!")
}

func rocketErrorFunc(fuel:Int, astronauts: Int) throws {
    guard fuel > 1000 else {
        throw RocketError.insufficientFuel
    }
    
    guard astronauts > 3 else {
        throw RocketError.insufficientAstronauts(needed : 3)
    }
    
    print("3....2...1...Ignition !!!LIFTOFF!!!!")
}


do {
    try rocketErrorFunc(fuel: 5000, astronauts: 4)
} catch RocketError.insufficientFuel {
    print("The rocket needs more fuel to take of !")
} catch RocketError.insufficientAstronauts(let needed){
    print("You need at least \(needed) astronauts ...")
}

//-----------------------------------------

//Generics
func swapTwo<T>(_ a: inout T, _ b: inout T) {
    String(describing: a)
    String(describing: b)
    
    let temp = a
    a = b
    b = temp
}

var first = 123
var second = 1

print("someInt: \(first), anotherInt: \(second)")
swapTwo(&first, &second)
print("someInt: \(first), anotherInt: \(second)")

//----Stack----
struct Stack<T> {
    var items: [T] = []
    
    mutating func push(_ item: T) {
        items.append(item)
    }
    
    mutating func pop() -> T {
        return items.removeLast()
    }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
let fromtheTop = stackOfStrings.pop()
print(stackOfStrings)
print(fromtheTop)

extension Stack {
    var topItem: T? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
    
    var count: Int {
        return items.count
    }
}

stackOfStrings.topItem
stackOfStrings.count

//-------------Type Constraint
//Generic
func findIndex<T: Equatable>(of valueToFind: T, in array: [T]) -> Int? {
    for (index, value) in array.enumerated() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}

let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
let doubleIndex = findIndex(of: 9.3, in: [3.14, 0.1, 0.25])

