//
//  AboutZooViewController.swift
//  Hw3-2
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class AboutZooViewController: UIViewController {
    
    
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var incomeTextField: UITextField!
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var extraWaterTextField: UITextField!
    @IBOutlet weak var minusWaterTextField: UITextField!
    
    @IBOutlet weak var zookeepersSalary: UILabel!
    @IBOutlet weak var reduceBudgetOutlet: UIButton!
    
    var zoo: ZooModel = ZooModel()
    
    @IBOutlet weak var calculateSalaryOutlet: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reduceBudgetOutlet.layer.cornerRadius = reduceBudgetOutlet.frame.height / 2
        calculateSalaryOutlet.layer.cornerRadius = calculateSalaryOutlet.frame.height / 2
        
        zoo = ZooModel()
        budgetLabel.text! = String(ZooModel.budget!)
        waterLabel.text! = String(ZooModel.waterLimit!)
        zookeepersSalary.text = String(describing: ZooModel.allZookeeperSalary!)
        
        print(waterLabel.text!)
        calculateSalaryOutlet.isEnabled = true
    }
    
    @IBAction func incomeAdd(_ sender: Any) {
        if let temp = Double(incomeTextField.text!) {
            ZooModel.budget! += temp
            budgetLabel.text = String(describing: ZooModel.budget!)
            incomeTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(incomeTextField.text!)")
        }
    }
    
    @IBAction func expenseReduce(_ sender: Any) {
        if let temp = Double(expenseTextField.text!) {
            ZooModel.budget! -= temp
            budgetLabel.text = String(describing: ZooModel.budget!)
            expenseTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(expenseTextField.text!)")
        }
    }
    
    @IBAction func waterAdd(_ sender: Any) {
        if let temp = Double(extraWaterTextField.text!) {
            ZooModel.waterLimit! += temp
            waterLabel.text = String(describing: zoo.currentWaterTank)
            extraWaterTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(extraWaterTextField.text!)")
        }
    }
    
    @IBAction func waterReduce(_ sender: Any) {
        if let temp = Double(minusWaterTextField.text!) {
            ZooModel.waterLimit! -= temp
            waterLabel.text = String(describing: zoo.currentWaterTank)
            minusWaterTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(minusWaterTextField.text!)")
        }
    }
    
    
    @IBAction func calculateSalary(_ sender: Any) {
        var temp = 0.0
        for i in ZooModel.allZookeeperList {
            print(i.salary!)
            temp += i.salary!
        }
        ZooModel.allZookeeperSalary! = temp
        zookeepersSalary.text = String(describing: ZooModel.allZookeeperSalary!)
        calculateSalaryOutlet.isEnabled = false
    }
    
    @IBAction func reduceBudget(_ sender: Any) {
        ZooModel.budget! -= ZooModel.allZookeeperSalary!
        if ZooModel.budget! < 0 {
            alert(title: "Warning", message: "Even if you die of debt, you have to give your employee his money.")
        }
        budgetLabel.text = String(describing: ZooModel.budget!)
    }
    
    
    @IBAction func AddPage(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addPageVC") as? AddPageViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ListAnimals(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "listAnimalVC") as? ListAnimalViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func ListZookepers(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "listZookeeperVC") as? ListZookeeperViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
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
