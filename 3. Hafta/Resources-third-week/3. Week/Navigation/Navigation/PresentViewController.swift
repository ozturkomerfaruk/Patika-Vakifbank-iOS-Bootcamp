//
//  PresentViewController.swift
//  Navigation
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class PresentViewController: UIViewController {

    var presentData = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(presentData)
    }
    @IBAction func dismissButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
}
