//
//  ChoiceE.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import SwiftUI
import Firebase
struct ChoiceE: View {
    let  dataDemo = [
        "One",
        "Two",
        "Three"
    ]
    
    @EnvironmentObject var Mm :Multplechoicemanager
    @State var index = 0
    var body: some View {
        ZStack{
            Text(".")
                .padding(.horizontal,170)
                .padding(.vertical,32)
                .background(Color.brown)
                .font(.title)
                .cornerRadius(40)
            
            List{
                ForEach(0..<Mm.MIF.count,id:\.self){index in
                    
                    VStack(alignment: .center){
                        Text(Mm.MIF[index].CH5)
                            .foregroundColor(.white)
                            .padding(.horizontal,110)
                            .padding(.vertical,25)
                            .background(Color.gray)
                            .font(.title)
                            .cornerRadius(30)


                    }
                    Button{
                        Mm.removeChoiceE(id: Mm.MIF[index.first ?? 0].dID)
                    }label: {
                        Text("kkk")
                    }
                    
                }
                Image(systemName:"e.circle")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .offset(x:-130)
            }
        }
    }
}
struct ChoiceE_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceE().environmentObject(Multplechoicemanager())
    }
}
