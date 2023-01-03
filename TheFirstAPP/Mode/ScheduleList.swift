//
//  ScheduleList.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/25.
//

import SwiftUI

struct ScheduleList: View {
    @State private var backgroundColor1 = Color.gray
    @State private var backgroundColor2 = Color.gray
    @State private var backgroundColor3 = Color.gray
    @State private var backgroundColor4 = Color.gray
    @State private var backgroundColor5 = Color.gray
    @State private var backgroundColor6 = Color.gray
    @State private var backgroundColor7 = Color.gray
    @State private var backgroundColor8 = Color.gray
    @State private var backgroundColor9 = Color.gray
    @State private var backgroundColor10 = Color.gray
    @State private var backgroundColor11 = Color.gray
    @State private var backgroundColor12 = Color.gray
    @State private var backgroundColor13 = Color.gray
    @State private var backgroundColor14 = Color.gray
    @State private var backgroundColor15 = Color.gray
    @State private var backgroundColor16 = Color.gray
    @State private var backgroundColor17 = Color.gray
    @State private var backgroundColor18 = Color.gray
    @State private var backgroundColor19 = Color.gray
    @State private var backgroundColor20 = Color.gray
    @State private var backgroundColor21 = Color.gray
    @State private var backgroundColor22 = Color.gray
    @State private var backgroundColor23 = Color.gray
    @State private var backgroundColor24 = Color.gray
    var colors1 : [Color] =
    [.gray,.red]
    var colors2 : [Color] =
    [.gray,.red]
    var colors3 : [Color] =
    [.gray,.red]
    var colors4 : [Color] =
    [.gray,.red]
    var colors5 : [Color] =
    [.gray,.red]
    var colors6 : [Color] =
    [.gray,.red]
    var colors7 : [Color] =
    [.gray,.red]
    var colors8 : [Color] =
    [.gray,.red]
    var colors9 : [Color] =
    [.gray,.red]
    var colors10 : [Color] =
    [.gray,.red]
    var colors11: [Color] =
    [.gray,.red]
    var colors12: [Color] =
    [.gray,.red]
    var colors13: [Color] =
    [.gray,.red]
    var colors14 : [Color] =
    [.gray,.red]
    var colors15 : [Color] =
    [.gray,.red]
    var colors16 : [Color] =
    [.gray,.red]
    var colors17 : [Color] =
    [.gray,.red]
    var colors18 : [Color] =
    [.gray,.red]
    var colors19 : [Color] =
    [.gray,.red]
    var colors20 : [Color] =
    [.gray,.red]
    var colors21 : [Color] =
    [.gray,.red]
    var colors22 : [Color] =
    [.gray,.red]
    var colors23 : [Color] =
    [.gray,.red]
    var colors24 : [Color] =
    [.gray,.red]
    var body: some View {
        VStack{
            List{
                
                Text("1:00")
                    .foregroundColor(backgroundColor1)
                    .onTapGesture(count: 1) {
                        backgroundColor1 = colors1.randomElement()!
                    }
            
                Text("2:00")
                    .foregroundColor(backgroundColor2)
                    .onTapGesture(count: 1) {
                        backgroundColor2 = colors2.randomElement()!
                    }
                Text("2:00")
                    .foregroundColor(backgroundColor3)
                    .onTapGesture(count: 1) {
                        backgroundColor3 = colors3.randomElement()!
                    }
                Text("1:00")
                    .foregroundColor(backgroundColor4)
                    .onTapGesture(count: 1) {
                        backgroundColor4 = colors4.randomElement()!
                    }
                Text("1:00")
                    .foregroundColor(backgroundColor5)
                    .onTapGesture(count: 1) {
                        backgroundColor5 = colors5.randomElement()!
                    }
                Text("1:00")
                    .foregroundColor(backgroundColor6)
                    .onTapGesture(count: 1) {
                        backgroundColor6 = colors6.randomElement()!
                    }
                Text("1:00")
                    .foregroundColor(backgroundColor7)
                    .onTapGesture(count: 1) {
                        backgroundColor7 = colors7.randomElement()!
                    }
                Text("1:00")
                    .foregroundColor(backgroundColor8)
                    .onTapGesture(count: 1) {
                        backgroundColor8 = colors8.randomElement()!
                    }
                Text("1:00")
                    .foregroundColor(backgroundColor9)
                    .onTapGesture(count: 1) {
                        backgroundColor9 = colors9.randomElement()!
                    }
               ScheduleList2()
               
                
                }
            }
        }
    }


struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}

