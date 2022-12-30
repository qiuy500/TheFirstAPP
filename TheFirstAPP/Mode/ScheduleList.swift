//
//  ScheduleList.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/25.
//

import SwiftUI

struct ScheduleList: View {
    @State private var backgroundColor = Color.gray
    @State var note = ""
    let colors:[Color]  = [.gray,.red]
    let colors1:[Color]  = [.gray,.red]
    var body: some View {
        VStack{
            List{
                Text("1:00")
                Text("")
               
                   
                
                
                }
            }
        }
    }
}

struct ScheduleList_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleList()
    }
}

