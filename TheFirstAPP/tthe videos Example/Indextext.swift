//
//  Indextext.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/16.
//

import SwiftUI
import Firebase

struct Indextest: View {
    //@EnvironmentObject var studentManager:AddImage
    @EnvironmentObject var Mm :Multplechoicemanager
    @State var index = 0
    @State var dataList = [
        "Mm.MIF[0].CHTitle",
        "Two",
        "Three"
    ]
    @State var word = ""
    var body: some View {
        VStack{
           VStack {
               Text("\(dataList[index])")
                   .foregroundColor(.white)
                   .padding(.horizontal,145)
                   .padding(.vertical,80)
                   .background(Color.brown)
                   .font(.title)
                   .cornerRadius(10)
               HStack {
                   Text("上一題").onTapGesture {
                       if (0 < index){
                           index = index - 1
                       }
                   }
                   Text("下一題").onTapGesture {
                       if (index < 2){
                           index = index + 1
                       }
                   }
               }
               HStack{
                   Button{
                       dataList[index] = "\(Mm.MIF[index].id)"
                   }label: {
                       Text("plus")

                   }
               }
           }
        }
    }



}

struct Indextest_Previews: PreviewProvider {
    static var previews: some View {
        Indextest().environmentObject(Multplechoicemanager())
    }
}
