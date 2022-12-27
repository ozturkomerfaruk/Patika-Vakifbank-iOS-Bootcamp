// MARK: - AÇIKLAMA

// CompanyManagementApp.playgorund, şirket ismi, kuruluş yılı, bütçe ve varsa çalışan parametreleriyle şirket oluşturduğumuz bir playground dosyasıdır. Kurduğumuz şirkete ister kuruluşta ister daha sonrasında çalışan eklenebilir veya çıkarılabilir, bütçeye gelir & gider eklenebilir ve bütçeden maaşlar ödenebilir.

// Şirket kuruluşunda çalışan eklemek optional'dır (default değeri nil). Eğer şirket, çalışanlar ile oluşturulacaksa Company class'ı initilize edilmeden önce Employee class'ından çalışanları barındıran bir array oluşturulmalıdır. Bu array Company class'ının initializer'ında parametre olarak kullanılacaktır.

// Eğer şirket çalışansız oluşturulacaksa Company class'ı initializer'ında employees parametresi kullanılmamalıdır.
// Çalışanlar sonradan hireEmployee fonksiyonu ile eklenebilir. Çalışan eklerken id'nin farklı olması gerekmektedir. Eğer aynı id'li çalışan eklenmeye çalışılırsa uyarı alınacaktır ve çalışan oluşturulamayacaktır.

// Çalışan çıkarılmak istenirse fireEmployee fonksiyonuna çalışan ismi(case insensitive) ve çalışan id'si verilmelidir.

// paySalary fonksiyonu ile çalışan maaşları ödenir. Completion'ında Employee array döner. Bu array'den maaşlar ödendikten sonra kime ne kadar maaş ödenmiş gibi bilgiler öğrenilebilir.
// addIncome fonksiyonu ile bütçeye gelir, addExpense ile bütçeye gider eklenebilir.

// SUCCESS MESSAGES:
// Şirket oluştuğunda: "\(name) Company is created in \(year) with \(employees?.count ?? 0) employee(s) and the budget of \(budget)₺"
// Çalışan çıkarıldığında: "\(employee.name) with id: \(employee.id) is fired."
// Çalışan eklendiğinde: "Employee \(name) is hired."
// Gelir eklendiğinde: "Income is added. Previos budget: \(previousBudget)₺, new budget: \(budget)₺"
// Gider eklendiğinde: "Expense is added. Previos budget: \(previousBudget)₺, new budget: \(budget)₺"
// Maaşlar ödendiğinde: "\(totalSalary)₺ employee salaries are paid. Remaining budget: \(budget)₺."

// FAILURE MESSAGES:
// Çalışan yokken çalışan çıkarmak istendiğinde: "There is no employee to fire."
// Çalışan çıkarılırken verilen parametrelere uyan çalışan yoksa: "There is no \(name) with id: \(id) employee to fire."
// Yeni çalışan eklenirken mevcut çalışana ait bir id denendiğinde: "There is already an employee with id: \(employeeId). Please try another id."
// Bütçede yeterli tutar yokken expense girilmek istendiğinde: "There is not enough money to pay expense. Please add income to budget case."
// Çalışan maaşları ödenmek istendiğinde yeterli bütçe yoksa: "There is not enough money to pay salaries. Please add income to budget case."
// Çalışan yokken çalışan maaşı ödenmek istendiğinde: "There is no employee to pay salary."

import Foundation

// MaritalStatus Bool rawValue'lu enum oluşturabilmek için Bool extention'ı.
extension Bool: ExpressibleByIntegerLiteral {
    public init(integerLiteral value: Int) {
        self = value != 0
    }
}

// CompanyCreation işlemi yapacak class'larda uygulanması gereken fonksiyonlar
protocol CompanyCreator {
    func hireEmployee(name: String, age: Int, maritalStatus: MaritalStatus, title: EmployeeType, employeeId: Int)
    func fireEmployee(employeeName name: String, employeeId id: Int)
    func addIncome(amount: Double)
    func addExpense(amount: Double)
    func paySalary(completion: ([Employee]) -> ())
}

