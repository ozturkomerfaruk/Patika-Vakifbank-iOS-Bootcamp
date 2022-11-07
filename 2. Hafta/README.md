# 2. Hafta

## Class & Struct & Enum

Class, reference type olarak geçer. Yani aynı sınıftan türeyen iki obje eşitlendiğinde, 2 objenin de değeri birebir aynı olur.

Enum ve Struct ise value types olarak geçer. Yani iki obje burada eşitlense bile, bunlar farklı yerlerde tutulur. Yani sadece kopyalar ama veriler Stack de tutulmaya devam edilir.

Struct yapısında fonksiyonda değişebilirlik eklemek için mutating eklenir.

```
struct Resolution {
    var width = 0
    var heigth = 0
    mutating func lowResolution() {
        self.width = 320
        self.heigth = 240
        print("\(self.width) & \(self.heigth) -> lowResolution mutated")
    }
}
```

## Properties

Stored properties

```
struct FixedLenghtRange {
    var firstValue: Int
    let length: Int
}

var rangeOfThreeItems = FixedLenghtRange(firstValue: 0, length: 3)
rangeOfThreeItems.firstValue = 6
```

Lazy

```
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
```

Computed properties

```
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
```

Property Observers

```
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
```

Static & Class

Normalde ikiside static olarak davranır ama override overrible edilemezken class subclaslarda override edilebilir

```
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
```

```
class SubClass: SomeClass {
    override class var overrideableComputedTypeProperty: Int { 50 }
    override var someMyInteger: Int { 5 }
}

let structure = SomeStructure()
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value."
print(SomeClass.overrideableComputedTypeProperty)
print(SubClass.overrideableComputedTypeProperty)
```

Subscripts

```
struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}

let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")
```

## Inheritence

```
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
```

```
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
```

```
final class Train: Vehicle {
    override func makeNoise() {
        print("Choo Choo")
    }
}
let train = Train()
train.makeNoise()
```

### Designated & Convenience

```
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
```

# Error Handling

enum ile case'leri represent etmek lazım.

```
enum RocketError: Error {
    case insufficientFuel
    case insufficientAstronauts(needed: Int)
    case unknownError
}
```

Errorları handling etme

```
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
```

Errorları çağırma durumu

```
do {
    try rocketErrorFunc(fuel: 5000, astronauts: 4)
} catch RocketError.insufficientFuel {
    print("The rocket needs more fuel to take of !")
} catch RocketError.insufficientAstronauts(let needed){
    print("You need at least \(needed) astronauts ...")
}
```

## Gemerics

function

```
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
```

stack

```
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
```
Type Constraint
```
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
```

