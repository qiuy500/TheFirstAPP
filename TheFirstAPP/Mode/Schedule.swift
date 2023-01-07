//
//  Schedule.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI

struct Schedule: View {
    
    var columngrid :[GridItem] = [
        GridItem(.flexible(), spacing:1),
        GridItem(.flexible(), spacing:1)
        
    ]
    var testschedule :[String] =
    ["chinese","math","english","physics","biology","chemical","sleep"]
    var body: some View {
        
        VStack {
            NavigationView{
                ScrollView{
                    Text("What do you want to do? ")
                    LazyVGrid(columns: columngrid){
                        ForEach(0...6,id:\.self){index in
                            NavigationLink{
                                
                              //  ScheduleList()
                            }label: {
                            
                                    Image(testschedule[index % testschedule.count])
                                        .resizable()
                                        .frame(width: 200,height: 200)
                                }
                            
                            
                        }
                        
                        
                    }
                }
            }
        }
    }
}
struct Schedule_Previews: PreviewProvider {
    static var previews: some View {
        Schedule()
    }
}
