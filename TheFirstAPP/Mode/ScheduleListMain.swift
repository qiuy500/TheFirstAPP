//
//  ScheduleListMain.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/1/7.
//

import SwiftUI

struct ScheduleListMain: View {
    @State var subject : [String] =
       ["1:00","2:00","3:00","4:00","5:00","6:00","7:00","8:00","9:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00","23:00","24:00"]
    @State var backgrandcolor1 : Color = .gray
    @State var backgrandcolor2 : Color = .gray
    @State var backgrandcolor3 : Color = .gray
    @State var backgrandcolor4 : Color = .gray
    @State var backgrandcolor5 : Color = .gray
    @State var backgrandcolor6 : Color = .gray
    var backgrandcolors : [String] = ["backgrandcolor1","backgrandcolor2","backgrandcolor3","backgrandcolor1"]
    var colors : [Color] = [.gray,.red]
    var body: some View {
        List{
            ForEach(0...23,id: \.self){index in
            Text("\(subject[index % subject.count])")
                    .foregroundColor(backgrandcolor1)
                    .onTapGesture(count: 1){
                        backgrandcolor1 = colors.randomElement()!

                    }
        }
            ForEach(0...23,id: \.self){index in
            Text("\(subject[index % subject.count])")
            
        }
            
    }
            }
    }
func Listtime() {
    
   
                        
}



struct ScheduleListMain_Previews: PreviewProvider {
    static var previews: some View {
        ScheduleListMain()
    }
}
