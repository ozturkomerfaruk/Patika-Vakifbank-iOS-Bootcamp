import Foundation

//ENUMERATIONS

//Syntax
enum CompassPoint {
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

var directionToHead: CompassPoint = .west
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

for beverage in Beverage.allCases {
    print(beverage)
}

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


