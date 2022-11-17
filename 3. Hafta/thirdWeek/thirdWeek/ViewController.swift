//
//  ViewController.swift
//  thirdWeek>
//
//  Created by Ömer Faruk Öztürk on 14.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    @IBOutlet weak var myView: UIView!
    
    
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var tag2: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView.backgroundColor = .green
        myView.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(labelChange))
        myView.addGestureRecognizer(gesture)
                
        firstLabel.text = "Vakıfbank Swift Bootcamp"
        firstLabel.font = firstLabel.font.withSize(24)
        
        myButton.setTitle("New Button Name", for: .normal)
        
        
        myButton.tag = 1
        tag2.tag = 2
        
        slider.minimumValue = 10
        slider.maximumValue = 100
        slider.value = 31
        
        
    }
    
    @objc func labelChange() {
        firstLabel.text = "Changed"
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
        print(textField.text!)
    }
    //viewWillAppear
    //viewDidAppear
    //viewWillDisappear
    //viewDidDisappear
    
    @IBAction func segmentControl(_ sender: Any) {
        let str = (sender as! UISegmentedControl).selectedSegmentIndex
        print(str)
    }
    
    @IBAction func sliderAct(_ sender: Any) {
        
        print((sender as! UISlider).value)
    }
    
    
    @IBAction func switchAct(_ sender: Any) {
        print((sender as! UISwitch).isOn )
    }
    
    
    
}

