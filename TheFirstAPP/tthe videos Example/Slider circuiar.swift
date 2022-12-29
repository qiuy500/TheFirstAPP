//
//  Slider circuiar.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2022/12/28.
//

import SwiftUI

struct Slider_circuiar: View {
    var body: some View {
        VStack{
            NavigationView{
                Home()
                    .preferredColorScheme(.dark)
                    .navigationBarTitle("Wallet")
            }
        }
    }
}

struct Slider_circuiar_Previews: PreviewProvider {
    static var previews: some View {
        Slider_circuiar()
    }
}
struct Home : View {
    @State var size = UIScreen.main.bounds.width - 100
    @State var progress : CGFloat = 0
    @State var angle : Double = 0
    
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .stroke(Color.gray,style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                
                Circle()
                    .trim(from: 0, to: 0.5)
                    .stroke(Color.green,style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
             
                Circle()
                    .fill(Color.white)
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: angle))
                    .gesture(DragGesture().onChanged(onDrag(value: )))
            }
        }
    }
    
    func onDrag(value: DragGesture.Value){
        let vector = CGVector(dx: value.location.x,dy: value.location.y)
        
        let radians = atan2(vector.dy, vector.dx)
        
        let angle = radians * 180 / .pi
        
        withAnimation(Animation.linear(duration: 0.15)){
            self.angle = Double(angle)
        }
    }
}
