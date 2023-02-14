//
//  MainMultiplechoice.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import SwiftUI

import SwiftUI

struct MainMultiplechioce: View {
    @EnvironmentObject var Mm :Multplechoicemanager
    var body: some View {
        
        VStack{
            HStack{
                Image(systemName:"square.and.arrow.up")
                    .resizable()
                    .frame(width: 30,height: 35)
                    .offset(x:20)
                Text("Test")
                    .font(.title)
                    .padding(.all)
                    .offset(x:115)
                Spacer()
                Image(systemName:"arrowshape.turn.up.right.fill")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .offset(x:-20)
            }
            ZStack{
        Text("")
                .foregroundColor(.white)
                .padding(.horizontal,180)
                .padding(.vertical,15)
                .background(Color.gray)
                .font(.title)
                .cornerRadius(30)
                
                Text("分數:")
                    .offset(x:110)
                Text("XX/??")
                    .offset(x:-110)
                    .foregroundColor(.white)
        }
            Text("Space")
                .foregroundColor(.white)
                .padding(.horizontal,145)
                .padding(.vertical,80)
                .background(Color.brown)
                .font(.title)
                .cornerRadius(10)
            
           
            ChoiceA()
            ChoiceB()
            ChoiceC()
            ChoiceD()
            ChoiceE()
    }
    }
    }


struct MainMultiplechioce_Previews: PreviewProvider {
    static var previews: some View {
        MainMultiplechioce().environmentObject(Multplechoicemanager())
    }
}
