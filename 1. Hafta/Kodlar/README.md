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
