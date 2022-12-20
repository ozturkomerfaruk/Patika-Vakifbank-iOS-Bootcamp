//
//  LaunchOnboardingManager.swift
//  NeworlD
//
//  Created by Ömer Faruk Öztürk on 16.12.2022.
//

import Foundation

class LaunchOnboardingManager {
    static let shared = LaunchOnboardingManager()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
