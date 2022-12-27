import Foundation

//How ARC Works
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}

var reference1: Person?
var reference2: Person?
var reference3: Person?

reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

//Strong Reference Cycles Between Class Instances
class NewPerson {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    var tenant: NewPerson?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("\(unit) is being deinitialized")
    }
}

var john: NewPerson?
var unit4A: Apartment?

john = NewPerson(name: "John")
unit4A = Apartment(unit: "4A")

john?.apartment = unit4A
unit4A?.tenant = john

john = nil
unit4A = nil

//Resolving Strong Reference Cycles
class WeakPerson {
    let name: String
    var apartment: WeakApartment?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class WeakApartment {
    let unit: String
    weak var tenant: WeakPerson?
    
    init(unit: String) {
        self.unit = unit
    }
    
    deinit {
        print("\(unit) is being deinitialized")
    }
}

var weakJohn: WeakPerson?
var weakUnit4A: WeakApartment?

weakJohn = WeakPerson(name: "Weak John")
weakUnit4A = WeakApartment(unit: "Weak 4A")

weakJohn?.apartment = weakUnit4A
weakUnit4A?.tenant = weakJohn

weakUnit4A = nil
//weakJohn = nil

//Unowned
class Customer {
    let name: String
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    
    deinit {
        print("Card \(number) is being deinitialized.")
    }
}

var unownedJohn: Customer?
unownedJohn = Customer(name: "unowned John")
unownedJohn?.creditCard = CreditCard(number: 1234_5678_1234_5678, customer: unownedJohn!)

unownedJohn = nil

//Strong Reference Closures
class HTMLElement {
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

let heading = HTMLElement(name: "h1")
let defaultText = "Default Text"
// asHTML is changable
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)>"
}

print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello World")
print(paragraph!.asHTML())
paragraph = nil

//Resolving Strong Reference Cycles for Closures - Retain cycles
class HTMLElementResolved {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

//Weak version class
class HTMLElementResolvedWeak {
    
    let name: String
    let text: String?
    
    lazy var asHTML: () -> String = { [weak self] in
        guard let self = self else { return "" }
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)/>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    
    deinit {
        print("\(name) is being deinitialized.")
    }
}

var paragraphResolved: HTMLElementResolved? = HTMLElementResolved(name: "p", text: "hello, world")
print(paragraphResolved!.asHTML())
paragraphResolved = nil

