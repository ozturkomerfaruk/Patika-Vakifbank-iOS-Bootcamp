//
//  PlayViewController.swift
//  TapCount
//
//  Created by Ömer Faruk Öztürk on 21.11.2022.
//

import UIKit
import KeychainAccess


class PlayViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    private var dict: [String : Int] = [:]
    
    static let keychain = Keychain(service: "com.ozturkomerfaruk.TapCount")
    static let readKeychain = PlayViewController.keychain["keychain"]!.data(using: .utf8)!
    static var keychainDecode = try? JSONDecoder().decode([String: Int]?.self, from: PlayViewController.readKeychain)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //***********************************************************************************************
        //************************************DELETE KEYCHAIN ACSESS*************************************
        //***********************************************************************************************
        /*
        for itemClass in PlayViewController.readKeychain {
            let spec: NSDictionary = [kSecClass: itemClass]
            SecItemDelete(spec)
        }
         */
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        if usernameTextField.text!.isEmpty {
            alert(title: "Warning", message: "Name is missing", action: {param in
                return
            })
        }
        
        if usernameTextField.text! != "" {
            dict[usernameTextField.text!] = 0
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try! encoder.encode(dict)
            let jsonString = String(data: data, encoding: .utf8)!
            print(jsonString)
            
            PlayViewController.keychain["keychain"] = jsonString
        }
        
        alert(title: "Warning", message: "The game will start suddenly", action: { param in
            if param.title! != "CANCEL" {
                guard let pushWithIdVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as? ViewController
                else { return }
                self.navigationController?.pushViewController(pushWithIdVC, animated: true)
            }
            
        })
    }
    
    func alert(title: String, message: String, action: @escaping (_ param: UIAlertAction) -> Void) {
        // Create new Alert
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: action)
        
        let cancel = UIAlertAction(title: "CANCEL", style: .cancel, handler: action)
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        // Present Alert to
        self.present(dialogMessage, animated: true)
    }
    
}
