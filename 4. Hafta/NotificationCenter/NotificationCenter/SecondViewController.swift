//
//  SecondViewController.swift
//  NotificationCenter
//
//  Created by Ömer Faruk Öztürk on 22.11.2022.
//

import UIKit

protocol textToFirstVCProtocol {
    func didTapped(name: String)
}

class SecondViewController: UIViewController {
    
    var delegate: textToFirstVCProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func notifyAction(_ sender: Any) {
        
        delegate?.didTapped(name: "Omer Delegate")
        
        let text = "Omer Faruk"
        NotificationCenter.default.post(name: NSNotification.Name("buttonPressedNotification"), object: text)
    }
    
}
