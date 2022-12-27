//
//  EmployeeListViewController.swift
//  CompanyManagementApp
//
//   
//

import UIKit

final class EmployeeListViewController: UIViewController {

    @IBOutlet private weak var employeeListTableView: UITableView!
    var company: Company?
    private var employees = [Employee]()
    private var searchedEmployees = [Employee]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        employeeListTableView.delegate      = self
        employeeListTableView.dataSource    = self
        navigationController?.navigationBar.isHidden = false
        
        employeeListTableView.register(UINib(nibName: "EmployeeListTableViewCell", bundle: nil), forCellReuseIdentifier: "employeeCell")
        configureEmployeeSearchController()
        
        if let employees = company?.employees {
            self.employees = employees
            searchedEmployees = self.employees
        }
        
    }
    
    private func configureEmployeeSearchController() {
        let employeeSearchController = UISearchController(searchResultsController: nil)
        employeeSearchController.searchResultsUpdater = self
        employeeSearchController.searchBar.placeholder = "Type an employee name to search."
        navigationItem.searchController = employeeSearchController
    }
    
}


extension EmployeeListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchedEmployees.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = employeeListTableView.dequeueReusableCell(withIdentifier: "employeeCell", for: indexPath) as? EmployeeListTableViewCell else { return UITableViewCell() }
        let employee = searchedEmployees[indexPath.row]
        cell.salaryLabel.text          = "\(employee.salary.formattedWithSeparator)₺"
        cell.ageLabel.text             = "\(employee.age)"
        cell.maritalStatusLabel.text   = "\(employee.maritalStatus)"
        cell.idLabel.text              = "\(employee.id)"
        cell.nameLabel.text            = "\(employee.name)"
        cell.titleLabel.text           = "\(employee.title)"
        return cell
    }
}

extension EmployeeListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        searchedEmployees = employees.filter { $0.name.lowercased().contains(text.lowercased()) }
        if text == "" {
            searchedEmployees = employees
        }
        employeeListTableView.reloadData()
    }
}
