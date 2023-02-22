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
    @StateObject var Ｍn = Multplechoicemanager()
    //@StateObject var Aimage = AddImage()
    var body: some Scene {
        WindowGroup {
            if #available(iOS 16.0, *) {
                //Multiplechoice().environmentObject(Ｍn)
                //ContentView()
                //Wrongquestion().environmentObject(Aimage)
               ContentView().environmentObject(Ｍn)
                //ToMaToView()


            } else {
                // Fallback on earlier versions
            }
        }
    }

}
