//
//  AboutCompanyViewController.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class AboutCompanyViewController: UIViewController {
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var incomeInfoTextField: UITextField!
    @IBOutlet weak var expenseInfoTextField: UITextField!
    
    var appleCompany: Company = Company()
    var newEmployee: Employee = Employee()
    var allEmployee: [Employee] = []
    
    
    @IBOutlet weak var reduceBudgetButton: UIButton!
    @IBOutlet weak var allEmployeeSalary: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        var sum = 0.0
        for i in Company.employeeList {
            sum += i.salary ?? 0.0
        }
        print(sum)
        allEmployeeSalary.text! = String(sum)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "About Company"
        
        reduceBudgetButton.layer.cornerRadius = reduceBudgetButton.frame.height / 2
        
        appleCompany = Company(name: "Apple", foundationDate: "1976", budget: 1000, incomeInfo: 0, expenseInfo: 0)

        budgetLabel.text = String(describing: appleCompany.currentBudget)
        incomeInfoTextField.text = String(describing: appleCompany.incomeInfo!)
        expenseInfoTextField.text = String(describing: appleCompany.expenseInfo!)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "List Employee", style: .plain, target: self, action: #selector(listToEmployee))
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add Employee", style: .plain, target: self, action: #selector(addEmployee))
        
    }
    
    
    
    @objc func listToEmployee() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "listToEmployeeVC") as? ListToEmployeeViewController else { return }
//        vc.employees.append(newEmployee)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @objc func addEmployee() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addEmployeeVC") as? AddEmployeeViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @IBAction func reduceBudgetSalary(_ sender: Any) {
        
        if Double(allEmployeeSalary.text!)! == 0.0 {
            alert(title: "Warning", message: "No one works in the company!")
        }
        
        var budget = Double(budgetLabel.text!)!
        let allSalary = Double(allEmployeeSalary.text!)!
        budget -= allSalary
        
        if budget < 0 {
            alert(title: "The company is in debt", message: "But you have to pay the employees.")
        }
        
        budgetLabel.text = String(budget)
    }
    
    
    @IBAction func incomeAdd(_ sender: UIButton) {
        if let temp = Double(incomeInfoTextField.text!) {
            appleCompany.addIncomeExtra(add: temp)
            budgetLabel.text = String(describing: appleCompany.currentBudget)
            incomeInfoTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(incomeInfoTextField.text!)")
        }
    }
    
    @IBAction func expenseReduce(_ sender: UIButton) {
        if let temp = Double(expenseInfoTextField.text!) {
            appleCompany.addExpenseExtra(add: temp)
            budgetLabel.text = String(describing: appleCompany.currentBudget)
            if appleCompany.budget ?? 0.0 < 0 {
                alert(title: "WARNING!!!", message: "The company is in debt")
            }
            expenseInfoTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(expenseInfoTextField.text!)")
        }
    }
    
    func alert(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}

