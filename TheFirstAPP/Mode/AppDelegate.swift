//
//  AppDelegate.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/4.
//


import Foundation
import UIKit
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        //code here
        FirebaseApp.configure()
        return true
    }
}
