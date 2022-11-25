import Cocoa

///ARCler referans tipler üzerinde çalışmaktadır. Struct gibilerde zaten kullanılmadığında direk memoryden düşüyor ancak class da özen göstermemiz gereken ayrı bir nokta bulunmaktadır.

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
var ref1: Person?
var ref2: Person?
var ref3: Person?

///Kullanılma bitiyor
/*
ref1 = Person(name: "Omer")
ref1 = nil
*/
 
///Kullanılmaya devam ediliyor.
/*
ref1 = Person(name: "Omer")
ref2 = ref1
ref3 = ref1
ref1 = nil
*/

//Strong Reference Cycle Between Class Instances
class NewPerson {
    let name: String
    var apartment: Apartment?
    
    init(name: String) {
        self.name = name
        
        print("\(name) is being initialized")
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
        print("\(unit) is being initialized")
    }
    
    deinit {
        print("\(unit) is being deinitialized")
    }
}

///Burada omer ve yilmazlar initialized edililrken Strong olarak initialize edilmektedir.
/*
var omer: NewPerson?
var yilmazlar: Apartment?
omer = NewPerson(name: "Omer")
yilmazlar = Apartment(unit: "Yilmazlar")
*/
///Şimdi birbirlerine karşı da Strong olarak tutulmaktadır.
/*
omer?.apartment = yilmazlar
yilmazlar?.tenant = omer
*/
///Burada ikisini de nilledik. Initialize edilmelerinin bağlarını kopardık ama kendi aralarında hala Strong olarak tutuldukları için deinit edilmediler bir türlü.
/*
omer = nil
yilmazlar = nil
*/

//Resolving Strong Reference Cycles
class WeakPerson {
    let name: String
    var apartment: WeakApartment?
    
    init(name: String) {
        self.name = name
        
        print("\(name) is being initialized")
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
        print("\(unit) is being initialized")
    }
    
    deinit {
        print("\(unit) is being deinitialized")
    }
}
/*
var weakOmer: WeakPerson?
var weakYilmazlar: WeakApartment?
weakOmer = WeakPerson(name: "Omer")
weakYilmazlar = WeakApartment(unit: "Yilmazlar")

weakOmer?.apartment = weakYilmazlar
weakYilmazlar?.tenant = weakOmer
*/
///Burada omer ile yilmazlar arasında ki bağ koptu ve birde tabi omerin initialize olayı koptu. Ancak yilmazların initializesi hala duruyor.
/* weakOmer = nil */
///Burada yilmazlar da kopuyor.
/* weakYilmazlar = nil */
///Not: İki classdan birine weak yazmak yeterli.


// Unowned
///Bunun farkı da biri silinirken diğeri de siliniyor. Farkı bu...

class Customer {
    let name: String
    var creditCard: CreditCard?
    
    init(name: String) {
        self.name = name
        
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer?
    
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
        print("\(number) is being initialized")
    }
    
    deinit {
        print("\(number) is being deinitialized")
    }
}
///Burada unownedOmer diye bir değişken oluşturulduğu için Customer Strong ile bağlı ama CreditCard herhangi bir şeye bağlı değil sadece referans edilmiş. Ancak creditCard ile omer unowned olarak bağlı. fakat omer'den creditCard'a olan bağlılık strong
/*
var unownedOmer: Customer?
unownedOmer = Customer(name: "Omer Faruk")
unownedOmer?.creditCard = CreditCard(number: 123123123, customer: unownedOmer!)
*/
///Credit card'da nil oldu.

/* unownedOmer = nil */

///Not: Aynı şeyi ben weak ile denedim. Onda da sildi tek farkı weak da var zorunlu tutuldu. unowned da let ile CreditCard içerisinde Customer tanımlanabiliyordu.


//Strong Closure Reference Types
class HTMLElement {
    let name: String
    let text: String?
    
    ///lazy: init edilirken oluşmayan, ne zaman kullanılmak istenirse oluşan demek.
    ///() -> String: Parametre almayan ama String döndüren fonksiyon
    lazy var asHTML: () -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

///Closure yapısında ki fonksiyon ile Class arasında Strong bağ bulunmakta. paragraph var olmasa bile classın elemanları hala var.
/*
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello World")
print(paragraph!.asHTML())
paragraph = nil
*/

//Resolving Strong Reference Cycles For Closures
class HTMLElementResolved {
    let name: String
    let text: String?
    
    
    ///self'e yani Class'a yönelen Closure bağlantısı unowned oluyor.
    ///weak olsaydı eğer weak nil gelme ihtimali olduğu için ayrı bir guard ile kontrol etmek gerekecekti. unowned da böyle bir şey yok
    lazy var asHTML: () -> String = { [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    lazy var asHTMLWeak: () -> String = { [weak self] in
        guard let self = self else { return ""}
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name)>"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
        
        print("\(name) is being initialized")
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}
var paragraph: HTMLElementResolved? = HTMLElementResolved(name: "p", text: "Hello World")
print(paragraph!.asHTML())
print(paragraph!.asHTMLWeak())
paragraph = nil

var date = "06-05-2017"

func formattedDateFromString(dateString: String, withFormat format: String) -> String? {

    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "dd/MM/yyyy"

    if let date = inputFormatter.date(from: dateString) {

        let outputFormatter = DateFormatter()
      outputFormatter.dateFormat = format

        return outputFormatter.string(from: date)
    }

    return nil
}

let stringA = formattedDateFromString(dateString: "21/07/2016", withFormat: "yyyy-MM-dd")
let stringB = formattedDateFromString(dateString: "21/07/2016", withFormat: "MMM dd, yyyy")

print("stringA: \(String(describing: stringA))") // 2016-07-21
print("stringB: \(String(describing: stringB))") // Jul 21, 2016
