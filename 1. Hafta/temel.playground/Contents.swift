import Cocoa

//Tuples
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error

//Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("integer value success")
}

if let letNumber = Int(possibleNumber) {
    //letNumber = 100
    print("Actual number is \(letNumber)")
}

if let convertedNumber {
    print("Yeni gelen XCode özelliği ile")
}

if var varNumber = Int(possibleNumber) {
    varNumber = 100
    print(varNumber)
}

//playgrounda bir fonksiyon olmadığı için throw bekliyor. Normalde düz return bile olur.
guard let guardNumber = Int(possibleNumber) else {
    throw NSError()
}

func foo() {
    guard let number = Int(possibleNumber) else { return }
}


// if let & guard arasındaki fark mülakat sorusudur aynı zamanda

//guard let biraz daha ön kesici gibidir. initial tarafta engellemek için hatayı kullanılıyor. Ancak orta bir yerlerde mesela methodtan çıkılmak istenmiyorsa yani elinde şu varsa bunu yap yoksa bunu yap diyebiliyorsak if let kullanıyoruz.


//Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

//Nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

for index in 1...5 {
    print(index)
}

//half-open Range
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i) is called \(names[i])")
}

//range
for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

//Inserting and Removing
var greetingString = "Guten Tag!"
greetingString[greetingString.startIndex]
greetingString.insert("0", at: greetingString.endIndex)

//Substring
let greetingTwo = "Hello, World!"
let index = greetingTwo.firstIndex(of: ",") ?? greetingTwo.endIndex
let beginning = greetingTwo[..<index]
let nextPart = greetingTwo[index...]
let newString = String(beginning)

let range = greetingTwo.startIndex..<greetingTwo.endIndex
greetingTwo[range]

let afterIndex = greetingTwo.index(after: greetingTwo.startIndex)
greetingTwo[afterIndex]
let afterIndexAll = greetingTwo.index(after: greetingTwo.startIndex)..<greetingTwo.endIndex
greetingTwo[afterIndexAll]

let beforeIndex = greetingTwo.index(before: greetingTwo.endIndex)
greetingTwo[beforeIndex]
let beforeIndexAll = greetingTwo.startIndex..<greetingTwo.index(before: greetingTwo.endIndex)
greetingTwo[beforeIndexAll]

let offsetByIndex = greetingTwo.index(greetingTwo.startIndex, offsetBy: 7)
greetingTwo[offsetByIndex]
let startIndex = greetingTwo.index(greetingTwo.startIndex, offsetBy: 4)
let endIndex = greetingTwo.index(greetingTwo.endIndex, offsetBy: -4)
let rangeStartAndEnd = startIndex ..< endIndex
greetingTwo[rangeStartAndEnd]

// The limitedBy is useful for making sure that the offset does not cause the index to go out of bounds. It is a bounding index. Since it is possible for the offset to exceed the limit, this method returns an Optional. It returns nil if the index is out of bounds.
if let indexLimited = greetingTwo.index(greetingTwo.startIndex,
                                 offsetBy: 7,
                                 limitedBy: greetingTwo.endIndex) {
    greetingTwo[indexLimited]
}

let beforeOffsetBy = greetingTwo.index(greetingTwo.startIndex, offsetBy: 8)
greetingTwo[..<beforeOffsetBy]
//or
let beforeORindex = greetingTwo.index(greetingTwo.startIndex, offsetBy: 5)
let myPrefixIndex = greetingTwo.prefix(upTo: beforeORindex)
//or
let prefixAfter = greetingTwo.prefix(5)


let indexEndToOffsetBy = greetingTwo.index(greetingTwo.endIndex, offsetBy: -10)
let mySubstring = greetingTwo[index...]
//or
let indexEndToSubs = greetingTwo.index(greetingTwo.endIndex, offsetBy: -10)
let mySuffixIndex = greetingTwo.suffix(from: index)
//or
let suffixBefore = greetingTwo.suffix(8)
