//
//  ScheduleList2.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/1/2.
//

import SwiftUI

struct ScheduleList2: View {
    @State var selectedNumber: Int? = nil
    let colors: [Color] = [.gray, .red]
    @State private var fgColor11: Color = .gray
    @State private var fgColor12: Color = .gray
    @State private var fgColor13: Color = .gray
    @State private var fgColor14: Color = .gray
    @State private var fgColor15: Color = .gray
    @State private var fgColor16: Color = .blue
    @State private var fgColor17: Color = .green
    @State private var fgColor18: Color = .yellow
    @State private var fgColor19: Color = .orange
    @State private var fgColor20: Color = .red
    
    var body: some View {
        List{
            Text("午休")
                .font(.title)
                .foregroundColor(fgColor20)
          

             Text("13:00")
                    .font(.title)
                    .foregroundColor(fgColor11)
                    .onTapGesture(count: 1) {
                        fgColor11 = colors.randomElement()!}
            Text("下午第一節")
                .font(.title)
                .foregroundColor(fgColor19)

            
                Text("14:00").font(.title)
                    .foregroundColor(fgColor12)
                    .onTapGesture(count: 1) {
                        fgColor12 = colors.randomElement()!}
            
            Text("下午第二節")
                .font(.title)
                .foregroundColor(fgColor18)
                Text("15:00").font(.title)
                    .foregroundColor(fgColor13)
                    .onTapGesture(count: 1) {
                        fgColor13 = colors.randomElement()!}
            Text("下午第三節")
                .font(.title)
                .foregroundColor(fgColor17)

                Text("16:00").font(.title)
                    .foregroundColor(fgColor14)
                    .onTapGesture(count: 1) {
                        fgColor14 = colors.randomElement()!}
            Text("下午第四節")
                .font(.title)
                .foregroundColor(fgColor16)

                Text("17:00").font(.title)
                    .foregroundColor(fgColor15)
                    .onTapGesture(count: 1) {
                        fgColor15 = colors.randomElement()!}
               
               
                
                
            
        }
    }
}
struct ScheduleList2_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList2()
    }
}
