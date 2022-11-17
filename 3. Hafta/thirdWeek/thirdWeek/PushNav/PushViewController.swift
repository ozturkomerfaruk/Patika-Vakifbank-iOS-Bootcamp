//
//  PushViewController.swift
//  thirdWeek
//
//  Created by Ömer Faruk Öztürk on 17.11.2022.
//

import UIKit

class PushViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func pushPressed(_ sender: Any) {
        guard let pushWithIdVC = storyboard?.instantiateViewController(withIdentifier: "NextScreenVC") as? NextScreenViewController else { return }
        pushWithIdVC.pushedData = "Ömer"
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)
    }
}
