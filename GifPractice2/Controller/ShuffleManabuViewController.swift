//
//  ManabuViewController.swift
//  FireStoreEitangoApp
//
//  Created by 下川勇輝 on 2020/10/11.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit
import Photos
import AVFoundation
import Lottie

class ShuffleManabuViewController: UIViewController {
    
    @IBOutlet weak var numberLabel: UILabel!
    // AVSpeechSynthesizerをクラス変数で保持しておく、インスタンス変数だと読み上げるまえに破棄されてしまう
    var speechSynthesizer : AVSpeechSynthesizer!
    @IBOutlet weak var manabuImageView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var japanWordLabel: UILabel!
    @IBOutlet weak var manabuView: UIView!
    
    var materialList = MaterialList()
    var wordCount = 0
    var refString = String()
    
    var animationView = AnimationView()
    
    //単語の範囲を受け取る
    var receivedCellNumber = Int()
    
    //累計単語学習数を記録
    var learnedNumber = Int()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
       
        
        
        
        
        //単語の範囲を指定
        switch receivedCellNumber {
        case 0:
            wordCount = 0
        case 1:
            wordCount = 20
        case 2:
            wordCount = 40
        case 3:
            wordCount = 60
        case 4:
            wordCount = 80
        //        case 5:
        //            wordCount = 100
        default:
            return
        }
        
        manabuView.layer.cornerRadius = 20
        manabuImageView.layer.cornerRadius = 20
        //materia design風の影の付け方の基本
        manabuView.layer.shadowColor = UIColor.black.cgColor
        manabuView.layer.shadowRadius = 1
        manabuView.layer.shadowOpacity = 0.5
        manabuView.layer.shadowOffset = CGSize(width: 1, height: 1)
        //単語の番号を表示
        numberLabel.text = String("No. \(wordCount + 1)")
        wordLabel.text = materialList.TOEIC600NounList[wordCount].Words
        japanWordLabel.text = materialList.TOEIC600NounList[wordCount].japanWords
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
    }
    

    
    
    @IBAction func playSound(_ sender: Any) {
        
        // AVSpeechSynthesizerのインスタンス作成
        self.speechSynthesizer = AVSpeechSynthesizer()
        // 読み上げる、文字、言語などの設定
        let utterance = AVSpeechUtterance(string:materialList.TOEIC600NounList[wordCount].Words) // 読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // 言語
        utterance.rate = 0.5; // 読み上げ速度
        utterance.pitchMultiplier = 1.3; // 読み上げる声のピッチ
        utterance.preUtteranceDelay = 0; // 読み上げるまでのため
        self.speechSynthesizer.speak(utterance)
        
    }
    
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func nextWord(_ sender: Any) {
        NEXTWORD()
        
    }
    
    @IBAction func beforeWord(_ sender: Any) {
        BEFOREWORD()
    }
    

    
    func endLearning(){
        //ログイン済みであれば学んだ単語数をfirestoreに送信する
        if Auth.auth().currentUser?.uid != nil{
            //学んだ単語数をfirestoreに送信する
            //ドキュメントの中身を一部更新する
            db.collection("Profile").document(refString).updateData(["learnedNumber" : learnedNumber + 20]) { (error) in
                print(error.debugDescription)
                return
            }
            
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func NEXTWORD(){
        switch receivedCellNumber {
        case 0:
            if wordCount == 19{
                //終了
                endLearning()
            }
        case 1:
            if wordCount == 39{
                endLearning()
            }
        case 2:
            if wordCount == 59{
                endLearning()
            }
        case 3:
            if wordCount == 79{
                endLearning()
            }
        case 4:
            if wordCount == 99{
                endLearning()
            }
        default:
            break
        }

        wordCount += 1
        getImages(keyword: materialList.TOEIC600NounList[wordCount].Words)
        wordLabel.text = materialList.TOEIC600NounList[wordCount].Words
        japanWordLabel.text = materialList.TOEIC600NounList[wordCount].japanWords
        //単語の番号を表示
        numberLabel.text = String("No. \(wordCount + 1)")
    }
    
    func BEFOREWORD(){
        //問題のはじめは戻るボタン押せない様にする
        if wordCount == 0 || wordCount == 20 || wordCount == 40 || wordCount == 60 || wordCount == 80{
            return
        }
        
        wordCount -= 1
        getImages(keyword: materialList.TOEIC600NounList[wordCount].Words)
        wordLabel.text = materialList.TOEIC600NounList[wordCount].Words
        japanWordLabel.text = materialList.TOEIC600NounList[wordCount].japanWords
        //単語の番号を表示
        numberLabel.text = String("No. \(wordCount + 1)")
    }
    
    
 
    
    
    
}
