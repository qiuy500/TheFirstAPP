//
//  ToMoToSound.swift
//  TheFirstAPP
//
//  Created by 暨大附中１ on 2022/12/19.
//

import SwiftUI
import AVFoundation

struct ToMoToSound: View {
    var audioPlayer: AVAudioPlayer!
    let url = Bundle.main.url(forResource: "番茄鈴聲", withExtension: "mp3")
    
    var body: some View {
        
        if timeRemaining = 0 {
          audioPlayer = try AVAudioPlayer(contentsOf: url!)
          audioPlayer.prepareToPlay()
        } 
    }
}

struct ToMoToSound_Previews: PreviewProvider {
    static var previews: some View {
        ToMoToSound()
    }
}
