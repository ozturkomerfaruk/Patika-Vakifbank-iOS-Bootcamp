//
//  NotificationManager.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 16.12.2022.
//

import UIKit

class NotificationManager {
    
    static let shared = NotificationManager()
    private var granted: Bool?
    
    init(){}
    
    func addLocalNotification() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(appMovedToBackground), name: UIApplication.willResignActiveNotification, object: nil)
    }
    
    @objc private func appMovedToBackground() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.sound, .alert, .badge]) { granted, error in
            if error == nil {
                print("User permisson is granted: \(granted)")
            }
        }
        
        let content = UNMutableNotificationContent()
        content.title = "stopDontLeave".localized()
        content.body = "cutWatermelon".localized()
        
        let date = Date().addingTimeInterval(3)
        let dateComponent = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponent, repeats: false)
        
        let uuid = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuid, content: content, trigger: trigger)
        
        center.add(request) {
            error in
            print("\(request)")
        }
    }
}
