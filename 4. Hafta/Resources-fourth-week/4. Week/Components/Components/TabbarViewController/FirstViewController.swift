//
//  FirstViewController.swift
//  Components
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet private weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func buttonPressed(_ sender: Any) {
        myLabel.text = "Button Pressed."
    }
}
