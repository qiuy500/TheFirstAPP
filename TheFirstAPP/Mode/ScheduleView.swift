//
//  ScheduleView.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/26.
//

import SwiftUI

struct ScheduleView: View {
    @State var subject: [String] = ["國文","數學"]
    let roles = ["國文", "數學", "自然", "社會"]
        @State private var selectedIndex = 0
        
        var body: some View {
            VStack {
                Picker(selection: $selectedIndex) {
                    ForEach(roles.indices) { item in
                        Text(roles[item])
                    }
                } label: {
                    Text("選擇")
                }
                .pickerStyle(.wheel)
                Text("我要選\(roles[selectedIndex])")
            }
        }
    }

struct ScheduleView_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleView()
    }
}
