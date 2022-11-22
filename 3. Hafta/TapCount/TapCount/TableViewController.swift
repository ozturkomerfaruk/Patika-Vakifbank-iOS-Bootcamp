//
//  TableViewController.swift
//  TapCount
//
//  Created by Ömer Faruk Öztürk on 21.11.2022.
//

import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        PlayViewController.keychainDecode!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath)
        
        for i in PlayViewController.keychainDecode! {
            cell.textLabel?.text = i.key + " --> " + "\(i.value)"
        }
        
        return cell
    }
    
    
   
}
