//
//  ChoiceC.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import SwiftUI
import Firebase
struct ChoiceC: View {
    @EnvironmentObject var Mm :Multplechoicemanager
    var body: some View {
        ZStack{
            Text(".")
                .padding(.horizontal,170)
                .padding(.vertical,32)
                .background(Color.brown)
                .font(.title)
                .cornerRadius(40)
            ForEach(0..<Mm.MIF.count,id:\.self){index in
                
                VStack(alignment: .center){
                    Text(Mm.MIF[index].CH3)
                        .foregroundColor(.white)
                        .padding(.horizontal,110)
                        .padding(.vertical,25)
                        .background(Color.gray)
                        .font(.title)
                        .cornerRadius(30)
                }
                
            }
                    
                
                Image(systemName:"c.circle")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .offset(x:-130)
        }
    }
}
struct ChoiceC_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceC().environmentObject(Multplechoicemanager())
    }
}

