//
//  ViewController.swift
//  BasicDataPersistance
//
//  Created by Kaan YILDIRIM on 13.11.2022.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {

    @IBOutlet weak var userdefaultsValueTextField: UITextField!
    @IBOutlet weak var userdefaultsValueLabel: UILabel!
    @IBOutlet weak var keychainValueLabel: UILabel!
    @IBOutlet weak var keychainValueTextField: UITextField!
    
    let keychain = Keychain(service: "com.kaanyildirim.BasicDataPersistance")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let userdefaultsStringValue = UserDefaults.standard.string(forKey: "UserdefaultsValue")
        userdefaultsValueLabel.text = userdefaultsStringValue
        
        keychainValueLabel.text = keychain["newKeychainValue"]
    }

    @IBAction func saveUserdefaultsButtonPressed(_ sender: Any) {
        UserDefaults.standard.set(userdefaultsValueTextField.text, forKey: "UserdefaultsValue")
    }
    
    @IBAction func saveKeychainPressed(_ sender: Any) {
        keychain["newKeychainValue"] = keychainValueTextField.text
    }
    
}

