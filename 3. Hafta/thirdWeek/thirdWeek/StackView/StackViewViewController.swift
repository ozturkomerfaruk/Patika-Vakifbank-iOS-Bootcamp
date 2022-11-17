//
//  StackViewViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class StackViewViewController: UIViewController {
    @IBOutlet weak var heroLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func togglePressed(_ sender: Any) {
        heroLabel.isHidden = !heroLabel.isHidden
    }
    

}
