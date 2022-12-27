//
//  ScheduleList.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/25.
//

import SwiftUI

struct ScheduleList: View {
    @State private var backgroundColor = Color.white
    @State var note = ""
    var ListNumber : [String] = ["1:00","2:00","3:00","4:00","5:00","6:00","7:00","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00"]
    var body: some View {
        VStack{
            
            Button{
                
            }label: {
                
            }
            
            
            
            List{
                
                ForEach( 0...23,id:\.self){
                    Text(ListNumber[$0 % ListNumber.count])
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

