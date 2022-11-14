//
//  ViewController.swift
//  thirdWeek>
//
//  Created by Ömer Faruk Öztürk on 14.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var tag2: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        firstLabel.text = "Vakıfbank Swift Bootcamp"
        firstLabel.font = firstLabel.font.withSize(24)
        
        myButton.setTitle("New Button Name", for: .normal)
        
        
        myButton.tag = 1
        tag2.tag = 2
        
        
    }
    
    @IBAction func myButton(_ sender: UIButton) {
        if sender.tag == 1 {
            print("Button")
        }
    }
    
    @IBAction func tag2Button(_ sender: UIButton) {
        if sender.tag == 2 {
            print("tag2")
        }
    }
    //viewWillAppear
    //viewDidAppear
    //viewWillDisappear
    //viewDidDisappear
    
    

}

