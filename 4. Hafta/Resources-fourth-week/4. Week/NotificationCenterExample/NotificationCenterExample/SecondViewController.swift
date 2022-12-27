//
//  SecondViewController.swift
//  NotificationCenterExample
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func notifyButtonPressed(_ sender: Any) {
        let text = "Button Pressed"
        NotificationCenter.default.post(name: NSNotification.Name("buttonPressedNotification"), object: text)
    }
}
