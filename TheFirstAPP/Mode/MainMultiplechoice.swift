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
    @State var ANSset = false
    @State var ANScancel = true
   @State var Xset = 1000
    
   let ANS = ["A","B","B"]
    init() {
        /*
        if index == 0{
            Qu[index] = "\(Mm.MIF[index].CHTitle)"
            CHA[index] = "\(Mm.MIF[index].CH1)"
            CHB[index] = "\(Mm.MIF[index].CH2)"
            CHC[index] = "\(Mm.MIF[index].CH3)"
            CHD[index] = "\(Mm.MIF[index].CH4)"
            CHE[index] = "\(Mm.MIF[index].CH5)"
            print("index: \(index)")
        }*/
    }

    var body: some View {
        
        VStack{
            
            Button{
                Xset = 110
            }label: {
                            Text("顯現答案")
                        }
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
                            if step {
                                index = page
                            }
                        }else{
                            page = 0
                            if step {
                                index = page
                            }
                        }
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
                                ANSset = true
                                Xset = 1000
                            }else{
                                index = 0
                                print("index: \(index)")
                                print("step: \(step)")
                                step = false
                                
                            }
                        }
                    }
            }.frame(alignment:.top)//top
            ZStack{
                Text("箭頭")
                    .foregroundColor(.white)
                    .padding(.horizontal,180)
                    .padding(.vertical,15)
                    .background(Color.gray)
                    .font(.callout)
                    .cornerRadius(30)
                if ANSset == true{
                    Text("答案:\(ANS[page])")
                        .offset(x:CGFloat(Xset))
                }
                
                Text("請按")
                    .offset(x:-52)
                    .foregroundColor(.white)

                Text("開始")
                    .offset(x:-100)
                    .foregroundColor(.white)
            }//分數
            VStack {
                ZStack{
                    Text("\(Qu[page])")
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.headline)
                        .cornerRadius(10)
                }
                ZStack{
                    Text("\(CHA[page])")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                    Image(systemName: "a.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .offset(x:-130)
                    
                }
                ZStack{
                    Text("\(CHB[page])")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                    Image(systemName: "b.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .offset(x:-130)
                }
                ZStack{
                    Text("\(CHC[page])")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                    Image(systemName: "c.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .offset(x:-130)
                }
                ZStack{
                    Text("\(CHD[page])")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                    Image(systemName: "d.circle")
                        .resizable()
                        .frame(width: 40,height: 40)
                        .offset(x:-130)
                }
                ZStack{
                    Text("\(CHE[page])")
                        .padding()
                        .frame(width: 350.0)
                        .background(Color.brown)
                        .font(.title)
                        .cornerRadius(40)
                    Image(systemName: "e.circle")
                                           .resizable()
                                           .frame(width: 40,height: 40)
                                           .offset(x:-130)
                }
            }
            
        }
    }
    func Cho(){

    }
}


struct MainMultiplechioce_Previews: PreviewProvider {
    static var previews: some View {
        MainMultiplechioce()
            .environmentObject(Multplechoicemanager())
    }
}
