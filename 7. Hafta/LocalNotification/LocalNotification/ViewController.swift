//
//  ViewController.swift
//  LocalNotification
//
//  Created by Ömer Faruk Öztürk on 7.12.2022.
//

import UIKit
import NotificationCenter

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc func appMovedToBackground() {
        
        print("5 sec")
        
        //Step 1 - Ask permission from USER
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge]) { granted, error in
            if error == nil {
                print("User permisson is granted: \(granted)")
            }
        }
        
        //Step 2 - Create the notification Content
        let content = UNMutableNotificationContent()
        content.title = "Hello"
        content.body = "Body"
        content.title = "2"
        
        //Step 3 - Create the notification trigger
        //let date = Date().addingTimeInterval(5)
        let date = Date().addingTimeInterval(5)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        //Step 4 - Create a request
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        //Step 5 - Register with Notification Center
        center.add(request) {
            error in
            print(error)
        }
    }
    
}


/*
 
 
 
 */
