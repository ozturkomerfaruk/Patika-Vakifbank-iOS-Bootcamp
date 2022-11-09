import Cocoa

//The sorted method
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]

func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

backward(names[0], names[1])

var reversedNames = names.sorted(by: backward)
reversedNames = names.sorted(by: {
    (s1: String, s2: String) -> Bool in
    return s1 > s2
})

reversedNames = names.sorted(by: { s1, s2 in
    return s1 > s2
})

reversedNames = names.sorted(by: { s1, s2 in s1 > s2 })

reversedNames = names.sorted(by: { $0 > $1 })

reversedNames = names.sorted(by: >)


//Trailing Closures
func functionClosure(closure: () -> Void) {
    print("I'm in function")
    closure()
}

functionClosure(closure: {
    print("I'm in closure")
})

functionClosure() {
    print("I'm in trailing closure")
}

functionClosure {
    print("I'm in trailing closure")
}

reversedNames = names.sorted {
    $0 > $1
}



//MARK: MAP
let digitNames = [
    0: "Zero",
    1: "One",
    2: "Two",
    3: "Three",
    4: "Four",
    5: "Five",
    6: "Six",
    7: "Seven",
    8: "Eight",
    9: "Nine"
]

let numbers = [16, 58, 510]

let stringMAP = numbers.map {
    (num) -> String in
    var number = num
    var output = ""
    repeat {
        output = digitNames[number % 10]! + output
        number /= 10
    } while number > 0
    return output
}

print(stringMAP)
16 % 10

//MARK: Multi Closure
struct Picture {}
struct Server {}

//MARK: Picture Manager
func download(_ name: String, from server: Server) -> Picture? {
    return Picture()
}

func loadPicture(from server: Server, completion: (Picture) -> Void, onFailure: () -> Void) {
    if let picture = download("photo.jpg", from: server) {
        completion(picture)
    } else {
        onFailure()
    }
}

//MARK: VC
let someServer = Server()
let currentPicture = Picture()
loadPicture(from: someServer) {
    picture in
    //Alert success
} onFailure: {
    //Alert fail
}

//MARK: Capturing Values
///Int dönüş tipinde bir fonksiyondur. Ancak input almayan bir fonksiyon
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
//İlginç :D
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()

let incrementByThree = makeIncrementer(forIncrement: 3)
incrementByThree()
incrementByThree()
incrementByThree()

incrementByTen()
incrementByThree()


//MARK: Closures are reference types
let alsoIncrementByTen = incrementByTen
incrementByTen()
alsoIncrementByTen()

///Eğer referans tipinde olmasaydı Struct gibi value tipinde olsaydı en baştan başlardı. Yeniden başladı çünkü 10lu artan memoryde ki yer aynı oldu referans tipinde bağlandı. Önemli nokta!!!!!








//MARK: Protocol Örnek
//Ufuk Köşker - Protocol Örneği
///Bootcamp Office Hours - 9 Kasım 2022

struct ColorVarient {
    var id: Int?
    var value: String?
}

struct StorageVarient {
    var id: Int?
    var value: String?
}

protocol VarientProtocol {
    var id: Int { get set }
    var value: String { get set}
}

class VarientViewModel: VarientProtocol {
    var id: Int
    var value: String
    
    init(id: Int, value: String) {
        self.id = id
        self.value = value
    }
}

var selectedColorVarient: ColorVarient = ColorVarient(id: 1, value: "Kırmızı")
var selectedStorageVarient: StorageVarient = StorageVarient(id: 1, value: "120GB")

var colorVarient = VarientViewModel(id: selectedColorVarient.id ?? 0, value: selectedColorVarient.value ?? "")
var storogeVarient = VarientViewModel(id: selectedStorageVarient.id ?? 0, value: selectedStorageVarient.value ?? "")

func prepareCell(with model: VarientProtocol) {
    print("id: \(model.id)")
    print("id: \(model.value)")
}

prepareCell(with: colorVarient)
prepareCell(with: storogeVarient)

/// prepareCEll VarientPrrotocol'ü impelement eden her clas'ı kabul edebilir.
/// burada bağımlılıktan kurtulmuş olduk
/// Backend'den gelen varient'ları VarientViewModel içinde toplayabildim
/// toplandığım variantları prepare Cell içerisinde rahatlıklıkla kullanabildim
/// Eğer protocol yazmasaydım her bir class için prepareCell fonksiyonu yazacaktım
