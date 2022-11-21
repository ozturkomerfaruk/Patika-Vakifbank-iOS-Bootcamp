//
//  AddEmployeeViewController.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit

class AddEmployeeViewController: UIViewController {
    
    @IBOutlet weak var tFieldName: UITextField!
    @IBOutlet weak var tFieldAge: UITextField!
    @IBOutlet weak var tFieldHomeCity: UITextField!
    @IBOutlet weak var tFieldHometown: UITextField!
    var maritalStatus = ""
    
    
    @IBOutlet weak var currentSalaryLabel: UILabel!
    
    
    //For Animation to DropDown
    @IBOutlet weak var selectTypeOutlet: UIButton!
    @IBOutlet var pressedCollection: [UIButton]!
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Add Employee Page"
        
        selectTypeOutlet.layer.cornerRadius = selectTypeOutlet.frame.height / 2
        pressedCollection.forEach {
            btn in
            btn.layer.cornerRadius = btn.frame.height / 2
            btn.isHidden = true
            btn.alpha = 0
        }
        
    }
    
    //For Drop Down Menu
    
    @IBAction func selectType(_ sender: UIButton) {
        pressedCollection.forEach {
            btn in
            UIView.animate(withDuration: 0.8) {
                btn.isHidden = !btn.isHidden
                btn.alpha = btn.alpha == 0 ? 1 : 0
                btn.layoutIfNeeded()
                self.currentSalaryLabel.text! = "0"
            }
        }
    }
    
    @IBAction func pressedType(_ sender: UIButton) {
        
        if let btn = sender.titleLabel?.text {
            selectTypeOutlet.setTitle(btn, for: .normal)
            pressedCollection.forEach {
                btn in
                UIView.animate(withDuration: 0.8) {
                    btn.isHidden = true
                    btn.alpha = 0
                }
            }
            switch btn {
            case "Junior":
                currentSalaryLabel.text! = String( Double(currentSalaryLabel.text!)! + 5000)
            case "Mid-Level":
                currentSalaryLabel.text! = String(Double(currentSalaryLabel.text!)! + 10000)
            case "Senior":
                currentSalaryLabel.text! = String(Double(currentSalaryLabel.text!)! + 20000)
            default:
                currentSalaryLabel.text! = ""
            }
        }
        
    }
    
    @IBAction func segmentMaritalStatus(_ sender: Any) {
        let val = (sender as! UISegmentedControl).selectedSegmentIndex
        maritalStatus = val == 0 ? "Bachelor" : "Married"
        var temp = 0.0
        if val == 0 {
            currentSalaryLabel.text = "0"
        } else {
            temp += 2500
            currentSalaryLabel.text! = String(Double(currentSalaryLabel.text!)! + temp)
        }
    }
    
    
    @IBAction func SaveEmployee(_ sender: Any) {
        
        if tFieldName.text!.isEmpty || tFieldName.text!.isNumber {
            alertWarning(title: "Warning", message: "Name is Missing.")
        }
        
        if tFieldAge.text!.isEmpty || !tFieldAge.text!.isNumber {
            alertWarning(title: "Warning", message: "Age is Missing.")
        }
        
        if tFieldHomeCity.text!.isEmpty || tFieldHomeCity.text!.isNumber {
            alertWarning(title: "Warning", message: "HomeCity is Missing.")
        }
        
        if tFieldHometown.text!.isEmpty || tFieldHometown.text!.isNumber {
            alertWarning(title: "Warning", message: "Hometown is Missing.")
        }
        if  selectTypeOutlet.titleLabel!.text! == "Select Type" {
            alertWarning(title: "Warning", message: "Type is Missing.")
        }
        
        let str = """
        Name: \(tFieldName.text!)
        Age: \(tFieldAge.text!)
        Marital Status: \(maritalStatus)
        Home City: \(tFieldHomeCity.text!)
        Hometown: \(tFieldHometown.text!)
        Type:  \(selectTypeOutlet.titleLabel!.text!)
        """
        
        let tempModel = Employee(name: tFieldName.text!, age: Int(tFieldAge.text!)!, maritalStatus: maritalStatus == "Bachelor" ? .bachelor : .married, homeCity: tFieldHomeCity.text!, hometown: tFieldHometown.text!, employeeType: selectTypeOutlet.titleLabel!.text! == "Junior" ? .junior : (selectTypeOutlet.titleLabel!.text! == "Mid-Level" ? .midLevel : .senior))
        
        saveWarning(title: "About   Employee", message: str, self: self, newEmployee: tempModel)
    }
    
    func alertWarning(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveWarning(title: String, message: String, self: UIViewController, newEmployee: Employee) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "Save", style: UIAlertAction.Style.default) {
            UIAlertAction in
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "homeScreenVC") as? AboutCompanyViewController else { return }
            Company.employeeList.append(newEmployee)
            self.navigationController?.pushViewController(vc, animated: true)
        })
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
}

extension String {
    var isNumber: Bool {
        let digitsCharacters = CharacterSet(charactersIn: "0123456789")
        return CharacterSet(charactersIn: self).isSubset(of: digitsCharacters)
    }
}
