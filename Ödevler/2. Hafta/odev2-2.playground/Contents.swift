import Cocoa
///Bahçemizde hayvanlarımız, bakıcılarımız olacak.
///Hayvanat bahçemizin hem bir günlük su limiti hem de bit bütçesi olacak.
///Hayvanat bahçesine gelir, gider eklemesi ve su limiti artırma yapılabilmelidir.
///Hayvanların su tüketimleri, sesleri olmalı
///Her hayvanın tek bakıcısı olmalıdır ancak bakıcılar birden fazla hayvana bakabilmelidir.
///Bulunan hayvanların su tüketimleri günlük limitten düşmelidir.
///Bakıcıların maaş ödemelerini yapılabilmeli. Hesap formulü kararı size bırakılmıştır.
///Sonradan bakıcı ve hayvan eklemesi yapılabilmelidir.
///Aynı hayvandan 1 den fazla olabilmelidir.
///Protocol, closure, optional, computed property kullanımı zorunludur.


//In order to use Protocol, I took the variable name common to both Animal and Zookeeper and wanted to use it here.
protocol MutualVariablesProtocol {
    var name: String? { get set }
}

//Zookeeper class for the zoo.
class Zookeeper: MutualVariablesProtocol {
    var name: String?
    
    //A Zookeeper can babysit more than one animal.
    var animalList: [Animal] = [Animal]()
    
    //The more animals a zookeeper cares for, the more money he makes.
    var salary: Double? {
        var count = animalList.count
        if count >= 1 && count <= 4 {
            return 5_500
        } else if count >= 5 && count <= 9 {
            return 7_500
        } else if count >= 10 {
            return 1000 * Double(count)
        } else {
            return 0
        }
    }
    
    //List of animals that Zookeeper is petting
    func addAnimal(animal: Animal) {
        animalList.insert(animal, at: 0)
    }
    
    //Initialize
    init(name: String) {
        self.name = name
    }
    
    init() {
        
    }
}

class Animal: MutualVariablesProtocol {
    var name: String?
    
    // the sound of the animal
    var animalSound: String?
    //Water consumption of each animal
    var waterConsumption: Double?
    //Each animal has 1 Zookeper.
    var zookeeper: Zookeeper?
    
    //initialize
    init(name: String, animalSound: String, waterConsumption: Double, zookeeper: Zookeeper) {
        self.name = name
        self.animalSound = animalSound
        self.waterConsumption = waterConsumption
        self.zookeeper = zookeeper
    }
    
    init(name: String, animalSound: String, waterConsumption: Double) {
        self.name = name
        self.animalSound = animalSound
        self.waterConsumption = waterConsumption
        
    }
}

//For the management of the Zoo
protocol ZooProtocol {
    var allAnimalList: [Animal] { get set }
    
    var budget: Double? { get set }
    var incomeInfo: Double? { get set }
    var expenseInfo: Double? { get set }
    
    var waterLimit: Double? { get set }
    
    func balanceOfIncomeAndExpense() -> Double
}

//MARK: Error Handling For Company
//Error Handling by budget deficit & Water drought
enum ZooBudgetError: Error {
    case debtSituation
    case droughtSituation
    case unknownError
}

class Zoo: ZooProtocol {
    //List of all animals in the zoo
    var allAnimalList: [Animal] = [Animal]()
    //List of all zookeepers in the zoo
    var allZookeeperList: [Zookeeper] = [Zookeeper]()
    
    // The budget of Zoo
    var budget: Double?
    // The water tank limit of Zoo
    var waterLimit: Double?
    // The income value of Zoo
    var incomeInfo: Double?
    // The expense value of Zoo
    var expenseInfo: Double?
    // The current Water! value of Zoo
    var currentWaterTank: Double {
        return self.waterLimit! - self.dailyWaterConsumptionCalculate()
    }
    
    // The current Budget! value of Zoo
    var currentBudget: Double {
        self.budget! += balanceOfIncomeAndExpense()
        
        return self.budget!
    }
    
    //Is there a shortage right now?
    var isThisWaterShortage: Bool {
        get {
            self.currentWaterTank < 0
        }
        set {
            if self.currentWaterTank > 0 {
                print("WATER SHORTAGE")
            }
        }
    }
    
    //init
    init(budget: Double, waterLimit: Double, incomeInfo: Double, expenseInfo: Double) {
        self.budget = budget
        self.waterLimit = waterLimit
        self.incomeInfo = incomeInfo
        self.expenseInfo = expenseInfo
    }
    
    //if a Zookeeper is to be added
    func addZookeeperToZoo(zookeeper: Zookeeper) {
        allZookeeperList.insert(zookeeper, at: (allZookeeperList.count))
    }
    
    //if an animal is to be added
    func addAnimalToZoo(animal: Animal) {
        allAnimalList.insert(animal, at: 0)
    }
    
