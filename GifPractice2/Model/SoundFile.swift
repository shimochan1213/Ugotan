//
//  SoundFile.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/06.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import Foundation
import AVFoundation

//音をならすための機能を実装したクラス

class SoundFile{
    
    var player:AVAudioPlayer?
    
    //ファイル名と拡張子から音を流す処理
    func playSound(fileName:String, extensionName:String){
        
        //再生する
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extensionName)
        
        do{
            
            //効果音を鳴らす
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        }catch {
            
            print("エラーや。")
            
        }
        
    }
}
