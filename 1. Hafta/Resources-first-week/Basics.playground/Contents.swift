import Foundation

var greeting = "Hello, playground"

//BASICS
//Constants and Variables
let maximumNumberOfLoginAttemps = 10
var currentLoginAttempt = 0
var numberOfItem = 0, keyCount = 0.0, basketTotal = 0.0
print(keyCount)

//Type Annotation
var welcomeMessage: String
welcomeMessage = "Hello"

//Naming Constants and Variables
var 🧑🏻‍💻 = "Work"
let languageName = "Swift"
//languageName = "Swift++"

//Printing
print(languageName)
print("Number of login attempt is \(maximumNumberOfLoginAttemps)")

//Comments
// Bu bir commenttir
/* Bu da bir commenttir.
 Comment devam ediyor.
 */

//Integers
let animalCount: Int = 3

//Floating-Point
let bottlePrice: Double = 5.6
let plantPrice: Float = 10.71

//Type Safety
var meaningValue = 42
//meaningValue = "Hello"

//Booleans
let orangeAreOrange = true
let turnipsAreDelicious = true

if turnipsAreDelicious {
    print("Tasty")
} else {
    print("Eww, horrible")
}

//Tuples
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error

//Optionals
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

if convertedNumber != nil {
    print("integer value success")
}

if let convertedNumber {
    print("Actual number is \(convertedNumber)")
}

guard let number = Int(possibleNumber) else { throw NSError() }
number

func foo() {
    guard let number = Int(possibleNumber) else { return }
    print(number)
}

foo()

//OPERATORS
//Assignment Operator
var goalCount = 5
goalCount += 10

//Arithmetic Operators
1 + 2
5 - 3
2 * 3
9 % 4

//Unary Minus Operator
let three = 3
let minusThree = -three
let plusThree = -minusThree

//Comparison Operators
1 == 1
2 != 1
2 > 1
1 <= 1

let name = "World"
if name == "world" {
    print("hello world")
} else {
    print("Sorry not equal")
}

let apples = 3
let oranges = 5

if apples < oranges {
    print("Eat orange")
} else {
    print("Eat apple")
}

//Ternary Conditional Operator
var question = true
let answerOne = "Swift"
let answerTwo = "Kotlin"

if question {
    print(answerOne)
} else {
    print(answerTwo)
}

question ? print(answerOne) : print(answerTwo)

//Ternary Conditional Operator - 2
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//Nil-Coalescing Operator
let defaultColorName = "red"
var userDefinedColorName: String?

var colorNameToUse = userDefinedColorName ?? defaultColorName

//Range Operators
for index in 1...5 {
    print(index)
}

//Half-Open Range
let names = ["Anna", "Alex", "Brian", "Jack"]
let count = names.count
for i in 0..<count {
    print("Person \(i) is called \(names[i])")
}

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

//Logical Operators
let allowedEntry = false
if !allowedEntry {
    print("Access Denied")
}

let enteredDoorCode = true
let passedRetinaScan = false

if enteredDoorCode && passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}

if enteredDoorCode || passedRetinaScan {
    print("Welcome")
} else {
    print("Access Denied")
}


let hasDoorKey = false
let knowsOverridePassword = true

if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome")
} else {
    print("Access Denied")
}

//Strings
let someString = "Some string literal value"
let multilineString = """
Some string literal value line one
Some string literal value line two

Some string literal value line three
"""

//Empty String
var emptyString = ""
var anotherEmptyString = String()

emptyString == anotherEmptyString

//String Mutability
var variableString = "Horse"
variableString += " and dog"

//Working with Characters
for character in "Hello World" {
    print(character)
}

let characters: [Character] = ["H", "e", "l", "l", "o"]
let stringValue = String(characters)


//Concat
let stringOne = "Hello"
let stringTwo = " there"
let concateString = stringOne + stringTwo

//Interpoliation
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

//Accessing and Modifying
let greetingString = "Guten Tag!"
greetingString[greetingString.startIndex]

//Inserting and Removing
var welcome = "Hello"
welcome.insert("!", at: welcome.endIndex)

//Substring
let greetingTwo = "Hello, World!"
let index = greetingTwo.firstIndex(of: ",") ?? greetingTwo.endIndex
let beginning = greetingTwo[..<index]
let newString = String(beginning)

//Comparing Strings
let quotation = "We're a lot alike, you and I"
let sameQuotation = "We're a lot alike, you and I"
if quotation == sameQuotation {
    print("Strings are same")
}



