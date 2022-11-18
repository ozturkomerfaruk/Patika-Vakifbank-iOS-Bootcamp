//
//  CustomAlert.swift
//  Hw3-1
//
//  Created by Ömer Faruk Öztürk on 18.11.2022.
//

import UIKit
import Foundation

class CustomAlert {
    class func alertWarning(title: String, message: String) {
        // create the alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // add the actions (buttons)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        // show the alert
        
    }
}
