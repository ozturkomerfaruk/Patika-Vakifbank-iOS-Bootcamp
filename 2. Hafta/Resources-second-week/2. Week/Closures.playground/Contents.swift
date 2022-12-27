import Foundation

//Closure Expressions

//The sorted method
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

//Inferring Type From Context
reversedNames = names.sorted(by: { s1, s2 in return s1 > s2 })
//[String]

//Implicit returns from single-expression closures
reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

//Shorthand Argument Names
reversedNames = names.sorted(by: { $0 > $1 })

//Operator Methods
reversedNames = names.sorted(by: >)

//Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    print("I'm in function")
    closure()
}

someFunctionThatTakesAClosure(closure: {
    print("I'm in closure")
})

someFunctionThatTakesAClosure() {
    print("I'm in trailing closure")
}

someFunctionThatTakesAClosure {
    print("I'm in trailing closure")
}

reversedNames = names.sorted { $0 > $1 }

//Map
let digitNames = [0: "Zero",
                  1: "One",
                  2: "Two",
                  3: "Three",
                  4: "Four",
                  5: "Five",
                  6: "Six",
                  7: "Seven",
                  8: "Eight",
                  9: "Nine"]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

//Multi Closure
struct Picture {}
struct Server {}

//Picture Manager
func download(_ name: String, from server: Server) -> Picture? {
    return Picture()
}

func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

//VC
let someServer = Server()
var currentPicture = Picture()
loadPicture(from: someServer) { picture in
    //Alert succes
} onFailure: {
    //Alert fail
}

//Capturing Values
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()

//Closures are reference types

let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
incrementByTen()
