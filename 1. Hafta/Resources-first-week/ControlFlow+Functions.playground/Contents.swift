import Foundation

//For-in loops
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names {
    print("Hello \(name)")
}

let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName) have \(legCount) legs")
}

//While Loops
var currentLevel: Int = 0
var finalLevel: Int = 5

while (currentLevel <= finalLevel) {
    print("You have passed level \(currentLevel)")
    currentLevel += 1
}

//CONDITIONAL STATEMENTS
//If

var temperatureFahrenheit = 35
if temperatureFahrenheit <= 32 {
    print("It's cold")
} else if temperatureFahrenheit <= 60 {
    print("It's warm")
} else {
    print("It's not that cold")
}

//Switch
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

let anotherCharacter: Character = "b"
switch anotherCharacter {
case "a", "A":
    print("The letter A")
default:
    print("Not the letter A")
}

//Interval Matching
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
let naturalCount: String

switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings).")

//Value Binding
let point = (2, 0)
switch point {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
    fallthrough
default:
    print("in the coordinate system")
}

//Continue
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
let charactersToRemove: [Character] = ["a", "e", "i", "o", "u", " "]

for character in puzzleInput {
    if !charactersToRemove.contains(character) {
        continue
    }
    puzzleOutput.append(character)
}
print(puzzleOutput)

//Break
for i in 1...5 {
    if i == 3 {
        continue
    }
    print(i)
}

//FUNCTIONS
//Defining
func greet(person: String) -> String {
    return "Hello " + person + "!"
}

print(greet(person: "Anna"))

//Function Without Parameter
func sayHelloWorld() -> String {
    "Hello World!"
}
print(sayHelloWorld())

//Function with multiple parameters
func checkAndGreet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return "Already greeted."
    } else {
        return greet(person: person)
    }
}
print(checkAndGreet(person: "Tim", alreadyGreeted: false))

//Function without return values
func sayHello(person: String) {
    print("Hello \(person)")
}

sayHello(person: "Dave")

//Function Argument Labels and Parameter names
func greetArgument(person: String, from hometown: String) -> String {
    return "Hello \(person)! from \(hometown)"
}
print(greetArgument(person: "Bill", from: "Cupertino"))

//Default Parameter Values
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    print(parameterWithDefault + parameterWithoutDefault)
}

someFunction(parameterWithoutDefault: 5)
someFunction(parameterWithoutDefault: 4, parameterWithDefault: 10)

//Function Types
func addTwoInts(a: Int, b: Int) -> Int {
    return a+b
}

let anotherMethod = addTwoInts
anotherMethod(2,5)
