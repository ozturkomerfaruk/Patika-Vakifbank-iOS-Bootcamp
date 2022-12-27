//
//  CompanyDetailViewController.swift
//  CompanyManagementApp
//
//   
//

import UIKit

final class CompanyDetailViewController: UIViewController {

    @IBOutlet private weak var logoImageView: UIImageView!
    @IBOutlet private weak var companyNameLabel: UILabel!
    @IBOutlet private weak var establishmentYearLabel: UILabel!
    @IBOutlet private weak var budgetLabel: UILabel!
    @IBOutlet private weak var employeeCountLabel: UILabel!
    @IBOutlet private weak var totalSalariesLabel: UILabel!
    @IBOutlet private weak var incomeExpenseTextField: UITextField!
    var company: Company?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        moveViewWithKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction private func paySalariesButtonClicked(_ sender: Any) {
        guard let company = company else { return }
        company.paySalary(completion: { message in
            alert(titleInput: "Alert", messageInput: message)
            reloadData()
        })
    }
    
    @IBAction private func addNewEmployeeButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toAddNewEmployee", sender: nil)
    }
    
    @IBAction private func showEmployeeListButtonClicked(_ sender: Any) {
        performSegue(withIdentifier: "toEmployeeList", sender: nil)
    }
    
    @IBAction private func addIncomeButtonClicked(_ sender: Any) {
        guard let company = company,
              let income = incomeExpenseTextField.text,
              let incomeDouble = Double(income),
              income != ""
        else {
            alert(titleInput: "Alert", messageInput: "Please make sure you enter a value. The value you enter must be numeric.")
            return
        }
        company.addIncome(amount: incomeDouble)
        reloadData()
    }
    
    
    @IBAction private func addExpenseButtonClicked(_ sender: Any) {
        guard let company = company,
              let expense = incomeExpenseTextField.text,
              let expenseDouble = Double(expense),
              expense != ""
        else {
            alert(titleInput: "Alert", messageInput: "Please make sure you enter a value. The value you enter must be numeric.")
            return
        }
        company.addExpense(amount: expenseDouble, completion: { error in
            if let error = error {
                alert(titleInput: "Alert", messageInput: error)
            }
        })
        reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddNewEmployee" {
            let employeeAddVC = segue.destination as? EmployeeAddViewController
            employeeAddVC?.company = company
        }
        
        if segue.identifier == "toEmployeeList" {
            let employeeListVC = segue.destination as? EmployeeListViewController
            employeeListVC?.company = company
        }
    }
    
    
    private func reloadData() {
        if let company = company {
            logoImageView.image = company.logo
            companyNameLabel.text = company.companyName
            establishmentYearLabel.text = "\(company.establishmentYear)"
            budgetLabel.text = "\(company.budget.formattedWithSeparator)₺"
            employeeCountLabel.text = "\(company.employees?.count ?? 0)"
            totalSalariesLabel.text = "\(company.totalSalary.formattedWithSeparator)₺"
        }
    }
}


