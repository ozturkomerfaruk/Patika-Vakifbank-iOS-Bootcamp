//
//  ViewController.swift
//  NotificationCenterExample
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleButtonPressed),
                                               name: NSNotification.Name("buttonPressedNotification"),
                                               object: nil)
    }

    @objc func handleButtonPressed(_ notification: Notification) {
        if let text = notification.object as? String {
            label.text = text
        }
    }

}