    //it only calculates the difference between income and expenses.
    func balanceOfIncomeAndExpense() -> Double {
        var totalSalary = 0.0
        for i in allZookeeperList {
            totalSalary += (i.salary ?? 0)
        }
        self.expenseInfo! += totalSalary
        var balance = self.incomeInfo! - self.expenseInfo!
        return balance
    }
    
   
    //If you want to add income externally
    func addIncomeExtra(add: Double) {
        self.budget! += add
    }
    
    //If you want to add an expense externally
    func addExpenseExtra(add: Double) {
        self.budget! -= add
    }
    
    //daily water consumption of animals
    func dailyWaterConsumptionCalculate() -> Double {
        var totalConsumption = 0.0
        for i in self.allZookeeperList {
            for j in i.animalList {
                totalConsumption += j.waterConsumption!
            }
        }
       
        return totalConsumption
    }
    
    //If you want to add Water externally
    func addWater(add: Double) {
        self.waterLimit! += add
    }
    
    //If you want to reduce Water externally
    func reduceWater(reduce: Double) {
        self.waterLimit! -= reduce
    }
    
    //Location of Error
    func ZooErrorFunc(zoo: Zoo) throws {
        
        //2 error handling situation came to my mind.
        guard zoo.budget! >= 0 else {
            throw ZooBudgetError.debtSituation
        }
        
        var difference: Double = zoo.waterLimit! - zoo.dailyWaterConsumptionCalculate()
        guard difference >= 0 else {
            throw ZooBudgetError.droughtSituation
        }
    }
}
var zookeeper1 = Zookeeper(name: "Ömer Faruk Öztürk")
var zookeeper2 = Zookeeper(name: "Başıboş Yatan Birisi")

var animal1 = Animal(name: "Aslan", animalSound: "AAAAA", waterConsumption: 500)
var animal2 = Animal(name: "Kaplan", animalSound: "KKKKK", waterConsumption: 500, zookeeper: zookeeper1)
var animal3 = Animal(name: "Kartal", animalSound: "KKKKK", waterConsumption: 500, zookeeper: zookeeper1)
var animal4 = Animal(name: "Şahin", animalSound: "SSSSS", waterConsumption: 500, zookeeper: zookeeper1)
var animal5 = Animal(name: "Çita", animalSound: "CCCCC", waterConsumption: 500, zookeeper: zookeeper1)

zookeeper1.addAnimal(animal: animal1)


for i in zookeeper1.animalList {
    print(i.name!)
}

animal1.zookeeper?.name

var zoo1 = Zoo(budget: 10000, waterLimit: 2400, incomeInfo: 10000, expenseInfo: 2500)

zoo1.addZookeeperToZoo(zookeeper: zookeeper1)
zoo1.addZookeeperToZoo(zookeeper: zookeeper2)

var totalSalary = 0.0
for i in zoo1.allZookeeperList {
    totalSalary += i.salary!
}

zoo1.addIncomeExtra(add: 10_000)
zoo1.addExpenseExtra(add: 20_000)
zoo1.addExpenseExtra(add: 500)
zoo1.addIncomeExtra(add: 1_000)

var zookeeperStr = ""
for i in zoo1.allZookeeperList {
    zookeeperStr += ", \(i.name!)"
}

zookeeperStr.remove(at: zookeeperStr.index(zookeeperStr.startIndex, offsetBy: 0))

zoo1.addWater(add: 200)
zoo1.reduceWater(reduce: 0)

zoo1.isThisWaterShortage

do {
    try zoo1.ZooErrorFunc(zoo: zoo1)
    
    var waterStr = """

    Water

    \(zoo1.waterLimit!) -> water Tank
    \(zoo1.dailyWaterConsumptionCalculate()) -> daily Water
    \(zoo1.currentWaterTank) -> current Water Tank
        
    """
    
    print(waterStr)
    
    var str = """
    
    Current Budget: \(zoo1.budget!)
    
    All Zookeeper: \(zookeeperStr)
    
    """
    print(str)
} catch ZooBudgetError.debtSituation {
    
    var str = """
    
    !!!!!WARNING!!!!!

    \(totalSalary) --> Total Zookeeper Salary
    \(zoo1.incomeInfo!) --> Income
    \(zoo1.expenseInfo!) --> Expense

    \(zoo1.currentBudget) --> Current Budget
    """
    print(str)
} catch ZooBudgetError.droughtSituation {
    var waterStr = """

    !!!!!WARNING!!!!!
    
    Animals are in DANGER!!!
    Water tank: \(zoo1.waterLimit!)
    Daily Water Consumption: \(zoo1.dailyWaterConsumptionCalculate())
    You urgently need \(zoo1.currentWaterTank * -1) liters of water.
        
    """
    print(waterStr)
}
