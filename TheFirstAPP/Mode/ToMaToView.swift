//
//  ToMaToView.swift
//  TheFirstAPP
//
//  Created by 暨大附中２ on 2022/12/13.
//

import SwiftUI
import AVFoundation
struct ToMaToView: View {
    @State var isRunning = false // 記錄定時器是否運行
    @State private var timeRemaining = 600 // 記錄定時器的剩餘時間
    @State var hour:String = "0"
    @State var heidht:CGFloat = 50
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect() // 建立一個計時器
    @State private var scale: Double = 300
    @State var audioPlayer: AVAudioPlayer!
    @State private var value: Double = 600
    @State var startAngle:Double = 0
    @State var toAngle:Double = 180
    @State var width:CGFloat = 0
    @State var startProgress:CGFloat = 0
    @State var toProgress:CGFloat = 0.5
    let url = Bundle.main.url(forResource: "番茄鈴聲", withExtension: "mp3")
    @State var soundswitch = false
    var body: some View {
        
        /*VStack {
         // 定義一個文本標籤，用於顯示定時器的剩餘時間
         //Text("\(soundswitch)")
         //Text("x = \(x)")
         //Text("y = \(y)")
         let scaleString = scale.formatted(.number.precision(.fractionLength(2)))
         Text(scaleString)
         
         /*Image("tomato")
          .frame(alignment: .leading)
          .padding()*/
         Circle()
         .trim(from: 0, to: CGFloat(scale))
         .stroke(Color.red, style: StrokeStyle(lineWidth: 20, lineCap: .round))
         .frame(width: 200, height: 200)
         
         Slider(value: $scale, in: 1...600)
         
         //Slider(value: $scale, in: 1...300)
         /*Image(systemName: "square.fill")
          .resizable()
          //.scaleEffect(scale)
          .foregroundColor(Color.red)
          .frame(width: 10,height: scale)*/
         Text("剩餘時間：\(timeRemaining / 60) 分鐘\(timeRemaining - (timeRemaining / 60 * 60))秒")
         .font(.largeTitle)
         .padding(.bottom, 50)
         .onReceive(timer) { _ in // 每次收到 timer 發送的事件時
         if isRunning{
         if self.timeRemaining > 0 { // 如果計時器還沒有結束
         self.timeRemaining -= 1 // 將剩餘時間減一秒
         if scale > 0{
         scale -= 1
         }
         }else{//計時器結束
         self.isRunning = false
         soundswitch = true //開叫
         }
         }else{
         //timeRemaining = min * 60 + sen
         timeRemaining = Int(scale)
         heidht = CGFloat(self.timeRemaining)
         }
         /* if timeRemaining == 0{
          soundswitch = true //開叫
          }*/
         if soundswitch == true{
         do{
         audioPlayer = try AVAudioPlayer(contentsOf: url!)
         audioPlayer.prepareToPlay()
         audioPlayer.play() // 在這裡加入 audioPlayer.play() 方法
         }catch {
         // 如果發生錯誤，則在這裡處理
         
         }
         }
         // 定義一個按鈕，用於控制定時器的運行
         /*if x == 0 || x != 0{
          if x > y {
          y += 3
          }else{
          x += 3
          }
          }*/
         }
         Button(action: {
         if isRunning {
         timeRemaining = Int(scale)
         }else{
         timeRemaining = Int(scale)
         
         }
         }){
         Text("reset")
         }.font(.custom("", size: 50))
         
         Button(action: {
         // 點擊按鈕時，切換定時器的運行狀態
         self.isRunning.toggle()
         if isRunning{
         timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()//開始計時
         }else{
         self.timer.upstream.connect().cancel()//停止計時
         
         }
         }) {
         // 根據定時器的運行狀態，顯示不同的按鈕文本
         Group {
         if isRunning {
         Text("停止")
         }else{
         Text("开始")
         }
         }
         
         }.font(.custom("", size: 50))
         
         // 定義一個文本框，用於輸入定時器的時間
         /*HStack {
          Text("輸入分鐘")
          TextField("輸入分鐘", value: $min, formatter: NumberFormatter())
          .keyboardType(.numberPad)
          Text("輸入秒")
          TextField("輸入秒", value: $sen, formatter: NumberFormatter())
          .keyboardType(.numberPad)
          }*/
         
         
         }*/
        
