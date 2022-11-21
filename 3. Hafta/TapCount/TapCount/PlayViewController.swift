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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func playButton(_ sender: Any) {
        
        if usernameTextField.text!.isEmpty {
            alert(title: "Warning", message: "Name is missing", action: {param in
                return
            })
        }
        
        dict[usernameTextField.text!] = 0
        
        //MARK: Dict
        PlayViewController.keychain["keychain"] = dict.first?.key
        
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
