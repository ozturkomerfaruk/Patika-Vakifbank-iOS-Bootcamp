# Temel Kodlar

## Emojilerle tanımlama yapmak mümkünmüş :))

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

