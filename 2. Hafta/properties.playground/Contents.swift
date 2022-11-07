import Cocoa

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

class RawDataImporter: DataImporter {
    
}

class DataManager {
    lazy var importer = DataImporter()
    lazy var rawImporter = RawDataImporter()
    var data: [String] = []
}

class NewManager {
    lazy var importer = DataImporter()
}

let manager = DataManager()
let newManager = NewManager()
manager.data.append("Some data") //importer not yet initialized
manager.data.append("Some more data")  //importer not yet initialized
print(manager.rawImporter.filename) //importer initialized

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

var square = Rect(origin: Point(x: 0, y: 0), size: Size(width: 10, height: 10))
let initialSquareCenter = square.center
print(square.center)
square.center = Point(x:15, y:15)
print("square.origin is now ar (\(square.origin.x), \(square.origin.y))")
print(square.center)

struct Circle {
    var r: Double
    var circleArea: Double {
        get {
            return Double.pi * pow(r,2)
        }
        set {
            //newValue kendinden geliyor
            r = sqrt(newValue / Double.pi)
        }
    }
}

var circle = Circle(r: 3)
print(circle.circleArea)
circle.circleArea = circle.circleArea / 2
print(circle.r)


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
    static var computedtypeProperty: Int { 1 }
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

/*Class ile static variable arasındaki fark
(Mülakat sorusu bu)
Normalde ikiside static olarak davranır ama override overrible edilemezken class subclaslarda override edilebilir.*/


class SubClass: SomeClass {
    override class var overrideableComputedTypeProperty: Int { 50 }
    override var someMyInteger: Int { 5 }
}

let structure = SomeStructure()
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeClass.overrideableComputedTypeProperty)
print(SubClass.overrideableComputedTypeProperty)


//Methods
//Instance Methods
class Counter {
    var count = 0
//    func increment() {
//        count += 1
//    }
    func increment(by amount: Int = 1) {
        self.count += amount
        print("Count: \(count)")
    }
    func reset() {
        count = 0
        print("Count: \(count)")
    }
}

let myCounter = Counter()
myCounter.increment(by: 5)
myCounter.increment()
myCounter.increment()
myCounter.reset()


//Self
struct PointParameter {
    var x = 0.0
    var y = 0.0
    func isToTheRightOf(x: Double) -> Bool {
        return self.x > x
    }
}

let somePoint = PointParameter(x: 4, y: 5)
if somePoint.isToTheRightOf(x: 1) {
    print("This point is to the right of line where x == 1.0")
} else {
    print("else else")
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


//Subscripts
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")


//Inheritence

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
print(twoByTwo.width)


//Designated & Convenience
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
        self.init(name: "[Unnamed]", count: "[None]")
    }
}

let myFood = Food()
print("Name: \(myFood.name) & Count: \(myFood.count)")
let myFood2 = Food(name: "Künefe")
print("Name: \(myFood2.name) & Count: \(myFood2.count)")
let myFood3 = Food(name: "Su", count: "12")
print("Name: \(myFood3.name) & Count: \(myFood3.count)")
