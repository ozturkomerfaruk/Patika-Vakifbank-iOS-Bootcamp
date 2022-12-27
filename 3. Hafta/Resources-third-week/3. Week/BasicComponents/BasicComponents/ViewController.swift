//
//  ViewController.swift
//  BasicComponents
//
//  Created by Kaan YILDIRIM on 12.11.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var myNewButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    @IBOutlet weak var mySegmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Console print")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        myLabel.text = "Hello World, Hello World, Hello World, Hello World, Hello World, Hello World, Hello World, Hello World, Hello World, Hello World"
        myLabel.backgroundColor = .blue
        myLabel.textColor = .red
        myLabel.font = .boldSystemFont(ofSize: 50.0)
        
        myNewButton.setTitle("Press Me", for: .normal)
        
        myView.backgroundColor = .green
    }

    @IBAction func myButtonPressed(_ sender: Any) {
        print("myButton pressed")
        print(myTextField.text ?? "Empty") // Boş string nil değildir.
    }
    
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        print("Value is \((sender as! UISegmentedControl).selectedSegmentIndex)")
    }
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        print("Value is \((sender as! UISlider).value)")
    }
    
    @IBAction func switchValueChanged(_ sender: Any) {
        print("Switch is \((sender as! UISwitch).isOn)")
    }
}

