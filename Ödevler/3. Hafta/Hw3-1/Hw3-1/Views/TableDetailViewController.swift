//
//  TableDetailViewController.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class TableDetailViewController: UIViewController {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var maritalLabel: UILabel!
    @IBOutlet weak var homecityLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var salaryLabel: UILabel!
    
    var employeeModel: Employee = Employee()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Detail Employee"
        
        self.configure(model: employeeModel)
        // Do any additional setup after loading the view.
    }
    
    func configure(model: Employee) {
        nameLabel.text = model.name!
        ageLabel.text = String(describing: model.age!)
        maritalLabel.text = model.maritalStatus?.rawValue
        homecityLabel.text = model.homeCity
        hometownLabel.text = model.hometown
        typeLabel.text = model.employeeType?.stringValue
        salaryLabel.text = String(describing: model.salary!)
    }

}
