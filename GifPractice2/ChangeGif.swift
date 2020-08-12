//
////  ChangeGif.swift
////  GifPractice2
////
////  Created by 下川勇輝 on 2020/05/06.
////  Copyright © 2020 Yuki Shimokawa. All rights reserved.
////
//
////一定間隔でgifを次のものへ変える機能を実装したい
//

//import Foundation
//import UIKit
//
//class ChangeGif{
//    
//    var timer:Timer?
//    
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        gifView.loadGif(name: wordsGifSoundList.GifSoundArray[wordCount])
//            // タイマーを設定
//        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ViewController.onTimer(timer:)), userInfo: nil, repeats: true)
//        
//    }
//    
//    // NSTimerによって、一定の間隔で呼び出される関数
//        @objc func onTimer(timer: Timer) {
//           
//           if wordCount < wordsGifSoundList.GifSoundArray.count - 1{
//       
//        // 表示しているgifの番号を1増やす
//           wordCount += 1
//
//           // 表示している画像の番号を元に画像を表示する
//           displayGif()
//           }else{
//               return
//           }
//           
//       }
//    
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    
//}



