//
//  ListZookeeperViewController.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class ListZookeeperViewController: UIViewController {
    
    
    @IBOutlet weak var zookeeperTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        zookeeperTableView.delegate = self
        zookeeperTableView.dataSource = self
        
        zookeeperTableView.register(UINib.init(nibName: "ZookeeperCustomCell", bundle: nil), forCellReuseIdentifier: "zookeeperCustomCell")
    }
}

extension ListZookeeperViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let str = """
        Hayvan Sayısı: \(ZooModel.allZookeeperList[indexPath.row].animalList.count)
        Salary: \(String(describing: ZooModel.allZookeeperList[indexPath.row].salary!))
        Name: \(ZooModel.allZookeeperList[indexPath.row].name!)
        """
        print(str)
    }

}

extension ListZookeeperViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ZooModel.allZookeeperList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "zookeeperCustomCell", for: indexPath) as! ZookeeperCustomCell
        cell.configure(model: ZooModel.allZookeeperList[indexPath.row])
        return cell
    }

}
