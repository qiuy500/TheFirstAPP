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
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect() // 建立一個計時器
    var audioPlayer: AVAudioPlayer!
    let url = Bundle.main.url(forResource: "番茄鈴聲", withExtension: "mp3")
    var soundswitch = false

    var body: some View {
        
        VStack {
            // 定義一個文本標籤，用於顯示定時器的剩餘時間
            Image("tomato")
                .frame(width: 90, height: 30,alignment: .center)
                .foregroundColor(Color.red)
            Text("剩餘時間：\(timeRemaining / 60) 分鐘\(timeRemaining - (timeRemaining / 60 * 60))秒")
                .font(.largeTitle)
                .padding(.bottom, 50)
                .onReceive(timer) { _ in // 每次收到 timer 發送的事件時
                    if isRunning{
                        if self.timeRemaining > 0 { // 如果計時器還沒有結束
                            self.timeRemaining -= 1 // 將剩餘時間減一秒
                        }
                    }

                    // 定義一個按鈕，用於控制定時器的運行
                }
            Button(action: {
                // 點擊按鈕時，切換定時器的運行狀態
                self.isRunning.toggle()
            }) {
                // 根據定時器的運行狀態，顯示不同的按鈕文本
                Group {
                    if isRunning {
                        Text("停止")
                    }
                    if !isRunning {
                        Text("开始")
                    }
                }

            }
            .font(.custom("", size: 50))
            
            // 定義一個文本框，用於輸入定時器的時間
            TextField("輸入時間", value: $timeRemaining, formatter: NumberFormatter())
                .keyboardType(.numberPad)
                .padding(.top, 50)
            if timeRemaining == 0{
                soundswitch = true
            }
             if soundswitch = true{
                do{
                    audioPlayer = try AVAudioPlayer(contentsOf: url!)
                    audioPlayer.prepareToPlay()
                    audioPlayer.play() // 在這裡加入 audioPlayer.play() 方法
                }catch {
                    // 如果發生錯誤，則在這裡處理
                }
            }
        }
    }
}

struct ToMaToView_Previews: PreviewProvider {
    static var previews: some View {
        ToMaToView()
    }
}
