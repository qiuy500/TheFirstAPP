//
//  Schedulechoice.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2023/2/21.
//

import SwiftUI

struct Schedulechoice: View {
    var body: some View {
        NavigationView{
            VStack{
                NavigationLink{
                    
                    ScheduleList()
                    
                }label:{
                    Text("上午")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                }
                NavigationLink{
                    
                    ScheduleList2()
                    
                }label:{
                    Text("下午")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                }
            }
            }
               
        }
    }

struct Schedulechoice_Previews: PreviewProvider {
    static var previews: some View {
        Schedulechoice()
    }
}

