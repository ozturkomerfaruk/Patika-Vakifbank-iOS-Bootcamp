//
//  AppDelegate.swift
//  MovieViperArch
//
//  Created by Kaan YILDIRIM on 4.12.2022.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        RootRooter().showMovieListScreen(in: window!)
        return true
    }
}

