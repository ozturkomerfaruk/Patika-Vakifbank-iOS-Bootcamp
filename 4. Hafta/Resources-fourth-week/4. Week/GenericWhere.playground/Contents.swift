import Foundation

//Function
func printElement<T: CustomStringConvertible>(_ element: T) {
    print(element)
}

func printElementWhere<T>(_ element: T) where T: CustomStringConvertible {
    printElement(element)
}

//Extension
struct Wrapper<T> {
    let value: T
    
    func someFunc() {
        print("Wrapper")
    }
}

extension Wrapper where T: Equatable {
    func equatable(other: T) {
        if value == other {
            print("Equal")
        } else {
            print("Not Equal")
        }
    }
}

struct NotEquatableObject {
    let someProperty: String
}

//String Wrapper
let stringWrapper = Wrapper(value: "Hello")
let string = "Hello"
stringWrapper.equatable(other: string)

//NotEquatableObjectWrapper
let notEquatableObjectWrapper = Wrapper(value: NotEquatableObject(someProperty: "Property"))
let notEquatableObject = NotEquatableObject(someProperty: "Property")
//notEquatableObjectWrapper.equatable - not available
