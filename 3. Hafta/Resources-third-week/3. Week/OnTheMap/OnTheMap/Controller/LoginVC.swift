//
//  LoginVC.swift
//  OnTheMap

import UIKit

final class LoginVC: BaseVC {

    // MARK: Properties
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!

    // MARK: Methods
    @IBAction private func loginButtonPressed(_ sender: Any) {
        NetworkClient.login(username: usernameTextField.text ?? "", password: passwordTextField.text ?? "") { (success, error) in

            if success {
                NetworkClient.getCurrentUser { (user, error) in
                    if let error = error {
                        self.showErrorAlert(title: "Error", description: error.localizedDescription)
                        return
                    }
                    if let _ = user {
                        self.performSegue(withIdentifier: "loginSuccess", sender: nil)
                    }
                }
            } else if let error = error {
                self.showErrorAlert(title: "Error", description: error.localizedDescription)
                return
            }
        }
    }
}

extension LoginVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        true
    }
}

