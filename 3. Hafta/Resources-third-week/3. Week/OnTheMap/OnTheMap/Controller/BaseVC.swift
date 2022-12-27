//
//  BaseVC.swift
//  OnTheMap

import UIKit

class BaseVC: UIViewController {
    
    func showErrorAlert(title: String, description: String) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }

    func showAlert(title: String, description: String, primaryButtonTitle: String, primaryButtonAction: @escaping () -> ()) {
        let alertController = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: primaryButtonTitle, style: .default, handler: { (_) in
            primaryButtonAction()
        }))
        alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (_) in
            alertController.dismiss(animated: true, completion: nil)
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}
