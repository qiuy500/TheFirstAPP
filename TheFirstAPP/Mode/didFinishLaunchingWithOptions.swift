//
//  didFinishLaunchingWithOptions.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import Firebase
import UIKit

func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    FirebaseApp.configure()
    return true
}
