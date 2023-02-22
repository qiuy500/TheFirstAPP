//
//  ScheduleList.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/25.
//

import SwiftUI

struct ScheduleList: View {
    
    let colors: [Color] = [.gray, .red]
    @State private var fgColor1: Color = .gray
    @State private var fgColor2: Color = .gray
    @State private var fgColor3: Color = .gray
    @State private var fgColor4: Color = .gray
    @State private var fgColor5: Color = .gray
    @State private var fgColor6: Color = .blue
    @State private var fgColor7: Color = .green
    @State private var fgColor8: Color = .yellow
    @State private var fgColor9: Color = .orange
    @State private var fgColor10: Color = .red
    let roles = ["國文", "數學", "自然", "社會","英文"]
        @State private var selectedIndex = 0

    
    var body: some View {
        VStack{
            Picker(selection: $selectedIndex) {
                ForEach(roles.indices) { item in
                    Text(roles[item])
                }
            } label: {
                Text("選擇")
            }
            
            List{
                Text("早自習")
                    .font(.title)
                    .foregroundColor(fgColor10)
                Text("8:00").font(.title)
                    .foregroundColor(fgColor3)
                    .onTapGesture(count: 1) {
                        fgColor3 = colors.randomElement()!}
                Text("第一節")
                    .font(.title)
                    .foregroundColor(fgColor9)
                Text("9:00").font(.title)
                    .foregroundColor(fgColor4)
                    .onTapGesture(count: 1) {
                        fgColor4 = colors.randomElement()!}
                Text("第二節")
                    .font(.title)
                    .foregroundColor(fgColor8)
                Text("10:00").font(.title)
                    .foregroundColor(fgColor5)
                    .onTapGesture(count: 1) {
                        fgColor5 = colors.randomElement()!}
                Text("第三節")
                    .font(.title)
                    .foregroundColor(fgColor7)
                Text("11:00").font(.title)
                    .foregroundColor(fgColor2)
                    .onTapGesture(count: 1) {
                        fgColor2 = colors.randomElement()!}
                Text("第四節")
                    .font(.title)
                    .foregroundColor(fgColor6)
                Text("12:00").font(.title)
                    .foregroundColor(fgColor1)
                    .onTapGesture(count: 1) {
                        fgColor1 = colors.randomElement()!}
                
                
            }
            
        }
    }
}




struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}

                                                                
