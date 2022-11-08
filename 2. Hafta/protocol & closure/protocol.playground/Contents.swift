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