// Çalışan title'ları enum'ı
enum EmployeeType: Double {
    case junior     = 1
    case midLevel   = 1.5
    case senior     = 2
    case lead       = 2.5
    case manager    = 3
}

// Medeni hal enum'ı
enum MaritalStatus: Bool {
    case married    = true
    case single     = false
}

// Çalışan class'ı
class Employee {
    var name: String
    var age: Int
    var id: Int
    var maritalStatus: MaritalStatus
    var title: EmployeeType
    var salary: Double {
        ((Double(age) / 100.0) + 1.0) * title.rawValue * 12_000
    }
    
    init(name: String, age: Int, maritalSatatus: MaritalStatus, title: EmployeeType, employeeId id: Int) {
        self.name           = name
        self.age            = age
        self.maritalStatus  = maritalSatatus
        self.title          = title
        self.id             = id
    }
}

// Şirket Class'ı
class Company: CompanyCreator {
    private var companyName: String
    private var budget: Double
    private var establishmentYear: Int
    private var employees: [Employee]?
    
    // Initializer'da employees array optional'dır. Default olarak nil tanımlanmıştır.
    init(companyName name: String, companyBudget budget: Double, establishmentYear year: Int, employees: [Employee]? = nil) {
        self.companyName        = name
        self.budget             = budget
        self.establishmentYear  = year
        self.employees          = employees
        print("\(name) Company is created in \(year) with \(employees?.count ?? 0) employee(s) and the budget of \(budget)₺")
    }
    
    // Isim ve id ile çalışan çıkarma fonksiyonu
    func fireEmployee(employeeName name: String, employeeId id: Int) {
        // employees array'inin oluşturulup oluşturulmadığı ve boş olup olmadığını kontrol ediyoruz
        guard var employees = employees, !employees.isEmpty else {
            print("There is no employee to fire.")
            return
        }
        
        var employeeFound = false
        
        for (index, employee) in employees.enumerated() {
            // Çalışan çıkarılırken aratılan isim ve id'nin mevcut çalışanlarda olup olmadığı kontrolü
            if name.lowercased() == employee.name.lowercased() && employee.id == id {
                employees.remove(at: index)
                self.employees = employees
                print("\(employee.name) with id: \(employee.id) is fired.")
                employeeFound = true
                break
            }
        }
        
        if !employeeFound {
            print("There is no \(name) with id: \(id) employee to fire.")
        } else {
            employeeFound = false
        }
    }
    
    
    func hireEmployee(name: String, age: Int, maritalStatus: MaritalStatus, title: EmployeeType, employeeId: Int) {
        var employee = Employee(name: name, age: age, maritalSatatus: maritalStatus, title: title, employeeId: employeeId)
        var idCheck = true
        
        if var employees = employees {
            // Çalışan eklenirken, eklemek istenen id'ye sahip daha önce bir çalışan olup olmadığı kontrolü.
            employees.forEach{
                if $0.id == employeeId {
                    print("There is already an employee with id: \(employeeId). Please try another id.")
                    idCheck = false
                    return
                }
            }
            // eğer eklenen id'li çalışan varsa fonksiyonu devam ettirmemek için guard
            guard idCheck else { return }
            
            employees.append(employee)
            self.employees = employees
        } else {
            var employees = [Employee]()
            employees.append(employee)
            self.employees = employees
        }
        
        print("Employee \(name) is hired.")
    }
    
    // gelir eklemek için kullanılır
    func addIncome(amount: Double) {
        var previousBudget  = budget
        budget             += amount
        print("Income is added. Previos budget: \(previousBudget)₺, new budget: \(budget)₺")
    }
    
