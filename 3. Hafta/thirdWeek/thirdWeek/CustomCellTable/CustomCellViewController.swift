//
//  CustomCellViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class CustomCellViewController: UIViewController {
    
    @IBOutlet weak var customCellTable: UITableView!
    
    
    var items: [ItemModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customCellTable.dataSource = self
        customCellTable.delegate = self
        
        items.append(ItemModel(name: "Ömer", count: 4))
        items.append(ItemModel(name: "Faruk", count: 5))
        items.append(ItemModel(name: "Öztürk", count: 6))
        
        customCellTable.register(UINib.init(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        //farzedelim ki bir tane daha cell var. Guard let kullanıcaz.
    }
}

extension CustomCellViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as? TableViewCell else {
            return UITableViewCell()
        }
        cell.nameLabel.text = items[indexPath.row].name
        cell.countLabel.text = String(items[indexPath.row].count)
        return cell
    }
}

extension CustomCellViewController: UITableViewDelegate {
    
}
