//
//  BasicTableViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class BasicTableViewController: UIViewController {

    @IBOutlet weak var basicTable: UITableView!
    
    var itemToShow: [ItemModel] = []
    var items: [ItemModel] = []

    
    override func viewDidLoad() {
        super.viewDidLoad()

        basicTable.delegate = self
        basicTable.dataSource = self
        // Do any additional setup after loading the view.
        
        items.append(ItemModel(name: "Omer", count: 4))
        items.append(ItemModel(name: "Faruk", count: 5))
        items.append(ItemModel(name: "Ozturk", count: 6))
        
        title = "Search Bar"
        
        itemToShow = items
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.placeholder = "Type something"
        navigationItem.searchController = search
    }
}

extension BasicTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        print(text)
        items = itemToShow.filter({ $0.name.lowercased() == text.lowercased() })
        if text == "" {
            items = itemToShow
        }
        basicTable.reloadData()
    }
}

extension BasicTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

extension BasicTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "basicCell", for: indexPath)
        cell.textLabel?.text = "\(items[indexPath.row].name) -> \(items[indexPath.row].count)"
        
        return cell
    }
}
