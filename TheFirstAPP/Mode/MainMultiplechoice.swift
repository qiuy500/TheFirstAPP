//
//  MainMultiplechoice.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2023/2/14.
//

import SwiftUI

struct MainMultiplechioce: View {
    @EnvironmentObject var Mm :Multplechoicemanager
    @State var Qu = [" ","",""]
    @State var CHA = [" ","",""]
    @State var CHB = [" ","",""]
    @State var CHC = [" ","",""]
    @State var CHD = [" ","",""]
    @State var CHE = [" ","",""]
    @State var page = 0
    @State var index = 0
    @State var step = true
    init(){
        Cho()
    }
    var body: some View {

        VStack{
            Text("\(index)")
            HStack{
                Image(systemName:"house.fill")
                    .resizable()
                    .frame(width: 35,height: 35)
                    .offset(x:20)
                Text("Test")
                    .font(.title)
                    .padding(.all)
                    .offset(x:115)
                Spacer()
                Image(systemName:"arrowshape.right.fill")
                    .resizable()
                    .frame(width: 40,height: 40)
                    .offset(x:-20)
                    .onTapGesture {
                        if (page < Mm.MIF.count - 1){
                            page = page + 1
                            if !step {
                                
                                index = page
                            }
                        }else{
                            page = 0
                            if !step {
                                index = page
                            }
                        }
                    }
            }.frame(alignment:.top)//top
            ZStack{
                Text("iji")
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
            }//分數
            VStack {
                Text("\(Qu[page])")
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350.0)
                    .background(Color.brown)
                    .font(.title)
                    .cornerRadius(10)
                Text("\(CHA[page])")
                    .padding()
                    .frame(width: 350.0)
                    .background(Color.brown)
                    .font(.title)
                    .cornerRadius(40)
                Text("\(CHB[page])")
                    .padding()
                    .frame(width: 350.0)
                    .background(Color.brown)
                    .font(.title)
                    .cornerRadius(40)
                Text("\(CHC[page])")
                    .padding()
                    .frame(width: 350.0)
                    .background(Color.brown)
                    .font(.title)
                    .cornerRadius(40)
                Text("\(CHD[page])")
                    .padding()
                    .frame(width: 350.0)
                    .background(Color.brown)
                    .font(.title)
                    .cornerRadius(40)
                Text("\(CHE[page])")
                    .padding()
                    .frame(width: 350.0)
                    .background(Color.brown)
                    .font(.title)
                    .cornerRadius(40)
            }
            
            Button{
                if step{
                    print("Mm.MIF.count: \(Mm.MIF.count)")
                    if (index < Mm.MIF.count) {
                        Qu[index] = "\(Mm.MIF[index].CHTitle)"
                        CHA[index] = "\(Mm.MIF[index].CH1)"
                        CHB[index] = "\(Mm.MIF[index].CH2)"
                        CHC[index] = "\(Mm.MIF[index].CH3)"
                        CHD[index] = "\(Mm.MIF[index].CH4)"
                        CHE[index] = "\(Mm.MIF[index].CH5)"
                        print("index: \(index)")
                        index += 1
                    }else{
                        index = 0
                        print("index: \(index)")
                        print("step: \(step)")
                        step = false
                    }
                }

            }label: {
                Text("b")
            }
            
        }
    }
    func Cho(){

    }
}


struct MainMultiplechioce_Previews: PreviewProvider {
    static var previews: some View {
        MainMultiplechioce().environmentObject(Multplechoicemanager())
    }
}
