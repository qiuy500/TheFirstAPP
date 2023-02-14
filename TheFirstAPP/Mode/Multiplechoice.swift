//
//  Multiplechoice.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI
import Firebase


struct Multiplechoice: View {
    @EnvironmentObject var Mm :Multplechoicemanager
    var body: some View {
        VStack{
           
            //Text(Mm.MIF[1].id)

            List{
                /*ForEach(0..<Mm.MIF.count,id:\.self){index in
                    
                    VStack(alignment: .center){
                        Text(Mm.MIF[index].id)
                    }
                    
                }*/
                ForEach(Mm.MIF){ std in
                    HStack {
                        VStack(alignment:.center) {
                            Text(std.id)
                            Text(std.dID)
                        }
                        
                    }
                    
                }
            }
        }
    }
}
struct Multiplechoice_Previews: PreviewProvider {
    static var previews: some View {
        Multiplechoice().environmentObject(Multplechoicemanager())
    }
}
