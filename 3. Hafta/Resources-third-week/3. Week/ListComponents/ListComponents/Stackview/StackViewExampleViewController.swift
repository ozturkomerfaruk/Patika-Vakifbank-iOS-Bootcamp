//
//  StackViewExampleViewController.swift
//  ListComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class StackViewExampleViewController: UIViewController {

    @IBOutlet weak var selectedLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func togglePressed(_ sender: Any) {
        selectedLabel.isHidden.toggle()
    }
}
