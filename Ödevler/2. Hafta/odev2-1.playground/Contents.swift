import Cocoa
///Şirketimizin isim, çalışan, bütçe, kuruluş yılı olacak
///Şirketimize playground arayüzünden gelir ekleyip gider çıkışı sağlayabilmeliyim.
///Şirkete çalışan ekleyebilmeliyim.
///Çalışanlar için en az isim, yaş, medeni hal tutulmalı.
///En az 3 çalışan tipi olmalı. Jr. Mid. Sr. gibi
///Çalışanların maaşları yaş ve tip arasında bir formül belirleyerek hesaplanmalı. yaş * tip_katsayısı * 1000 gibi
///Şirketimin maaş ödemesini yapan bir metodu olmalı.
///Ödenen maaşlar bütçeden düşmeli
///Maaş ödemesi yapıldıktan sonra yazılım bana ekstra yapabileceğim komutlara izin vermeli.
///Protocol, closure, optional kullanımı zorunludur.

//MARK: ENUMS
//Enum that determines salary order by employee type
enum EmployeeTypeEnum: Double {
    case junior = 5_000.0
    case midLevel = 10_000.0
    case senior = 20_000.0
}

//Enum that determines salary order by marital status (if married, 2500 liras more 🤓)
enum MaritalStatusEnum: String {
    case bachelor = "Bachelor"
    case married = "Married"
}

//MARK: Employee
//The class that contains the employee's information.
class Employee {
    var name: String?
    var age: Int?
    var maritalStatus: MaritalStatusEnum?
    var homeCity: String?
    var hometown: String?
    var salary: Double?
    
    //Exponentially increasing salary in certain age ranges and extra salary if married.
    var employeeType: EmployeeTypeEnum? {
        get {
            return .junior
        }
        set {
            if let age = self.age {
                if age < 20 {
                    self.salary = 0
                } else if age < 30 && age >= 20 {
                    self.salary = (newValue?.rawValue ?? 0) * 1
                } else if age < 40 && age >= 30 {
                    self.salary = ((newValue?.rawValue ?? 0)) * 2
                } else if age < 50 && age >= 40 {
                    self.salary = ((newValue?.rawValue ?? 0)) * 3
                } else if age < 60 && age >= 50 {
                    self.salary = ((newValue?.rawValue ?? 0)) * 4
                } else {
                    self.salary = 0
                }
            }
            if let maritalStatus = self.maritalStatus {
                if maritalStatus == .married {
                    self.salary! += 2500
                }
            }
            
        }
    }
    
    //initialize method
    init(name: String, age: Int, maritalStatus: MaritalStatusEnum, homeCity: String, hometown: String, employeeType: EmployeeTypeEnum) {
        self.name = name
        self.age = age
        self.maritalStatus = maritalStatus
        self.homeCity = homeCity
        self.hometown = hometown
        self.employeeType = employeeType
    }
}

//MARK: Protocol Company
//external control of the company's budget with a protocol
protocol CompanyProtocol {
    var budget: Double? { get set }
    var incomeInfo: Double? { get set }
    var expenseInfo: Double? { get set }
    
    func balanceOfIncomeAndExpense() -> Double
}

//MARK: Error Handling For Company
//Error Handling by budget deficit
enum CompanyBudgetError: Error {
    case debtSituation
    case unknownError
}

//The class that contains the Company's information.
class Company: CompanyProtocol {
    var budget: Double?
    var incomeInfo: Double?
    var expenseInfo: Double?
    
    var companyName: String?
    var foundationDate: String?
    var employeeList: [Employee] = [Employee]()
    
    //initialize method
    init(name: String, foundationDate: String, budget: Double, incomeInfo: Double, expenseInfo: Double) {
        self.companyName = name
        self.foundationDate = foundationDate
        self.budget = budget
        self.incomeInfo = incomeInfo
        self.expenseInfo = expenseInfo
    }
    
    //If an external employee is wanted to be added
    func addEmployee(employee: Employee) {
        employeeList.insert(employee, at: 0)
    }
    
    //If you want to see what the balance between income and expense is
    func balanceOfIncomeAndExpense() -> Double {
        var totalSalary = 0.0
        for i in employeeList {
            totalSalary += (i.salary ?? 0)
        }
        self.expenseInfo! += totalSalary
        var balance = self.incomeInfo! - self.expenseInfo!
        return balance
    }
    
    //Even if the budget is a negative value, the employee must be given his due. This is the work of the employee. Therefore, if the budget is negative, I did not want to make a mistake directly. If the business owner wants to control their budget and there is a negative value in the budget, I just wanted to suppress it.
    var currentBudget: Double {
        self.budget! += self.incomeInfo!
        self.budget! -= self.expenseInfo!
        
        return budget!
    }
    
    //If you want to add income externally
    func addIncomeExtra(add: Double) {
        self.budget! += add
    }
    
    //If you want to add an expense externally
    func addExpenseExtra(add: Double) {
        self.budget! -= add
    }
    
    //Location of Error
    func companyErrorFunc(budget: Double, incomeInfo: Double, expenseInfo: Double) throws {
//        if budget + incomeInfo < budget - expenseInfo {
//            throw CompanyBudgetError.debtSituation
//        }
        
        //1 error handling situation came to my mind.
        guard budget >= 0 else {
            throw CompanyBudgetError.debtSituation
        }
    }
}

//Adding 3 employee

let employee1 = Employee(name: "Ömer", age: 24, maritalStatus: .married, homeCity: "Eskişehir", hometown: "Ankara", employeeType: .junior)
let employee2 = Employee(name: "Yahya", age: 22, maritalStatus: .bachelor, homeCity: "Eskişehir", hometown: "Karaman", employeeType: .midLevel)
let employee3 = Employee(name: "Fatih", age: 24, maritalStatus: .bachelor, homeCity: "Eskişehir", hometown: "Konya", employeeType: .junior)

//Adding 1 company

///Normally, when calculating expenses, many factors such as electricity, water and internet would have to be calculated and written, but I calculated that they are prepared in a separate class and are entered directly here.
///In addition to the expenses, the employee's salaries are added.
///If there is income, it reflects positively on the budget.

let company1 = Company(name: "Apple", foundationDate: "1976", budget: 1000, incomeInfo: 500, expenseInfo: 1000)

//3 employees are added to the company.

company1.addEmployee(employee: employee1)
company1.addEmployee(employee: employee2)
company1.addEmployee(employee: employee3)

//Values are checked.

var total = 0.0
for i in company1.employeeList {
    total += i.salary!
}
print("All Employee Salary Total: \(total)")

print("Income: \(company1.incomeInfo!) & Expense: \(company1.expenseInfo!)")

let incomeExpense = company1.balanceOfIncomeAndExpense()
print("Balance of income & expense: \(incomeExpense)")

company1.addIncomeExtra(add: 22000)
company1.addExpenseExtra(add: 1000)

print("Current Budget: \(company1.currentBudget)")
do {
    try company1.companyErrorFunc(budget: company1.budget!, incomeInfo: company1.incomeInfo!, expenseInfo: company1.expenseInfo!)
} catch CompanyBudgetError.debtSituation {
    var debtInfo = """
    
    !!!!!WARNING!!!!!
    
    Budget: \(String(describing: company1.budget!))
    Income: \(String(describing: company1.incomeInfo!))
    Expense: \(String(describing: company1.expenseInfo!))
    
    Debt: \(String(describing: company1.budget!))
    """
    print(debtInfo)
}
