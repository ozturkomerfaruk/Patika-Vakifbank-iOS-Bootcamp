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

//Without generics
func swapTwoInts<T>(_ a: inout T, _ b: inout T) {
    
    
    let temp = a
    a = b
    b = temp
}

var someInt = "asd"
var anotherInt = "123"

print("someInt: \(someInt), anotherInt: \(anotherInt)")
swapTwoInts(&someInt, &anotherInt)
print("someInt: \(someInt), anotherInt: \(anotherInt)")
