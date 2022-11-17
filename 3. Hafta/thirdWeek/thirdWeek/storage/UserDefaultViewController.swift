//
//  UserDefaultViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit
import KeychainAccess

class UserDefaultViewController: UIViewController {
    
    @IBOutlet weak var userDefaultValue: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var labelDeneme: UILabel!
    
    
    @IBOutlet weak var keychainAccessValue: UILabel!
    
    
    @IBOutlet weak var textFieldKeyChain: UITextField!
    
    let keychain = Keychain(service: "com.ozturkomerfaruk.thirdWeek")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaultString = UserDefaults.standard.value(forKey: "UserDefaultValue")
        
        userDefaultValue.text = userDefaultString as? String
        
        keychainAccessValue.text  = keychain["keychainDeneme"]
    }
    

    @IBAction func SaveUserDefault(_ sender: Any) {
        UserDefaults.resetStandardUserDefaults()
        UserDefaults.standard.set(textField.text!, forKey: "UserDefaultValue")
        print(textField.text!)
    }
    
    @IBAction func saveKeyChain(_ sender: Any) {
        keychain["keychainDeneme"] = textFieldKeyChain.text
    }
    
    
}
