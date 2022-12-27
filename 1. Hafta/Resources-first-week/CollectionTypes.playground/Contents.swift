import Foundation

//ARRAY

//Create Empty
var someInts: [Int] = []
someInts.append(3)
someInts = []

//Array with default values
var threeDoubles = Array(repeating: 0.0, count: 3)

//Array Literal
var shoppingList = ["Egg", "Milk"]

//Accessing and Modifying
print("The shopping list contains \(shoppingList.count)")
if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list isn't empty")
}

shoppingList += ["Baking powder", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList

shoppingList.insert("Maple syrup", at: 0)
let butter = shoppingList.removeLast()
shoppingList

//Iterating Over an Array
for item in shoppingList {
    print(item)
}

//Nested Array
let nestedArray: [[Int]] = [[1], [2], [3, 8, 6]]

//SETS

//Creating Empty Set
var letters = Set<Character>()
letters .insert("a")
letters = []

//Creating a Set with literal
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip Hop"]

//Accessing and Modifying
print("I have \(favoriteGenres.count) favorite music genres")

if favoriteGenres.isEmpty {
    print("As far as music goes, I'm not picky")
} else {
    print("I have particular music preferences")
}

favoriteGenres.insert("Jazz")
favoriteGenres
print(favoriteGenres)

if let removeGenre = favoriteGenres.remove("Rock") {
    print("\(removeGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot")
} else {
    print("Funk not included")
}

//Iterating Over a Set
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sorted() {
    print("\(genre)")
}
let sorted = favoriteGenres.sorted()

//Performing Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits)
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()

//Membership
let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)

//DICTIONARY
//Creating Empty
var namesOfIntegers: [Int:String] = [:]
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

//Creating a Dictionary with a Dictionary Literal
var airports: [String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//Accessing and Modifying a Dictionary
print("The airport dictionary contains \(airports.count) items.")
if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary isn't empty")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport isn't in the airport dictionary")
}

airports["APL"] = "Apple International"
airports["APL"] = nil
airports

if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary doesn't contain a value for DUB")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}





