import Cocoa

//Function

func printElement<T: CustomStringConvertible>(_ element: T) {
    print(element)
}

func printElementWhere<T>(_ element: T) where T: CustomStringConvertible {
    print(element)
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
        value == other ? print("Equal") : print("Not Equal")
    }
}

struct NotEquatableObject {
    let someProperty: String
}

//String Wrapper
let stringWrapper = Wrapper(value: "Hello")
let string = "Hello"
stringWrapper.equatable(other: string)
let notEqualWrapper = Wrapper(value: NotEquatableObject(someProperty: "Hello"))
let notEqual = NotEquatableObject(someProperty: "Hello")
///Burada Wrapper da Wrapper'da equatable fonksiyonunu çağıramıyoruz çünkü NotEquatableObject structında Equatable bulunmamaktadır. Bu yüzden dolayı da, karşılaştırma yapamamaktayım.