    // gider eklemek için kullanılır
    func addExpense(amount: Double) {
        // eğer budget'da yeterli para yoksa uyarı verir ve gider oluşmaz.
        if budget >= amount {
            var previousBudget  = budget
            budget             -= amount
            print("Expense is added. Previos budget: \(previousBudget)₺, new budget: \(budget)₺")
        } else {
            print("There is not enough money to pay expense. Please add income to budget case.")
        }
    }
    
    
    func paySalary(completion: ([Employee]) -> () = {_ in }) { // Closure ✅
        if let employees = employees, !employees.isEmpty{
            var totalSalary: Double = 0
            employees.forEach{ totalSalary += $0.salary }
            
            if budget >= totalSalary {
                budget -= totalSalary
                print("\(totalSalary)₺ employee salaries are paid. Remaining budget: \(budget)₺.")
            } else {
                // eğer budget'da maaşlar için yeterli para yoksa uyarı verir ve gider oluşmaz.
                print("There is not enough money to pay salaries. Please add income to budget case.")
            }
            // maaş ödemesi sonrası hangi çalışana ne kadar maaş ödendi gibi bilgileri alabilmek için completion
            completion(employees)
        } else {
            print("There is no employee to pay salary.")
        }
    }
}


// MARK: - Case1
// Şirket kuruluşu öncesinde 2 çalışanı belli olan bir şirket kuruyoruz. Çalışanları önden Employee class'ından oluşturuyoruz. Çalışanları bir array'de toplayarak Company class'ının initializer'ına parameter olarak veriyoruz.

let employee1       = Employee(name: "Kaan", age: 28, maritalSatatus: .married, title: .junior, employeeId: 1)
let employee2       = Employee(name: "Feyyaz", age: 30, maritalSatatus: .single, title: .senior, employeeId: 2)
var employeeList    = [employee1, employee2]
let firstCompany       = Company(companyName: "Patika", companyBudget: 1_000_000, establishmentYear: 2022, employees: employeeList)
firstCompany.addIncome(amount: 100_000)
firstCompany.addExpense(amount: 50_000)
firstCompany.paySalary()
firstCompany.addIncome(amount: 200_000)
firstCompany.hireEmployee(name: "Ayşe", age: 29, maritalStatus: .single, title: .midLevel, employeeId: 3)

// Maaş ödendikten sonra completion block çalışan array'i döndürüyor. Bu array'den eğer istersek maaş ödendikten sonra çalışan bilgilerini alabiliyoruz.
firstCompany.paySalary { employees in
    employees.forEach{
        print("\($0.name) is \($0.age) years old, \($0.maritalStatus), \($0.title) type employee. His/her salary is \($0.salary)₺.")
    }
}

print("\n")

// MARK: - Case2
// Şirket çalışansız olarak kurularak ticari faaliyetlerine başlar. Daha sonra para kazandıkça çalışan alımı yapar. Company class'ının initializer'ında employee array optional ve default nil olduğu için employee bilgisi vermeden şirket kurulumunu tamamlayabiliyoruz.

let secondCompany = Company(companyName: "Kodluyoruz", companyBudget: 500_000, establishmentYear: 2022)
secondCompany.addExpense(amount: 200_000)
secondCompany.addIncome(amount: 500_000)
secondCompany.paySalary()
secondCompany.fireEmployee(employeeName: "ayşe", employeeId: 5)
secondCompany.hireEmployee(name: "Kaan", age: 28, maritalStatus: .married, title: .junior, employeeId: 1)
secondCompany.fireEmployee(employeeName: "kaan", employeeId: 1)
secondCompany.fireEmployee(employeeName: "kaan", employeeId: 1)
secondCompany.hireEmployee(name: "Burak", age: 27, maritalStatus: .single, title: .junior, employeeId: 1)
secondCompany.hireEmployee(name: "Veli", age: 27, maritalStatus: .single, title: .junior, employeeId: 2)
secondCompany.addIncome(amount: 50_000)
secondCompany.paySalary()
secondCompany.addExpense(amount: 30_000)
secondCompany.fireEmployee(employeeName: "ali", employeeId: 8)
secondCompany.fireEmployee(employeeName: "veli", employeeId: 2)
secondCompany.paySalary()
secondCompany.hireEmployee(name: "Osman", age: 30, maritalStatus: .single, title: .senior, employeeId: 3)

// Maaş ödendikten sonra completion block çalışan array'i döndürüyor. Bu array'den eğer istersek maaş ödendikten sonra çalışan bilgilerini alabiliyoruz.
secondCompany.paySalary { employees in
    employees.forEach{
        print("\($0.name) is \($0.age) years old, \($0.maritalStatus), \($0.title) type employee. His/her salary is \($0.salary)₺.")
    }
}
