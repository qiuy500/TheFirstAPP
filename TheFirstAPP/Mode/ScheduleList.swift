//
//  ScheduleList.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/25.
//

import SwiftUI

struct ScheduleList: View {
    var subject : [String] =
    ["1:00","2:00","3:00","4:00","5:00","6:00","7:00","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","23:00","24:00"]
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
                ForEach(0...10,id: \.self){index in
                    Text("\(index % subject.count)")
                    
                }
                
                }
            }
        }
    }
/*func Lighttime() {
    .foregroundColor(backgroundColor8)
    .onTapGesture(count: 1) {
    }
    */
    struct ScheduleList_Previews: PreviewProvider {
        static var previews: some View {
            ScheduleList()
        }
    }
    

