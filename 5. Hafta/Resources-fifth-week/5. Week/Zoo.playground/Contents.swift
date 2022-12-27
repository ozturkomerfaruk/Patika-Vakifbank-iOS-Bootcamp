import Foundation

//Caregiver sınıfının protocolünü tanımladım.
protocol CaregiverInfo {
    var name: String { get }
    var animals: [any AnimalsInfo]? { get }
    var salary: Int { get }
    var experiance: Int { get }
}

//Caregiver sınıfını tanımladım.
class Caregiver: CaregiverInfo {
    var name: String
    var animals: [any AnimalsInfo]? //Eklenecek olan hayvan AnimalsInfo protocolüne uyması gerekiyor.
    var experiance: Int
    var salary: Int { experiance * animals!.count * 100 } //Bakıcının maaş ödemesinin nasıl yapılacağını tanımlıyorum.
    
    //animals array'i içerisinde gelen ve careGiver'ı olmayan hayvanlara bakıcı da bu kısımda atanıyor.
    init(name:String , experience: Int){
        self.name = name
        self.experiance = experience
        self.animals = []
    }
}

//Hayvan classlarının protocolü tanımlandı.
protocol AnimalsInfo {
    var waterLimit: Int { get }
    var name: String { get }
    var careGiver: Caregiver? { get set }
    func speak()
}


class Cat: AnimalsInfo {
    var waterLimit: Int
    var name: String
    var careGiver: Caregiver?
    func speak(){
        print("Miyyaavvv")
    }
    init(waterLimit: Int, name: String){
        self.waterLimit = waterLimit
        self.name = name
    }
}

class Dog: AnimalsInfo {
    var waterLimit: Int
    var name: String
    var careGiver: Caregiver?
    func speak(){
        print("HAVHAVV")
    }
    init(waterLimit: Int, name: String){
        self.waterLimit = waterLimit
        self.name = name
    }
}

//Zoo clasının protocolü tanımlandı.
protocol ZooInfo {
    var budget: Int { get }
    var waterLimit: Int { get }
    var animals: [AnimalsInfo] { get }
    var caregivers: [Caregiver] { get }
    var totalSalary: Int { get }
}

struct Zoo: ZooInfo {
    var budget: Int
    var waterLimit: Int
    var animals: [AnimalsInfo] //Eklenecek olan animal AnimalsInfo protocolüne uygun olmalı.
    var caregivers: [Caregiver] //Eklenecek olan bakıcı Caregiver classından olmalı.
    var totalSalary: Int { //Tüm bakıcıların maaşı hesaplandı, toplam maaş dönüyorum.
        var totalWorkerSalary: Int = 0
        for workerSalary in caregivers {
            totalWorkerSalary += workerSalary.salary
        }
        return totalWorkerSalary
    }
    
    //Hayvan eklemesi yapıyorum. AnimalsInfo protocolüne uygun bir veri bekliyorum. Başarılı olursa eklenen hayvanı dönüyorum.
    mutating func addAnimal(animal: AnimalsInfo, completion: (_ animal: AnimalsInfo) -> Void, onFailure: (_ error: String) -> Void) {
        guard animal.waterLimit <= waterLimit
        else {
            onFailure("Not enough water limit to add new animal.")
            return
        }
        animals.append(animal)
        waterLimit -= animal.waterLimit
        completion(animal)
    }
    
    //Gelir eklemesi yapıyorum. Eklenecek gelirin fonksiyon çağrıldığında gelmesini bekliyorum, completion'da bütçeyi dönüyorum.
    mutating func addIncome (amount income: Int, completion: (_ budget: Int) -> Void, onFailure: (_ error: String) -> Void) {
        guard income > 0
        else {
            onFailure("Amount can not be negative.")
            return
        }
        budget += income
        completion(budget)
    }
    
    //Gider çıkarma kısmını yapıyorum. Çıkarılacak gelirin fonksiyon çağrıldığında gelmesini bekliyorum, completion'da bütçeyi dönüyorum.
    mutating func incomeComesOut (amount expense: Int, completion: (_ budget: Int) -> Void, onFailure: (_ error: String) -> Void) {
        guard expense > 0
        else {
            onFailure("Amount can not be negative.")
            return
        }
        
        guard expense <= budget
        else {
            onFailure("Not enough money to add expense.")
            return
        }
        budget -= expense
        completion(budget)
    }
    
