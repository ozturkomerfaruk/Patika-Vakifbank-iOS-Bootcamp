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

//Structs Classes

//Definition Syntax
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var frameRate = 0.0
    var name: String?
}

//Structure and class Instances
let someResolution = Resolution()
let vga = Resolution(width: 640, height: 480)
let someVideoMode = VideoMode()

//Accessing Properties
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280

//Structures and Enumerations Are Value Types
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2048

print("hd is now \(hd.width)")
print("cinema is now \(cinema.width)")

enum CompassDirection {
    case north, south, east, west
    mutating func turnNorth() {
        self = .north
    }
}
var currentDirection = CompassDirection.west
let rememberedDirection = currentDirection
currentDirection.turnNorth()

print("The current direction is \(currentDirection)")
print("The remembered direction is \(rememberedDirection)")

//Classes Are Referance Type
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
print("The frameRate property of alsoTenEighty is now \(alsoTenEighty.frameRate)")

//Properties
//Stored Properties

struct FixedLenghtRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLenghtRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6

//Lazy
class DataImporter {
    var filename = "data.txt"
}

class RawDataImporter: DataImporter {}

class DataManager {
    lazy var importer = DataImporter()
    lazy var rawImporter = RawDataImporter()
    var data: [String] = []
}

struct NewManager {
    lazy var importer = DataImporter()
}

let manager = DataManager()
let newManager = NewManager()
manager.data.append("Some data") //importer not yet initialized
manager.data.append("Some more data") //importer not yet initialized
print(manager.importer.filename) //importer initialized

//Computed Properties
struct Point {
    var x = 0.0, y = 0.0
}

struct Size {
    var width = 0.0, height = 0.0
}

struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX: Double = origin.x + (size.width / 3.0)
            let centerY: Double = origin.y + (size.height / 3.0)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now ar \(square.origin.x), \(square.origin.y)")
print(square.center)

//Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet {
            print("About to set totalSteps to \(newValue)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 260

//Static
struct SomeStructure {
    static var storedTypeProperty = "Some Value"
    static var computedTypeProperty: Int { 1 }
}

enum SomeEnumeration {
    static var storeTypeProperty = "Some Value enum"
    static var computedTypeProperty: Int { 6 }
}

class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int { 27 }
    class var overrideableComputedTypeProperty: Int { 100 }
    var someMyInteger: Int { 3 }
}

class SubClass: SomeClass {
    override class var overrideableComputedTypeProperty: Int { 50 }
    override var someMyInteger: Int { 5 }
}

let structure = SomeStructure()

print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeClass.overrideableComputedTypeProperty)
print(SubClass.overrideableComputedTypeProperty)

//METHODS
//Instance Methods
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

let myCounter = Counter()
myCounter.increment()
myCounter.increment(by: 5)
myCounter.reset()

//Self
struct PointParameter {
    var x = 0.0, y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = PointParameter(x: 4, y: 5.0)
if somePoint.isToTheRightOf(x: 1.0) {
    print("This point is to the right of the line where x == 1.0")
}

//Type Methods
class SomeClassWithTypeMethod {
    //var property = 0
    class func someTypeMethod() {
        print("type method")
        //property
    }
}
SomeClassWithTypeMethod.someTypeMethod()

//Subscipts
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

//INHERITANCE

//BaseClass
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    
    func makeNoise() {
        print("No noise default")
    }
}

let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

//SubClass
class Bicycle: Vehicle {
    var hasBasket = false
}

let myBicycle = Bicycle()
myBicycle.hasBasket = true
myBicycle.currentSpeed = 15.0
print("Bicycle: \(myBicycle.description)")

class SuperBike: Bicycle {
    var otherValue = 0.0
}

let mySuperBike = SuperBike()
mySuperBike.makeNoise()

//Override
final class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()

//Initialization
struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}

var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")

//Parameter init
struct Celcius {
    var temperatureInCelcius: Double
    init(fromFahrenheit: Double) {
        temperatureInCelcius = fromFahrenheit - 32.0 / 1.8
    }
    
    init(fromKelvin: Double) {
        temperatureInCelcius = fromKelvin - 273.15
    }
}

let boilingPointOfWater = Celcius(fromFahrenheit: 212.0)
let freezingPointOfWater = Celcius(fromKelvin: 273.15)

//Default Init
class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//Memberwise init - Only Structs
struct SizeMember {
    var width = 0.0, height = 0.0
}

let twoByTwo = SizeMember(width: 2.0, height: 2.0)
let zeroByTwo = SizeMember(height: 5.0)
print(zeroByTwo.width)

//Designated&Convenience
class Food {
    var name: String
    var count: String
    init(name: String, count: String) {
        self.name = name
        self.count = count
    }
    
    convenience init(name: String) {
        self.init(name: name, count: "0")
    }
    
    convenience init() {
        self.init(name: "[Unnamed]", count: "0")
    }
}

let myFood = Food()


