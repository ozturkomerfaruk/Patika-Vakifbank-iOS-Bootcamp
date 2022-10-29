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
