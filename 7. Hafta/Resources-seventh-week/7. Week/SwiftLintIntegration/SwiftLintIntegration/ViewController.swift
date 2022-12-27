//
//  ViewController.swift
//  SwiftLintIntegration
//
//  Created by Kaan YILDIRIM on 10.12.2022.
//

import UIKit

final class ViewController: UIViewController {

    private let userNotificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestNotificationAuthorization()
        sendNotification()
    }
    
    private func requestNotificationAuthorization() {
        let authOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        userNotificationCenter.requestAuthorization(options: authOptions) { _, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    private func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "SwiftLint"
        notificationContent.body = "SwiftLint integration completed."
        notificationContent.userInfo = ["id": 3]
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        
        let request = UNNotificationRequest(identifier: "LintNotification", content: notificationContent, trigger: trigger)
        
        userNotificationCenter.add(request) { error in
            if let error = error {
                print(error)
            }
        }
    }
}
