import Cocoa

//Nested Array
let nestedArray: [[Int]] = [[1], [2], [3, 8, 6]]
nestedArray[2][1]

//SET
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

//DICT
var airports: [String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport isn't in the airport dictionary")
}


//Value Binding
let point = (2, 0)
switch point {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
    fallthrough
default:
    print("in the coordinate system")
}

//fallthrough, switch-case ile birlikte kullanılır. Bu terim ile, bu case çalışacak ama çalışmamış gibi sen devam et diyoruz.


//ENUM
enum CompassPoint {
    case north
    case south
    case east
    case west
}

var directionToHead: CompassPoint = .west
print(directionToHead)
directionToHead = .south
switch directionToHead {
case .north:
    print("North")
case .south:
    print("south")
case .east:
    print("east")
case .west:
    print("west")
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Earth")
default:
    print("Different")
}

//Iterating
enum Beverage: CaseIterable {
    case coffee, tea, juice
}

let numberOfChoices = Beverage.allCases.count

//Associated Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qr(String)
}

var productBarcode = Barcode.upc(8, 85909, 51225, 3)
productBarcode = .qr("ABCDVffhkshdkh")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("\(numberSystem)")
case .qr(let productCode):
    print("\(productCode)")
}

//Raw Values
enum MilkywayPlanet: Int {
    case mercury = 1
    case venus
    case mars
}

enum Compass: String {
    case north, south
}

let raw = MilkywayPlanet.venus.rawValue
let rawForCompass = Compass.north.rawValue

let rawValue = 1
let mercury = MilkywayPlanet(rawValue: rawValue)

