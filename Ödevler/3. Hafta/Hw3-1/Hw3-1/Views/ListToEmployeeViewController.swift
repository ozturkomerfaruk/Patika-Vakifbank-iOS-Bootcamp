//
//  ListToEmployeeViewController.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class ListToEmployeeViewController: UIViewController {
    
      
    @IBOutlet weak var listEmployeeTable: UITableView!
    
    var employeeToShow: [Employee] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Find Someone"
        navigationItem.searchController = search
        
        title = "List Employee"
        listEmployeeTable.delegate = self
        listEmployeeTable.dataSource = self

        listEmployeeTable.register(UINib.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addEmployee))
        
        employeeToShow = Company.employeeList
    }
    
    @objc func addEmployee() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addEmployeeVC") as? AddEmployeeViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ListToEmployeeViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        Company.employeeList = employeeToShow.filter({ $0.name?.lowercased() == text.lowercased() })
        if text == "" {
            Company.employeeList = employeeToShow
        }
        listEmployeeTable.reloadData()
    }
}

extension ListToEmployeeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailTableVC") as? TableDetailViewController else { return }
        vc.employeeModel = Company.employeeList[indexPath.row ]
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension ListToEmployeeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Company.employeeList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        cell.configure(model: Company.employeeList[indexPath.row])
        return cell
    }

}
