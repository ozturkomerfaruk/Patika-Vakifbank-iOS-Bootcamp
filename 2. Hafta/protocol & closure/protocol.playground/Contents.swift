import Cocoa

//syntax
protocol FullyNamedProtocol {
    var setFullName: String { get }
}
struct Person: FullyNamedProtocol {
    var setFullName: String
}
var omer = Person(setFullName: "Ömer Faruk")

class Starship: FullyNamedProtocol {
    var prefix: String?
    var name: String
    
    var setFullName: String {
        return (prefix != nil ? prefix! + " " : ">") + name
    }
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
}
var ship = Starship(name: "Enterprise")
print(ship.setFullName)

protocol RandomGeneratorProtocol {
    func randomGenerator() -> Double
}

class Random: RandomGeneratorProtocol {
    var first = 0.0, second = 0.0
    init(first: Double, second: Double) {
        self.first = first
        self.second = second
    }
    func randomGenerator() -> Double {
        Bool.random() ? first : second
    }
}
let twoChoice = Random(first: 12, second: 10)
print(twoChoice.randomGenerator())




//Mutating Method Requirements
protocol Togglable {
    mutating func toggle()
}

enum OnOffSwitch: Togglable {
    case on, off
    mutating func toggle() {
        switch self {
        case .off:
            self = .on
        case .on:
            self = .off
        }
    }
}

var ligthSwitch = OnOffSwitch.off
ligthSwitch.toggle()

//----

//Initializer Requirements
protocol InitProtocol {
    init(someParam: Int)
}

class myClass: InitProtocol {
    required init(someParam: Int) { }
}

protocol OtherInitProtocol {
    init()
}

class SuperClass {
    init() {
        
    }
}

class SubClass: SuperClass, OtherInitProtocol {
    required override init() {
        
    }
}

class Dice {
    let sides: Int
    let generator: RandomGeneratorProtocol
    init(sides: Int, generator: RandomGeneratorProtocol) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.randomGenerator() * Double(sides)) + 1
    }
}

var specialDice = Dice(sides: 6, generator: Random(first: 10, second: 30))

print(specialDice.roll())

for _ in 1...5 {
    print("Random dice roll is \(specialDice.roll())")
}


// // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // // //

protocol KaraHayvani {
    var karadaHareket: Bool {get set}
    func karadaHareketEt()
}

struct Karga: KaraHayvani{

    var isim: String
    var karadaHareket: Bool
    
    func karadaHareketEt() {
        print("Karga yemek yiyor.")
    }
}

let kargaStruct: Karga = Karga(isim: "Rüştü", karadaHareket: true)
let kargaProtocol: KaraHayvani = Karga(isim: "Rüştü", karadaHareket: false)

kargaProtocol.karadaHareketEt()


//Associated Type
protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

struct NewIntStack: Container {
    var items: [Int] = []
    
    mutating func push(_ item: Int) {
        items.append(item)
    }
    
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    typealias Item = Int
    mutating func append(_ item: Int) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}

//Adding Constraints to an Associated Type
protocol NewContainer {
    associatedtype Item: Equatable
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}

//Generic Where Clauses
func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
    if someContainer.count != anotherContainer.count {
        return false
    }
    
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    
    return true
}







struct Stack<Element> {
    var items: [Element] = []
    
