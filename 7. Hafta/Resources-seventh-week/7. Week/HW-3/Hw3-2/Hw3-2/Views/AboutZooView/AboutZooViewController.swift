//
//  AboutZooViewController.swift
//  Hw3-2
//
//    
//

import UIKit

final class AboutZooViewController: UIViewController {
    
    @IBOutlet private weak var budgetLabel: UILabel!
    @IBOutlet private weak var incomeTextField: UITextField!
    @IBOutlet private weak var expenseTextField: UITextField!
    @IBOutlet private weak var waterLabel: UILabel!
    @IBOutlet private weak var extraWaterTextField: UITextField!
    @IBOutlet private weak var minusWaterTextField: UITextField!
    @IBOutlet private weak var zookeepersSalary: UILabel!
    @IBOutlet private weak var reduceBudgetOutlet: UIButton!
    @IBOutlet private weak var calculateSalaryOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reduceBudgetOutlet.layer.cornerRadius = reduceBudgetOutlet.frame.height / 2
        calculateSalaryOutlet.layer.cornerRadius = calculateSalaryOutlet.frame.height / 2
        
        calculateSalaryOutlet.isEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        budgetLabel.text! = String(ZooModel.shared.budget!)
        waterLabel.text! = String(ZooModel.shared.waterLimit!)
        zookeepersSalary.text = String(describing: ZooModel.shared.allZookeeperSalary!)
        print(waterLabel.text!)
    }
    
    @IBAction private func incomeAdd(_ sender: Any) {
        if let temp = Double(incomeTextField.text ?? "") {
            ZooModel.shared.budget! += temp
            budgetLabel.text = String(describing: ZooModel.shared.budget!)
            incomeTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(incomeTextField.text!)")
        }
    }
    
    @IBAction private func expenseReduce(_ sender: Any) {
        if let temp = Double(expenseTextField.text ?? "") {
            ZooModel.shared.budget! -= temp
            budgetLabel.text = String(describing: ZooModel.shared.budget!)
            expenseTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(expenseTextField.text!)")
        }
    }
    
    @IBAction private func waterAdd(_ sender: Any) {
        if let temp = Double(extraWaterTextField.text!) {
            ZooModel.shared.waterLimit! += temp
            waterLabel.text = String(describing: ZooModel.shared.currentWaterTank)
            extraWaterTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(extraWaterTextField.text!)")
        }
    }
    
    @IBAction private func waterReduce(_ sender: Any) {
        if let temp = Double(minusWaterTextField.text!) {
            ZooModel.shared.waterLimit! -= temp
            waterLabel.text = String(describing: ZooModel.shared.currentWaterTank)
            minusWaterTextField.text = ""
        } else {
            alert(title: "You must enter a number", message: "Not a valid number: \(minusWaterTextField.text!)")
        }
    }
    
    
    @IBAction private func calculateSalary(_ sender: Any) {
        var temp = 0.0
        for zooKeeper in ZooModel.shared.allZookeeperList {
            print(zooKeeper.salary!)
            temp += zooKeeper.salary!
        }
        ZooModel.shared.allZookeeperSalary! = temp
        zookeepersSalary.text = String(describing: ZooModel.shared.allZookeeperSalary!)
        calculateSalaryOutlet.isEnabled = false
    }
    
    @IBAction private func reduceBudget(_ sender: Any) {
        ZooModel.shared.budget! -= ZooModel.shared.allZookeeperSalary!
        if ZooModel.shared.budget! < 0 {
            alert(title: "Warning", message: "Even if you die of debt, you have to give your employee his money.")
        }
        budgetLabel.text = String(describing: ZooModel.shared.budget!)
    }
    
    
    @IBAction private func addPage(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "addPageVC") as? AddPageViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func listAnimals(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "listAnimalVC") as? ListAnimalViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction private func listZookepers(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "listZookeeperVC") as? ListZookeeperViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    private func alert(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
