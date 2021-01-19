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
    
//AVSpeechSynthesizerをクラス変数で保持しておく、インスタンス変数だと読み上げるまえに破棄されてしまう
    var speechSynthesizer : AVSpeechSynthesizer!
    var timer:Timer?
    
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var japanWordLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var countdownLabel: UILabel!
    
    var materialList = MaterialList()
    var wordCount = 0
    

    @IBOutlet weak var manabuView: UIView!
    
    //単語の範囲を受け取る
    var receivedCellNumber = Int()
    
    //累計単語学習数を記録
    var learnedNumber = Int()
   
    //次の単語に行くまでの秒数
    var timerSec = 6.0
    //カウントダウンのラベル用
    var timerCount = 5
    var timer2 = Timer()
    
    var timerChecker = true
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        //単語の範囲を指定
        switch receivedCellNumber {
        case 0:
            wordCount = 0
        case 1:
            wordCount = 50
        case 2:
            wordCount = 100
        case 3:
            wordCount = 150
        case 4:
            wordCount = 200
        case 5:
            wordCount = 250
        case 6:
            wordCount = 300
        case 7:
            wordCount = 350
        default:
            return
        }
        
        manabuView.layer.cornerRadius = 20
        gifView.layer.cornerRadius = 20
        //materia design風の影の付け方の基本
        manabuView.layer.shadowColor = UIColor.black.cgColor
        manabuView.layer.shadowRadius = 1
        manabuView.layer.shadowOpacity = 0.5
        manabuView.layer.shadowOffset = CGSize(width: 1, height: 1)
     
        displayGifWordJapan()
        playSoundMethod()
        
        
        if UserDefaults.standard.object(forKey: "secForManabu") != nil{
            timerSec = UserDefaults.standard.object(forKey: "secForManabu") as! Double
//            timerCount = UserDefaults.standard.object(forKey: "secForManabu") as! Int - 1
            
        }
        
        setTimer()
        setTimer2()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if UserDefaults.standard.object(forKey: "learnedNumber") != nil{
            learnedNumber = UserDefaults.standard.object(forKey: "learnedNumber") as! Int
        }
        
        if UserDefaults.standard.object(forKey: "secForManabu") != nil{
            timerSec = UserDefaults.standard.object(forKey: "secForManabu") as! Double
//            timerCount = UserDefaults.standard.object(forKey: "secForManabu") as! Int - 1
            
        }
        
    }
    

    
    @IBAction func playSound(_ sender: Any) {
        playSoundMethod()
    }
    
    
    @IBAction func close(_ sender: Any) {
//        endLearning()
        timer?.invalidate()
        timer2.invalidate()
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func nextWord(_ sender: Any) {
        NEXTWORD()
    }
    
    

    @IBAction func beforeWord(_ sender: Any) {
        BEFOREWORD()
    }
    
    func playSoundMethod(){
        // AVSpeechSynthesizerのインスタンス作成
        self.speechSynthesizer = AVSpeechSynthesizer()
        // 読み上げる、文字、言語などの設定
        let utterance = AVSpeechUtterance(string:materialList.TOEIC600List[wordCount].Words) // 読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // 言語
        utterance.rate = 0.5; // 読み上げ速度
        utterance.pitchMultiplier = 1.3; // 読み上げる声のピッチ
        utterance.preUtteranceDelay = 0; // 読み上げるまでのため
        self.speechSynthesizer.speak(utterance)
    }
    
    
    @IBAction func stopAndRestartButton(_ sender: Any) {
        //一時停止する
        timer2.invalidate()
        
        if timerChecker == true{
            
            self.timer?.invalidate()
            timerChecker = false
            
            //アイコンを▶️にする
            let image = UIImage(named: "play3")
            stopButton.setImage(image, for: UIControl.State.normal)
        
            //戻る進むボタン無効化
            nextButton.isEnabled = false
            backButton.isEnabled = false
            
        }else if timerChecker == false{
            //再開させる
            setTimer()
            setTimer2()
            timerChecker = true
            //アイコンを⏸にする
            let image = UIImage(named: "pause2")
            stopButton.setImage(image, for: UIControl.State.normal)
            
            //戻る進むボタン有効化
            nextButton.isEnabled = true
            backButton.isEnabled = true
            
        }
        
    }
    

    func endLearning(){
        //学んだ単語数を保存
        //終了
        timer?.invalidate()
        timer2.invalidate()
        showCongratsAlert()
    }
    
    func NEXTWORD(){
        
        //配列のカウントまでとしてout of rangeしないようにする
            if wordCount == materialList.TOEIC600List.count - 1{
                endLearning()
                //下の処理を続けないようにreturn
                return
            }
        
        //たまに即次の単語いっちゃう時があるため。
        timer?.invalidate()
        
        //タイマー再開
        setTimer()
        setTimer2()
  
        //範囲終了なら終わる。そうでないなら続ける（次の単語出す）
        endOrContinue()

 
    }
    
    func BEFOREWORD(){
        //問題のはじめは戻るボタン押せない様にする
        if wordCount == 0 || wordCount == 50 || wordCount == 100 || wordCount == 150 || wordCount == 200 || wordCount == 250 || wordCount == 300 || wordCount == 350{
            return
        }
        
        wordCount -= 1
        displayGifWordJapan()
        playSoundMethod()
        
        //たまに即次の単語いっちゃう時があるため。
        timer?.invalidate()
        
        //タイマー再開
        setTimer()
        setTimer2()
    }
    
    
    
    func displayGifWordJapan(){
        //単語の番号、gif,英単語とその訳を表示する
        numberLabel.text = String("No. \(wordCount + 1)")
        gifView.loadGif(name: materialList.TOEIC600List[wordCount].Words)
        wordLabel.text = String(materialList.TOEIC600List[wordCount].Words)
        japanWordLabel.text = String(materialList.TOEIC600List[wordCount].japanWords)
    }
    
    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: timerSec, target: self, selector: #selector(ShuffleManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    
    func setTimer2(){
        //残り時間を表示
        timer2.invalidate()
        countdownLabel.textColor = .black
        timerCount = Int(timerSec - 1)
        
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ShuffleManabuViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
        countdownLabel.text = String(timerCount)
    }
    
    @objc func onTimer(timer: Timer) {
        //配列のカウントまでとしてout of rangeしないようにする
        if wordCount == materialList.TOEIC600List.count - 1{
            endLearning()
            //下の処理を続けないようにreturn
            return
        }
        
        setTimer2()
        endOrContinue()
        
//        setTimer2()
    }
    
    
    
    //残り時間のラベル
    @objc func onTimer2(timer:Timer){
        timerCount -= 1
        //ラベルに表示
        countdownLabel.text = String(timerCount)
        if timerCount == 0 {
            countdownLabel.textColor = .red
        }
    }
    
    func endOrContinue(){
                switch receivedCellNumber {
                case 0:
                    if wordCount == 49{
                        //終了
                        endLearning()
                    }else{
                        //最後の単語の次の音が鳴らないようにこういうふうに書いてる。
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 1:
                    if wordCount == 99{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 2:
                    if wordCount == 149{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 3:
                    if wordCount == 199{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 4:
                    if wordCount == 249{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 5:
                    if wordCount == 299{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 6:
                    if wordCount == 349{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                case 7:
                    if wordCount == 399{
                        endLearning()
                    }else{
                        wordCount += 1
                        displayGifWordJapan()
                        playSoundMethod()
                    }
                default:
                    break
                }
        
    
    }
    
    
    func showCongratsAlert(){
        //単語最後まで行った時に「完了」を示すアラートを出す
        let alertController = UIAlertController(title: "お疲れ様でした！", message: "引き続き頑張ってくださいね！", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "ホームへ", style: .default) { (alert) in
            
            //学んだ数記録
            self.learnedNumber += 50
            UserDefaults.standard.setValue(self.learnedNumber, forKey: "learnedNumber")
            self.dismiss(animated: true, completion: nil)
        }
        
        let action2 = UIAlertAction(title: "まだ続ける", style: .default) { (alert) in
            
            self.timer?.invalidate()
            self.timer2.invalidate()
            return
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        self.present(alertController, animated: true,completion: nil)
        
    }
    
    
    
}
