//
//  TestView.swift
//  TheFirstAPP
//
//  Created by macbook - 邱 on 2022/12/23.
//

import SwiftUI
struct TestView: View {
    
    @State var startAngle:Double = 0
    // since our to progress is 0.5
    //0.5 * 360 = 180
    @State var toAngle:Double = 180
    
    @State var startProgress:CGFloat = 0
    @State var toProgress:CGFloat = 0.5
    var body: some View {
        VStack{
            HStack{
                VStack(alignment: .leading, spacing: 8){
                    Text("12")
                        .font(.title.bold())
                    Text("34")
                        .foregroundColor(.gray)
                }.frame(maxWidth: .infinity,alignment: .leading)
                Button{
                    
                }label: {
                    Image("tomato")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 45,height: 45)
                        .clipShape(Circle())
                }
            }
            tomato()
                .padding(.top,50)
            
            Button{
                
            }label: {
                Text("start sleep")
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .padding(.horizontal,40)
                    .background(Color.blue,in: Capsule())
            }.padding(.top,45)
            HStack(spacing: 25){
                VStack(alignment: .leading,spacing: 8){
                    Label{
                        Text("bedtime")
                            .foregroundColor(.black)
                    }icon: {
                        Image(systemName: "moon.fill")
                            .foregroundColor(.blue)
                    }.font(.callout)
                    Text(getTime(angle:startAngle).formatted(date:.omitted,time: .shortened))
                        .font(.title2.bold())
                }.frame(maxWidth: .infinity)
                VStack(alignment: .leading,spacing: 8){
                    Label{
                        Text("wakeup")
                            .foregroundColor(.black)
                    }icon: {
                        Image(systemName: "alarm")
                            .foregroundColor(.blue)
                    }.font(.callout)
                    Text(getTime(angle:toAngle).formatted(date:.omitted,time: .shortened))
                        .font(.title2.bold())
                }.frame(maxWidth: .infinity)
                
            }.padding(.top,35)
                .padding()
                .background(.black.opacity(0.06),in:RoundedRectangle(cornerRadius:15))
                .padding(.top,35)
        }.padding()
            .frame(maxWidth: .infinity,alignment: .top)
    }
    @ViewBuilder
    func tomato()->some View{
        GeometryReader{proxy in
            let width = proxy.size.width
            ZStack{
                /*ZStack{
                    ForEach(1...60,id: \.self){index in
                        Rectangle()
                            .fill(index % 5 == 0 ? .black : .gray)
                        // 60/5 = 12 hours
                            .frame(width: 2,height: index % 5 == 0 ? 15 : 5)
                            .offset(y: (width - 60) / 2)
                            .rotationEffect(.init(degrees: Double(index) * 6))
                    }
                    let texts = [6,9,12,3]
                    ForEach(texts.indices,id: \.self){index in
                        Text("\(texts[index])")
                            .font(.caption.bold())
                            .foregroundColor(.black)
                            .rotationEffect(.init(degrees: Double(index) * -90))
                            .offset(y: (width - 90) / 2)
                        // 360 / 4 = 90
                            .rotationEffect(.init(degrees: Double(index) * 90))
                    }
                }*/
                Circle()
                    .stroke(.black.opacity(0.06),lineWidth: 40)
                //let reverseRotation = (startProgress > toProgress) ? -Double((1 - startProgress) * 360) : 0
                /*Circle()
                    .trim(from: startProgress > toProgress ? 0 : startProgress,to: toProgress + (-reverseRotation / 360))
                    .stroke(Color.blue,style: StrokeStyle(lineWidth: 40,lineCap: .round,lineJoin: .round))
                    .rotationEffect(.init(degrees: -90))
                    .rotationEffect(.init(degrees: reverseRotation))*/
                
                Image(systemName: "moon.fill")
                    .font(.callout)
                    .foregroundColor(Color.blue)
                    .frame(width: 30,height: 30)
                    .rotationEffect(.init(degrees: 90))
                    .rotationEffect(.init(degrees: -startAngle))
                    .background(.white,in:Circle())
                    .offset(x: width / 2)
                    .rotationEffect(.init(degrees: startAngle))
                    .gesture(
                        
                        DragGesture()
                            .onChanged({ value in
                                onDrag(value: value,fromSlider: true)
                            })
                    )
                    .rotationEffect(.init(degrees: -90))
                
                Image(systemName: "alarm")
                    .font(.callout)
                    .foregroundColor(Color.blue)
                    .frame(width: 30,height: 30)
                    .rotationEffect(.init(degrees: 90))
                    .rotationEffect(.init(degrees: -toAngle))
                    .background(.white,in:Circle())
                    .offset(x: width / 2)
                    .rotationEffect(.init(degrees: toAngle))
                    .gesture(
                        
                        DragGesture()
                            .onChanged({ value in
                                onDrag(value: value)
                            })
                    )
                    .rotationEffect(.init(degrees: -90))
                
                VStack(spacing: 6){
                    Text("\(getTimeDifference().0)hr")
                        .font(.largeTitle.bold())
                    Text("\(getTimeDifference().1)min")
                        .foregroundColor(.gray)
                }
                .scaleEffect(1.1)
            }
        }
        .frame(width: screenBounds().width / 1.6,height: screenBounds().width / 1.6)
    }
    func onDrag(value: DragGesture.Value,fromSlider:Bool = false){
        let vector = CGVector(dx: value.location.x, dy: value.location.y)
        // button diamter = 30
        // radius = 15
        let radians = atan2(vector.dy - 15, vector.dx - 15)
        
        var angle = radians * 180 / .pi
        if angle < 0{
            angle = 360 + angle
        }
        let progress = angle / 360
        
        if fromSlider{
            self.startAngle = angle
            self.startProgress = progress
        }else{
            self.toAngle = angle
            self.toProgress = progress
        }
    }
    //影片 13:44
    func getTime(angle: Double)->Date{
        //360 / 12 = 30
        //12 = hour
        let progress = angle / 30
        
        
        //it will be 6.05
        //6 is hour
        //0.5 is minutes
        let hour = Int(progress)
        //why 12
        //since we,re going to time for each 5 minutes net for each min
        //0.1 = 5 min
        let remainder = (progress.truncatingRemainder(dividingBy: 1) * 12).rounded()
        
        var minute = remainder * 5
        // this is because min are returning 60 (12*5)
        
        minute = (minute > 55 ? 55 : minute)
        
        let fomatter = DateFormatter()
        fomatter.dateFormat = "hh:mm:ss"
        
        if let date = fomatter.date(from: "\(hour) : \(Int(remainder)) : 00"){
            return date
        }
        
        return .init()
    }
    func getTimeDifference()->(Int,Int){
        let calendar = Calendar.current
        
        let result = calendar.dateComponents([.hour,.minute], from: getTime(angle: startAngle),to: getTime(angle: toAngle))
        
        return (result.hour ?? 0,result.minute ?? 0)
    }
}



struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}


