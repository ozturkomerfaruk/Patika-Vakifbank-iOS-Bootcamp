# Temel Kodlar

* Detaylı substring kullanımı
* Unary Minus Operator
* Optional
* Tuple

## Emojilerle tanımlama yapmak mümkünmüş :))

```
let 😛 = "ahaha"
print(😛)
```

## Kısaca Tuple örneği

```
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
```

## Optional kullanımı

```
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("integer value success")
}

if let letNumber = Int(possibleNumber) {
    //letNumber = 100
    print("Actual number is \(letNumber)")
}

if var varNumber = Int(possibleNumber) {
    varNumber = 100
    print(varNumber)
}
```
Sadece if let diye kafaya kodlamamak lazım if let olduğu zaman değişken değiştirilmiyor. if var kullanımı da var.

```
if let convertedNumber {
    print("Yeni gelen XCode özelliği ile")
}

guard let guardNumber = Int(possibleNumber) else {
    throw NSError()
}
```
playgrounda bir fonksiyon olmadığı için throw bekliyor. Normalde düz return bile olur.
```
func foo() {
    guard let number = Int(possibleNumber) else { return }
}
```
guard let bir fonksiyonun içerisinde yazıldığı zaman return ile geçilebiliyor.

## if let ile if guard arasındaki fark

guard let biraz daha ön kesici gibi. initial tarafta engellemek için kullanılıyor. Ancak orta bir yerlerde mesela methodtan çıkılmak istenmiyorsa yani elinde şu varsa bunu yap yoksa bunu yap diyebiliyorsak if let kullanıyoruz.

## Unary Minus Operator

```
let three = 3
let minusThree = -three
let plusThree = -minusThree
```
 
## Range belirleme

```
let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}
```

## Insert & Remove

```
var greetingString = "Guten Tag!"                           //"Guten Tag!"
greetingString[greetingString.startIndex]                   //"G"
greetingString.insert("0", at: greetingString.endIndex)     //"Guten Tag!0"
```

# Önemli

## Substring

```
let greetingTwo = "Hello, World!"                                           //"Hello, World!"
let index = greetingTwo.firstIndex(of: ",") ?? greetingTwo.endIndex            
let beginning = greetingTwo[..<index]                                       //"Hello"
let nextPart = greetingTwo[index...]                                        //", World!"
let newString = String(beginning)                                           //"Hello"
```

```
let range = greetingTwo.startIndex..<greetingTwo.endIndex
greetingTwo[range]                                                          //"Hello, World!"
```

```
let afterIndex = greetingTwo.index(after: greetingTwo.startIndex)                              
greetingTwo[afterIndex]                                                                            //"e"
let afterIndexAll = greetingTwo.index(after: greetingTwo.startIndex)..<greetingTwo.endIndex
greetingTwo[afterIndexAll]                                                                         //"ello, World!"
```

```
let beforeIndex = greetingTwo.index(before: greetingTwo.endIndex)   
greetingTwo[beforeIndex]                                                                            //"!"
let beforeIndexAll = greetingTwo.startIndex..<greetingTwo.index(before: greetingTwo.endIndex)
greetingTwo[beforeIndexAll]                                                                         //"Hello, World"
```

```
let offsetByIndex = greetingTwo.index(greetingTwo.startIndex, offsetBy: 7)
greetingTwo[offsetByIndex]                                                                  //"W"
let startIndex = greetingTwo.index(greetingTwo.startIndex, offsetBy: 4)
let endIndex = greetingTwo.index(greetingTwo.endIndex, offsetBy: -4)
let rangeStartAndEnd = startIndex ..< endIndex
greetingTwo[rangeStartAndEnd]                                                               //"o, Wo"
```

The limitedBy is useful for making sure that the offset does not cause the index to go out of bounds. It is a bounding index. Since it is possible for the offset to exceed the limit, this method returns an Optional. It returns nil if the index is out of bounds.

```
if let indexLimited = greetingTwo.index(greetingTwo.startIndex,
                                 offsetBy: 7,
                                 limitedBy: greetingTwo.endIndex) {
    greetingTwo[indexLimited]                                                               //"W"
}
```

```
let beforeOffsetBy = greetingTwo.index(greetingTwo.startIndex, offsetBy: 8)
greetingTwo[..<beforeOffsetBy]                                                          //", World!"
//or
let beforeORindex = greetingTwo.index(greetingTwo.startIndex, offsetBy: 5)
let myPrefixIndex = greetingTwo.prefix(upTo: beforeORindex)                             //", World!"
//or
let prefixAfter = greetingTwo.prefix(5)                                                 //", World!"
```

# SomeIssues

* nestedArray
* Set
* Dict
* Value Binding
* Enum

## Nested Array

```
let nestedArray: [[Int]] = [[1], [2], [3, 8, 6]]
nestedArray[2][1]
```

## Set

```
//Performing Set Operations
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
oddDigits.intersection(evenDigits)
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
```

```
//Membership
let houseAnimals: Set = ["dog", "cat"]
let farmAnimals: Set = ["cow", "chicken", "sheep", "dog", "cat"]
houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
```

## DICT

```
//DICT
var airports: [String:String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport isn't in the airport dictionary")
}
```

## Value Binding

```
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
```

# Önemli

## Enum

```
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
```

```
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
```

```
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
```

```
var productBarcode = Barcode.upc(8, 85909, 51225, 3)
productBarcode = .qr("ABCDVffhkshdkh")

switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("\(numberSystem)")
case .qr(let productCode):
    print("\(productCode)")
}
```

```
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
```
