//
//  ResultViewController.swift
//  TapCount
//
//  Created by Ömer Faruk Öztürk on 21.11.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        highScoreLabel.text =  String(describing: PlayViewController.keychainDecode?.first!.value)
    }
    
    
    @IBAction func listeleAction(_ sender: Any) {
        guard let pushWithIdVC = self.storyboard?.instantiateViewController(withIdentifier: "tableVC") as? TableViewController
        else { return }
        self.navigationController?.pushViewController(pushWithIdVC, animated: true)
    }
    
}
