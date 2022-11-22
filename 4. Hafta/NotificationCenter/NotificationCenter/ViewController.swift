//
//  ViewController.swift
//  NotificationCenter
//
//  Created by Ömer Faruk Öztürk on 22.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var delegateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleButtonPressed), name: NSNotification.Name("buttonPressedNotification"), object: nil)
    }

    @objc func handleButtonPressed(_ notification: Notification) {
        if let text = notification.object as? String {
            label.text = text
        }
    }
    
    
    @IBAction func secondVC(_ sender: Any) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "secondVC" {
            guard let vc = segue.destination as? SecondViewController else { return }
            vc.delegate = self
        }
    }
}

extension ViewController: textToFirstVCProtocol {
    func didTapped(name: String) {
        delegateLabel.text = name
    }
}
