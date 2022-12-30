//
//  Slider circuiar.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2022/12/28.
//

import SwiftUI

struct Slider_circuiar: View {
    var body: some View {
        
        NavigationView{
            
            Home()
                .preferredColorScheme(.dark)
                .navigationTitle("Wallet")
        }
    }
}

struct Slider_circuiar_Previews: PreviewProvider {
    static var previews: some View {
        Slider_circuiar()
    }
}
/*struct Home : View {
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
        //size = 55 => radians = 27.5
        let radians = atan2(vector.dy - 27.5, vector.dx -27.5)
        
        var angle = radians * 180 / .pi
        
        if angle < 0{
            angle = 360 + angle
        }
        
        withAnimation(Animation.linear(duration: 0.15)){
            
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
        }
    }
}*/
struct Home : View {
    
    @State var size = UIScreen.main.bounds.width - 100
    @State var progress : CGFloat = 0
    @State var angle : Double = 0
    @State var Hour = 0
    @State var mon = 0
    @State var time = 0
    var body: some View{
        
        VStack{

            Text("\(String(format: "%.1f", angle / 360 * 2))")
                .padding()
            Text("Hours: \(String(format: "%.0f", progress * 2)) ")
                .padding()
        //min: \(CGFloat(format: "%.0f", progress * 2) - String(format: "%.1f", progress * 2))
            
            ZStack{
                
                Circle()
                    .stroke(Color("stroke"),style: StrokeStyle(lineWidth: 55, lineCap: .round, lineJoin: .round))
                    .frame(width: size, height: size)
                
                // progress....
                
                Circle()
                    .trim(from: 0, to: progress)
                    .stroke(Color.green,style: StrokeStyle(lineWidth: 55, lineCap: .butt))
                    .frame(width: size, height: size)
                    .rotationEffect(.init(degrees: -90))
                
                // Inner Finish Curve...
                
                Circle()
                    .fill(Color("stroke"))
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: -90))
                
                // Drag Circle...
                
                Circle()
                    .fill(Color.white)
                    .frame(width: 55, height: 55)
                    .offset(x: size / 2)
                    .rotationEffect(.init(degrees: angle))
                // adding gesture...
                    .gesture(DragGesture().onChanged(onDrag(value:)))
                    .rotationEffect(.init(degrees: -90))
                
                // sample $200
                Text("$" + String(format: "%.0f", progress * 200))
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
        }
    }
    
    func onDrag(value: DragGesture.Value){
        
        // calculating radians...
        
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        
        // since atan2 will give from -180 to 180...
        // eliminating drag gesture size
        // size = 55 => Radius = 27.5...
        
        let radians = atan2(vector.dy - 27.5, vector.dx - 27.5)
        
        // converting to angle...
        
        var angle = radians * 180 / .pi
        
        //var time = progress * 2
        
        // simple technique for 0 to 360...
        
        // eg = 360 - 176 = 184...
        if angle < 0{angle = 360 + angle}
        
        withAnimation(Animation.linear(duration: 0.15)){
            
            // progress...
            let progress = angle / 360
            self.progress = progress
            self.angle = Double(angle)
            let time = angle//progress * 2

        }
    }
}
