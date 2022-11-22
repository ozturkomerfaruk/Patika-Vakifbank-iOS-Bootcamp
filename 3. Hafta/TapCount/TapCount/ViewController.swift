//
//  ViewController.swift
//  TapCount
//
//  Created by Ömer Faruk Öztürk on 21.11.2022.
//

import UIKit
import KeychainAccess

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLeftLabel: UILabel!
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var startLabel: UILabel!
    @IBOutlet weak var highScoreLabel: UILabel!
    
    private var timer = Timer()
    private var timerCurrentCount = 5
    
    private var score = 0
    private var highScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = PlayViewController.keychainDecode?.first?.key
        
        
        myView.isUserInteractionEnabled = true
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        myView.addGestureRecognizer(tapGR)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.timer = Timer.scheduledTimer(timeInterval: 1,
                                          target: self,
                                          selector: #selector(self.timeLeft),
                                          userInfo: nil,
                                          repeats: true)
    }
    
    @objc func handleTap() {
        
        self.score += 1
        startLabel.text! = String(self.score)
        
        startLabel.text = String(self.score)
        self.score = self.score + 1
        highScoreLabel.text = "High Score : \(highScore)"
    }
    
    
    
    @objc private func timeLeft() {
        self.timerCurrentCount = self.timerCurrentCount - 1
        self.timeLeftLabel.text = "Time Left: \(self.timerCurrentCount)"
        
        if self.timerCurrentCount == 0 {
            self.timer.invalidate()
            self.myView.isUserInteractionEnabled = false
            
            if self.highScore < self.score {
                self.highScore = self.score
            }
            
            
            PlayViewController.keychainDecode?.first?.value = Int(highScoreLabel.text)
            
            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted
            let data = try! encoder.encode(dict)
            let jsonString = String(data: data, encoding: .utf8)!
            print(jsonString)
            
            PlayViewController.keychain["keychain"] = jsonString
            
            guard let pushWithIdVC = self.storyboard?.instantiateViewController(withIdentifier: "resultVC") as? ResultViewController
            else { return }
            self.navigationController?.pushViewController(pushWithIdVC, animated: true)
            
        }
    }
    
    func alert(title: String, message: String, action: @escaping (_ param: UIAlertAction) -> Void) {
        // Create new Alert
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // Create OK button with action handler
        let ok = UIAlertAction(title: "OK", style: .default, handler: action)
        
        //Add OK button to a dialog message
        dialogMessage.addAction(ok)
        
        // Present Alert to
        self.present(dialogMessage, animated: true)
    }
}

