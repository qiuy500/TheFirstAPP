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
    @State var timeRemaining = 0 // 記錄定時器的剩餘時間
    @State var min = 0
    @State var sen = 0
    @State var x = 0
    @State var y = 0
    @State var heidht:CGFloat = 50
    @State var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect() // 建立一個計時器
    @State private var scale: Double = 300
    @State var audioPlayer: AVAudioPlayer!
    @State private var value: Double = 600
    let url = Bundle.main.url(forResource: "番茄鈴聲", withExtension: "mp3")
    @State var soundswitch = false
    var body: some View {
        
        VStack {
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

            
            }
        
        }
    }


struct ToMaToView_Previews: PreviewProvider {
    static var previews: some View {
        ToMaToView()
    }
}
