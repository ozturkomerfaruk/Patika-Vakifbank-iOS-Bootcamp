import Foundation

//Protocol Syntax
protocol SomeProtocol {}
struct SomeStructs: SomeProtocol {}
class SomeClass: SomeProtocol {}


//Property Requirements
protocol SomeOtherProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}

protocol FullyNamed {
    var fullName: String { get }
}

struct Person: FullyNamed {
    var fullName: String
}

let john = Person(fullName: "Kaan Y")

class Starship: FullyNamed {
    var prefix: String?
    var name: String
    
    var fullName: String { return (prefix != nil ? prefix! + " " : ":") + name }
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
}

var ship = Starship(name: "Enterprise", prefix: "USS")
ship.fullName

//Method Requirements
protocol MyRandomNumberGenerator {
    func random() -> Double
}

class TwoChoiceRandomGenerator: MyRandomNumberGenerator {
    
    var firstChoice: Double = 0.0
    var secondChoice: Double = 0.0
    
    init(first: Double, second: Double) {
        firstChoice = first
        secondChoice = second
    }
    
    func random() -> Double {
        Bool.random() ? firstChoice : secondChoice
    }
}

let twoChoiceGenerator = TwoChoiceRandomGenerator(first: 5, second: 10)
let random = twoChoiceGenerator.random()

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

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

//Initializer Requiremets
protocol SomeInitProtocol {
    init(someParameter: Int)
}

class SomeMyClass: SomeInitProtocol {
    required init(someParameter: Int) {}
}

protocol SomeOtherInitProtocol {
    init()
}

class SomeSuperClass {
    init() {}
}

class SomeSubclass: SomeSuperClass, SomeOtherInitProtocol {
    required override init() {}
}

//Protocol as Types
class Dice {
    let sides: Int
    let generator: MyRandomNumberGenerator
    init(sides: Int, generator: MyRandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

var specialDice = Dice(sides: 6, generator: TwoChoiceRandomGenerator(first: 1, second: 2))
for _ in 1...5 {
    print("Random dice roll is \(specialDice.roll())")
}

//Delegation
protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate: AnyObject {
    func gameDidStart(_ game: DiceGame)
    func game(_game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(_ game: DiceGame)
}

class MyDiceGame: DiceGame {
    let dice = Dice(sides: 2, generator: TwoChoiceRandomGenerator(first: 1, second: 2))
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
    }
}

class DiceGameLogger: DiceGameDelegate {
    func gameDidStart(_ game: DiceGame) {
        print("The game is using a \(game.dice.sides) sided dice")
    }
    
    func game(_game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int) {
        print("Rolled a \(diceRoll)")
    }
    
    func gameDidEnd(_ game: DiceGame) {
        print("The game finished")
    }
}

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

let logger = DiceGameLogger()
let dbWriter = DiceGameDBWriter()
let game = MyDiceGame()
game.delegate = dbWriter
game.play()

//Adding Protocol Conformance with an Extension
protocol TextRepresentable {
    var textualDescription: String { get }
}

extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}

let d12 = Dice(sides: 12, generator: TwoChoiceRandomGenerator(first: 1.0, second: 2.0))
print(d12.textualDescription)

//Conditionaly Conforming to a Protocol
extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemAsText = self.map { $0.textualDescription }
        return "[" + itemAsText.joined(separator: ",") + "]"
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

let prettyTestDice = Dice(sides: 3, generator: TwoChoiceRandomGenerator(first: 0.0, second: 1.0))
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

func wishHappyBirthday(to celebrator: Named & Aged) {
    print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = PersonSimple(name: "Malcolm", age: 22)
wishHappyBirthday(to: birthdayPerson)

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
extension MyRandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}

let generator = TwoChoiceRandomGenerator(first: 0.1, second: 0.8)
print("Here's a random number: \(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")

//Providing Default Implementations
extension PrettyTextRepresentable {
    var prettyTextualDescription: String {
        return textualDescription
    }
}
