//
//  BottomView.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/15.
//

import SwiftUI

struct BottomView: View {
    @EnvironmentObject var Mm :Multplechoicemanager

    var body: some View {
        VStack {
            TabView{
                ToMaToView()
                    .tabItem{
                        Image(systemName: "clock")
                    }
                ScheduleListMain()
                    .tabItem{
                        Image(systemName: "list.clipboard")
                    }
                HomeView()
                    .tabItem{
                        Image(systemName: "house")
                    }
                Multiplechoice().environmentObject(Multplechoicemanager())
                    .tabItem{
                        Image(systemName: "pencil.line")
                    }
                Wrongquestion()
                    .tabItem{
                        Image(systemName: "book.circle")
                    }

                
            }
        }
    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