    mutating func push(_ item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

extension Stack where Element: Equatable {
    func isTop(_ item: Element) -> Bool {
        guard let topItem = items.last else {
            return false
        }
        return topItem == item
    }
}
var stackOfStrings = Stack<String>()
if stackOfStrings.isTop("uno") {
    print("Top element is uno")
} else {
    print("top element is something else")
}




struct NotEquatable {}
var notEquatableStack = Stack<NotEquatable>()
let element = NotEquatable()
notEquatableStack.push(element)
//notEquatableStack.isTop(element)
//Generic Subscripts
extension Container {
    subscript<Indices: Sequence>(indices: Indices) -> [Item] where Indices.Iterator.Element == Int {
        var result: [Item] = []
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}


@objc protocol OptionalProtocol {
    var storedProtocolValue: Bool {get set}
    @objc optional func optionalMethod()
}

class ClassFromOptionalProtocol : OptionalProtocol{
    var storedProtocolValue: Bool
    
    init(initValue: Bool) {
        self.storedProtocolValue = initValue
    }
    func optionalMethod() {
        print("Optional Method")
    }
}

var denemeObjesi = ClassFromOptionalProtocol(initValue: true)
denemeObjesi.optionalMethod()


//Delegate Pattern
///Bir view controllerdan diğerine geçerken veri aktarmanın farklı yöntemleri vardır ve rahatlıkla yapılabilir. Ancak geçtiğimiz view controllerdan geri dönerken veri aktarmak istediğimizde veya bir metodu tetiklemek istediğimizde ilk duruma göre biraz daha karışık bir yapı ile uğraşmamız gerekir. Bu yapılardan bir tanesi delegate yapısıdır. Bir senaryo belirleyim:
///İki adet View Controller var. Bunlar MainViewController ve CustomPopUViewController
///CustomPopUpView, MainView üzerine bir pop up present açıyor ve pop up içindeki butona bastığında pop up dismiss ediliyor. MainView içindeki bir metodu da tetiklemek istiyorum bir yandan.
///Ne oldu PopUp bir görünüm açtı dismiss edildi daha sonra. Dismiss edildikten sonra ben Maine ulaşacağım ama nasıl? Oynat Bakalım!
///Detaylı örnek linki burada https://www.mobilhanem.com/swift-protocol-nedir-ve-protocol-kullanimi/
///Ders kapsamında devam edecek olursak:


//Ek Olarak
///Bir objeyi başka bir objeye işi yaptırmasıdır esasında. Bir class da 4 iş yapmaktansa 4 farklı class da ayrı ayrı 4 iş yaptırmak daha mantıklıdır.

///Delegation protocol ile başlar
protocol DiceGame {
    var dice: Dice {get} //sadece read only
    func play()
}

///AnyObject ile sadece classlar bağlansın. Aynı zamanda weak kullanımı için gerekli olmaktadır. Delegate ler hep weak olarak eklendiği için AnyObject lazım oluyor.
protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class MyDiceGame: DiceGame {
    let dice = Dice(sides: 2, generator: Random(first: 1, second: 2))
    var diceValue = 0
    weak var delegate: DiceGameDelegate?
    
    func play() {
        delegate?.gameDidStart(self)
        print("Playing the game")
        let diceRoll = dice.roll()
        delegate?.game(_game: self, didStartNewTurnWithDiceRoll: diceRoll)
        diceRoll == 5 ? print("Lose") : print("Win")
        diceValue = diceRoll
        delegate?.gameDidEnd(self)
        ///Mesela gameDidEnd metodu yerine burada bi ViewController yer alabilir ve farklı bir yere yönlendirebilir.
    }
}

class DiceGameLogger: DiceGameDelegate {
    func gameDidStart(_ game: DiceGame) {
        print("The game is using \(game.dice.sides) sided dice")
    }
    
    func game(_game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game finished")
    }
}

let logger = DiceGameLogger()
let game = MyDiceGame()
game.delegate = logger
game.play()

class DiceGameDBWriter: DiceGameDelegate {
    func gameDidStart(_ game: DiceGame) {
        print("DB write game start")
    }
    
    func game(_game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        print("\(diceRoll) db inserted")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("Game db write finished")
    }
}


let dbWriter = DiceGameDBWriter()
let secondGame = MyDiceGame()
secondGame.delegate = dbWriter
secondGame.play()




//Adding Protocol Conformance with an Extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    internal var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: Random(first: 5, second: 10))
print(d12.textualDescription)


//Conditionaly Conforming to a Protocol
///Bu şu demek eğer array bir şekilde tutulacak ve Arrayin içerisinde TextRepresentable protocolunden değişkenler vs. varsa textualDescription çalışmaktadır. Yani o zaman bu extension aktif olmaktadır.
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemAsTet = self.map {
            $0.textualDescription
        }
        return "[" + itemAsTet.joined(separator: ",") + "]"
    }
}

let myDice = [specialDice, d12]
print(myDice.textualDescription)


//Declaring Protocol Adoption with Extension
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A Hamster named \(name)"
    }
}

extension Hamster: TextRepresentable {}

let simonTheHamster = Hamster(name: "Simon")
let somethingTextRepresentable: TextRepresentable = simonTheHamster
print(somethingTextRepresentable.textualDescription)


//Collections of Protocol Types
let things: [TextRepresentable] = [d12, simonTheHamster]

for thing in things {
    print(thing.textualDescription)
}


//Protocol Inheritance
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}

extension Dice: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return "Pretty dice side: \(sides)"
    }
}

let prettyTestDice = Dice(sides: 3, generator: Random(first: 0.0, second: 1.0))
prettyTestDice.prettyTextualDescription


//Protocol Composition
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct PersonSimple: Named, Aged {
    var name: String
    var age: Int
}

///Muazzam
///PersonSimple öncelikle 2 tane protocol almaktadır. Bu yüzden bunun kullanılacağı yerde Composition yapmak gerekmektedir.
func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

var birthdayPerson = PersonSimple(name: "Malcolm", age: 22)
wishHappyBirthday(to: birthdayPerson)



//------------

//Checking for Protocol Conformance
protocol HasArea {
    var area: Double { get }
}

class Circle: HasArea {
    let pi = 3.14
    var radius: Double
    var area: Double {
        return pi * radius * radius
        
    }
    init(radius: Double) {
        self.radius = radius
    }
}

class Country: HasArea {
    var area: Double
    init(area: Double) {
        self.area = area
    }
}

class Animal {
    var legs: Int
    init(legs: Int) {
        self.legs = legs
    }
}

let objects: [AnyObject] = [Circle(radius: 2.0), Country(area: 243000), Animal(legs: 4)]

for object in objects {
    if let objectWithArea = object as? HasArea {
        print("Area is \(objectWithArea.area)")
    } else {
        print("Something that doesn't have an area")
    }
}

//Protocol Extensions
extension RandomGeneratorProtocol {
    func randomBool() -> Bool {
        return randomGenerator() > 0.5
    }
}

let generator = Random(first: 0.1, second: 0.8)
print("Here's a random number: \(generator.randomGenerator())")
print("And here's a random Boolean: \(generator.randomBool())")


//Providing Default Implementations
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
