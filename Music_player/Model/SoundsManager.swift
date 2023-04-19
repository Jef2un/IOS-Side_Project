//
//  soundsManager.swift
//  Music_player
//
//  Created by 林帥帥 on 2023/4/18.
//
import SwiftUI
import Foundation
import AVKit

class SoundsManager: ObservableObject{
    //在不創建 Class 的情況下，我們可以直接訪問該參數
    @Published var isPlay: Bool = false
    @Published var progress: Float = 0.0
    @Published var showSheet: Bool = false
    //發布到時候在music box顯示
    var player:AVAudioPlayer?
    
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            guard let player = player else { return }
            let currentTime = Float(player.currentTime)
            let totalTime = Float(player.duration)
            progress = currentTime / totalTime
        }
    }
    
    func playSound(songs: String){
        guard let url = Bundle.main.url(forResource: songs, withExtension: ".mp3") else {return}
        //嘗試get this url如果為空那就直接return
        do{

            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
            //試著播放
            isPlay = true
            startTimer()

        }catch{
            print(error)
        }
    }
    
    func pauseMusic() {
        guard let player = player else { return }
        if player.isPlaying {
            player.pause()
            isPlay = false
        } else {
            player.play()
            isPlay = true
        }
    }
}
