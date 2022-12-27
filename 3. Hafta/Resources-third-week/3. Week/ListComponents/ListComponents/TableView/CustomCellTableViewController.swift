//
//  CustomCellTableViewController.swift
//  ListComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class CustomCellTableViewController: UIViewController {
    
    @IBOutlet weak var itemsTableView: UITableView!
    var items: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        items.append(ItemModel(name: "Pencil", count: 1))
        items.append(ItemModel(name: "Eraser", count: 2))
        items.append(ItemModel(name: "Pen", count: 3))
        items.append(ItemModel(name: "Notbook", count: 4))
        
        itemsTableView.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
    }
}

extension CustomCellTableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? ItemTableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = items[indexPath.row].name
        cell.countLabel.text = String(items[indexPath.row].count)
        return cell
    }
}

extension CustomCellTableViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row selected \(items[indexPath.row])")
    }
}