        VStack{
            tomato()
            Circle()
                .stroke(.black.opacity(0.06),lineWidth: 40)
            Text("\(CGFloat(toProgress * 2) * 2 * 60 * 60)")
                .padding()
            Text("時間：\(Int(CGFloat(toProgress * 2) * 2 * 60 * 60) / 3600 / 2) 小時 \((Int(CGFloat(toProgress * 2) * 2 * 60 * 60) / 60) - (Int(CGFloat(toProgress * 2) * 2 * 60 * 60) / 3600 * 60) ) 分鐘\(Int(CGFloat(toProgress * 2) * 2 * 60 * 60) - (Int(CGFloat(toProgress * 2) * 2 * 60 * 60) / 60 * 60))秒")
            Text("\(toProgress)")
            TextField("輸入時間", text: Binding<String>(get: {
                return String(self.timeRemaining)
            }, set: {
                if let newValue = Int($0) {
                    self.timeRemaining = newValue
                    self.timeRemaining = Int(CGFloat(toProgress * 2) * 2 * 60 * 60)
                }
            }))
            .keyboardType(.numberPad)
            Text("剩餘時間：\(timeRemaining / 3600 / 2) 小時 \((timeRemaining / 60) - (timeRemaining / 3600 * 60) ) 分鐘\(timeRemaining - (timeRemaining / 60 * 60))秒")
            //.font(.largeTitle)
                .padding(.bottom, 50)
                .onReceive(timer) { _ in // 每次收到 timer 發送的事件時
                    if isRunning{
                        if self.timeRemaining > 0 { // 如果計時器還沒有結束
                            self.timeRemaining -= 5 // 將剩餘時間減一秒
                            toProgress -= 5 / 2 / 2 / 3600
                            if scale > 0{
                                scale -= 1
                            }
                        }else{//計時器結束
                            self.isRunning = false
                            soundswitch = true //開叫
                            
                        }
                    }else{
                        //timeRemaining = min * 60 + sen
                        //hour = String(self.timeRemaining)
                        self.timeRemaining = Int(CGFloat(toProgress * 2) * 2 * 60 * 60)
                    }
                }
            Button{
                if isRunning == false{
                    isRunning = true
                }else{
                    isRunning = false
                }
            }label: {
                Text("dvdv")
            }
        }.frame(width: screenBounds().width / 1.6,height: screenBounds().width / 1.6)
        
        
    }
    func tomato()->some View{
        GeometryReader{proxy in
            let width = proxy.size.width
            ZStack{
                ZStack{
                    ForEach(1...60,id: \.self){index in
                        Rectangle()
                            .fill(index % 5 == 0 ? .black : .gray)
                        // 60/5 = 12 hours
                            .frame(width: 2,height: index % 5 == 0 ? 15 : 5)
                            .offset(y: (width - 60) / 2)
                            .rotationEffect(.init(degrees: Double(index) * 6))
                    }
                    let texts = [1,2]
                    ForEach(texts.indices,id: \.self){index in
                        Text("\(texts[index])")
                        
                            .font(.title3)
                            .foregroundColor(.black)
                            .rotationEffect(.init(degrees: Double(index) * 180))
                            .offset(y: (width - 90) / 2)
                        // 360 / 4 = 90
                            .rotationEffect(.init(degrees: Double(index) * 180))
                    }
                }
                Circle()
                    .stroke(.black.opacity(0.06),lineWidth: 40)
                let reverseRotation = (startProgress > toProgress) ? -Double((1 - startProgress) * 360) : 0
                Circle()
                    .trim(from: startProgress > toProgress ? 0 : startProgress,to: toProgress + (-reverseRotation / 360))
                    .stroke(Color.orange,style: StrokeStyle(lineWidth: 40,lineCap: .round,lineJoin: .round))
                    .rotationEffect(.init(degrees: -90))
                    .rotationEffect(.init(degrees: reverseRotation))
                
                Image(systemName: "moon.fill")
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
                                onDrag(value: value,fromSlider: false)
                            })
                    )
                    .rotationEffect(.init(degrees: -90))
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
    
}


struct ToMaToView_Previews: PreviewProvider {
    static var previews: some View {
        ToMaToView()
    }
}
extension View{
    func screenBounds()->CGRect{
        return UIScreen.main.bounds
    }
}



/*
 //
 //  Multiplechoice.swift
 //  TheFirstAPP
 //
 //  Created by 暨大附中２ on 2022/12/13.
 //

 import SwiftUI



 struct Multiplechoice: View {
     @State private var value: Double = 0.5
     @State private var dragging = false

     var body: some View {
         ZStack {
             Circle()
                 .fill(LinearGradient(gradient: Gradient(colors: [.green, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
                 .frame(width: 200, height: 200)
             Text("\(value)")
             Circle()
                 .fill(Color.gray)
                 .frame(width: 20, height: 20)
                 .offset(x: (value - 0.5) * 200, y: 0)
                 .gesture(
                     DragGesture()
                         .onChanged { value in
                             self.dragging = true
                             self.value = min(1, max(0, value.location.x / 200 + 0.5))
                         }
                         .onEnded { _ in
                             self.dragging = false
                         }
                 )
             Circle()
                 .trim(from: 0, to: CGFloat(value))
                 .stroke(Color.red, style: StrokeStyle(lineWidth: 20, lineCap: .round))
                 .frame(width: 200, height: 200)
         }
     }
 }
 struct Multiplechoice_Previews: PreviewProvider {
     static var previews: some View {
         Multiplechoice()
     }
 }

 */
