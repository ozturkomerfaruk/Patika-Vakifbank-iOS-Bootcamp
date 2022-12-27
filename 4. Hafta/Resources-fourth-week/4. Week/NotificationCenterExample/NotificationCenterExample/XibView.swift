//
//  XibView.swift
//  XibExample
//
//  Created by Kaan YILDIRIM on 19.11.2022.
//

import UIKit

class XibView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "XibView", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as? UIView {
            view.backgroundColor = .clear
            addSubview(view)
            view.frame = self.bounds
            
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(handleButton),
                                                   name: NSNotification.Name("buttonPressedNotification"),
                                                   object: nil)
        }
    }
    
    @IBAction func changeColorButtonPressed(_ sender: Any) {
        let colors: [UIColor] = [.red, .green, .yellow, .orange, .blue, .purple, .blue]
        let randomColorIndex = arc4random() % 6
        self.backgroundColor = colors[Int(randomColorIndex)]
    }
    
    @objc func handleButton(_ notification: Notification) {
        if let text = notification.object as? String {
            print("From XibView handle notification: \(text)")
        }
    }
    
}
