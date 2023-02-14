//
//  ChoiceD.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import SwiftUI
import Firebase
struct ChoiceD: View {
    @EnvironmentObject var Mm :Multplechoicemanager
    var body: some View {
        ZStack{
            Text(".")
                .padding(.horizontal,170)
                .padding(.vertical,32)
                .background(Color.brown)
                .font(.title)
                .cornerRadius(40)
            ForEach(Mm.MIF){ std in
                HStack {
                    VStack(alignment:.center) {
                        Text(std.id)
                       
                    }
                    
                }
                
            }
                
                Image(systemName:"d.circle")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .offset(x:-130)
        }
    }
}
struct ChoiceD_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceD().environmentObject(Multplechoicemanager())
    }
}
