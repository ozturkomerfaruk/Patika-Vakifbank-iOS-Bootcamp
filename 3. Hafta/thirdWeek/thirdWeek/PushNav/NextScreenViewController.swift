//
//  NextScreenViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class NextScreenViewController: UIViewController {
    
    var pushedData = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        print(pushedData)
    }
    
    @IBAction func seguePressed(_ sender: Any) {
        performSegue(withIdentifier: "segueVC", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueVC" {
            guard let vc = segue.destination as? SegueViewController else { return }
            vc.segueStr = "Ömer Faruk"
        }
    }
}