    //Su eklemeyi yapıyorum. Girdi olarak eklenecek su miktarını bekliyorum.
    mutating func addWater (amount water: Int, completion: (_ waterLimit: Int) -> Void, onFailure: (_ error: String) -> Void) {
        guard water > 0
        else {
            onFailure("Amount can not be negative.")
            return
        }
        waterLimit += water
        completion(waterLimit)
    }
    
    //Maaş ödemesi yapıyorum. completion'da bütçeyi dönüyorum.
    mutating func paySalary(completion: (_ budget: Int) -> Void, onFailure: (_ error: String) -> Void) {
        guard totalSalary <= budget
        else {
            onFailure("Not enough money to pay salary.")
            return
        }
        budget -= totalSalary
        completion(budget)
    }
    
    //Bakıcı eklemesi yapıyorum. Girdi olarak Caregiver classından bekliyorum.
    mutating func addCaregiver(caregiver: Caregiver) {
        caregivers.append(caregiver)
    }
    
    mutating func takeAnimalOrCaregiver(animal: inout AnimalsInfo, caregiver: inout Caregiver,completion: (_ animal: AnimalsInfo) -> Void, onFailure: (_ error: String) -> Void){
        guard animals.contains(where: { $0.name == animal.name }) else {
            onFailure("This animal is not exists.")
            return
        }
        guard caregivers.contains(where: { $0.name == caregiver.name }) else {
            onFailure("This caregiver is not exists.")
            return
        }
        guard animal.careGiver == nil else {
            onFailure("This animal has already caregiver")
            return
        }
        animal.careGiver = caregiver
        caregiver.animals?.append(animal)
        completion(animal)
    }

    //Constructorda gelen hayvanların su tüketimini günlük su limitinden düşüyorum.
    init(budget: Int, waterLimit: Int, animals: [any AnimalsInfo], caregivers: [Caregiver]) {
        self.budget = budget
        self.animals = animals
        self.caregivers = caregivers
        
        var totalAnimalWater: Int = 0
        for animal in animals {
            totalAnimalWater += animal.waterLimit
        }
        self.waterLimit = waterLimit - totalAnimalWater
    }
    
}

var cat: AnimalsInfo = Cat(waterLimit: 3, name: "Sütlaç")
var dog: AnimalsInfo = Dog(waterLimit: 2, name: "Zeytin")
var cat2: AnimalsInfo = Cat(waterLimit: 1, name: "Sufle")

var caragiver = Caregiver(name: "Ali", experience: 2)
var caragiver2 = Caregiver(name: "Veli", experience: 1)
var caragiver3 = Caregiver(name: "Ayşe", experience: 1)

var addZoo = Zoo(budget: 1000, waterLimit: 1000, animals: [cat,dog], caregivers: [caragiver])

addZoo.addCaregiver(caregiver: caragiver2)

//dogru olan calisan.
addZoo.takeAnimalOrCaregiver(animal: &cat, caregiver: &caragiver) { animal in
    print("caregiver appointed to \(animal.name)")
} onFailure: { error in
    print(error)
}
//hayvanın bakıcısı varsa
addZoo.takeAnimalOrCaregiver(animal: &cat, caregiver: &caragiver) { animal in
    print("caregiver appointed to \(animal.name)")
} onFailure: { error in
    print(error)
}
//bakıcı hayvanat bahçesinde çalışmıyorsa
addZoo.takeAnimalOrCaregiver(animal: &cat, caregiver: &caragiver3) { animal in
    print("caregiver appointed to \(animal.name)")
} onFailure: { error in
    print(error)
}
//hayvan hayvanat bahçesinde yoksa.
addZoo.takeAnimalOrCaregiver(animal: &cat2, caregiver: &caragiver) { animal in
    print("caregiver appointed to \(animal.name)")
} onFailure: { error in
    print(error)
}


addZoo.addIncome(amount: 15) { budget in
    print("\(budget) has been added successfully.")
} onFailure: { error in
    print(error)
}


addZoo.paySalary { budget in
    print("Completed, remaining budget is \(budget)")
} onFailure: { error in
    print(error)
}

//yeni hayvan eklenmesi
addZoo.addAnimal(animal: cat2) { animal in
    print("\(animal.name) has been added successfully.")
} onFailure: { error in
    print(error)
}

addZoo.addWater(amount: 21) { waterLimit in
    print("New water limit is \(waterLimit) ")
} onFailure: { error in
    print(error)
}

addZoo.incomeComesOut(amount: 10) { budget in
    print("Completed, remaining budget is \(budget)")
} onFailure: { error in
    print(error)
}
