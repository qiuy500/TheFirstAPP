//
//  TheFirstAPPApp.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/8.
//
import SwiftUI

@main

struct TheFirstAPPApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    //@StateObject var Ｍn = Multplechoicemanager()
    @StateObject var studentManager = AddImage()
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                //Multiplechoice().environmentObject(Multplechoicemanager())
                //ContentView()
                //ImageTest().environmentObject(studentManager)
                //MainMultiplechioce().environmentObject(Multplechoicemanager())
                //IndexDemo()
                Indextest().environmentObject(AddImage())

            } else {
                // Fallback on earlier versions
            }
            //ContentView()
        }
    }

}
