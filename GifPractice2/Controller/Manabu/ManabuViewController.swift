//
//  ManabuViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/12.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.

import UIKit
import AVFoundation

class ManabuViewController: UIViewController, AVAudioPlayerDelegate {
    
    @IBOutlet weak var numberLabel: UILabel!
    var audioPlayer:AVAudioPlayer!
    var soundFile = SoundFile()
    var wordCount = Int()
    let materialList = MaterialList()
    var wordList:[MaterialModel] = []
    var firstOrNot = true
    var timer:Timer?
    var timerChecker = true
    var receivedCellNumber = Int()
    var whichHinshi = String()
    var learnedNumber = 0
    var timerSec = 3.0
    
    //制限時間
    var timerCount = 2
    var timer2 = Timer()
    
    
    
    @IBOutlet var beforeViewBtn: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var japanWordLabel: UILabel!
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var countdownLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
        timerChecker = true
        beforeViewBtn.layer.cornerRadius = 10.0
        
        //初起動かどうかのチェック
        if UserDefaults.standard.object(forKey: "alreadyManabu") != nil{
            firstOrNot = UserDefaults.standard.object(forKey: "alreadyManabu") as! Bool
        }
        
        switch firstOrNot {
        
        case true:
            //初めての起動
            showAlert()
        case false:
            // タイマーを設定
        setTimer()
            
            
            
            //             タイマーを設定　制限時間カウントダウンタイマー
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ManabuViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
            countdownLabel.text = String(timerCount)
        
            
        default:
            break
        }
        
        

        
        
        
        //2回目以降の起動
        switch receivedCellNumber {
        case 0:
            wordCount = 0
        case 1:
            wordCount = 30
        case 2:
            wordCount = 60
        case 3:
            wordCount = 90
        case 4:
            wordCount = 120
        case 5:
            wordCount = 150
        default:
            break
        }
        
        playWordSound()
        displayGifWordJapan()
    }
    
    @objc func onTimer(timer: Timer) {
        
        //残り時間ラベル
        timer2.invalidate()
        setTimer2()
        
        //countが問題数最大になるならreturn
        if receivedCellNumber == 0{
            //0-30
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    showCongratsAlert()
                    return
                }
            default:
                return
            }
            
            
            
            if wordCount == 29{
                showCongratsAlert()
                return
            }else{
                
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                
            }
        }else if receivedCellNumber == 1{
            //31-60
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    showCongratsAlert()
                    return
                }
            default:
                return
            }
            
            
            
            if wordCount == 59{
                showCongratsAlert()
                return
            }else{
                
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                
            }
        }else if receivedCellNumber == 2{
            //61-90のセルが押された
            
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    showCongratsAlert()
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            if wordCount == 89{
                showCongratsAlert()
                return
            }else{
                
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                
            }
            
            
        }else if receivedCellNumber == 3{
            //91-120
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            
            if wordCount == 119{
                showCongratsAlert()
                return
            }else{
                
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                
            }
        }else if receivedCellNumber == 4{
            
            //121-150
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            
            if wordCount == 149{
                showCongratsAlert()
                return
            }else{
                
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                
            }
            
            
        }else if receivedCellNumber == 5{
            
            //151-180
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            
            if wordCount == 179{
                showCongratsAlert()
                return
            }else{
                
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                
            }
            
            
        }
    }
    
    
    //残り時間のラベル
    @objc func onTimer2(timer:Timer){
        timerCount -= 1
        //ラベルに表示
        countdownLabel.text = String(timerCount)
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if UserDefaults.standard.object(forKey: "learnedNumber") != nil{
            learnedNumber = UserDefaults.standard.object(forKey: "learnedNumber") as! Int
        }
    }
    

    
    
    
    
    @IBAction func beforeQuestion(_ sender: Any) {
        
        timer2.invalidate()
        setTimer2()
        
        //問題のはじめは戻るボタン押せない様にする
        if wordCount == 0 || wordCount == 30 || wordCount == 60 || wordCount == 90 || wordCount == 120 || wordCount == 150 || wordCount == 180{
            return
        }else{
            //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
            self.timer?.invalidate()
            wordCount -= 1
            playWordSound()
            
            //0-30ならば
            if receivedCellNumber == 0{
                                
                displayGifWordJapan()
                //タイマー再開
               setTimer()
            }else if receivedCellNumber == 1{
                //31-60
                
                displayGifWordJapan()
                //タイマー再開
                setTimer()
                
            }else if receivedCellNumber == 2 {
                //61-90
                displayGifWordJapan()
                setTimer()
                
                
            }else if receivedCellNumber == 3{
                //91-120
                displayGifWordJapan()
                setTimer()
                
            }else if receivedCellNumber == 4{
                
                displayGifWordJapan()
                setTimer()
                
                
                
            }else if receivedCellNumber == 5{
                
                displayGifWordJapan()
                setTimer()
                
            }
            
            
        }
        
    }
    
    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: timerSec, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    func setTimer2(){
        //残り時間を表示
       
        timerCount = 2
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ManabuViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
        countdownLabel.text = String(timerCount)
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
    
    
    @IBAction func nextWordsButton(_ sender: Any) {
        
        
        timer2.invalidate()
        setTimer2()
        
        //countが問題数最大になるならreturn
        if receivedCellNumber == 0{
            //0-30
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    showCongratsAlert()
                    return
                }
            default:
                return
            }
            
            
            
            if wordCount == 29{
                showCongratsAlert()
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                //タイマー再開
                setTimer()
            }
        }else if receivedCellNumber == 1{
            //31-60
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    showCongratsAlert()
                    return
                }
            default:
                return
            }
            
            
            
            if wordCount == 59{
                showCongratsAlert()
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                //タイマー再開
                setTimer()
            }
        }else if receivedCellNumber == 2{
            //61-90のセルが押された
            
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    showCongratsAlert()
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            if wordCount == 89{
                showCongratsAlert()
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                //タイマー再開
                setTimer()
            }
            
            
        }else if receivedCellNumber == 3{
            //91-120
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            if wordCount == 119{
                showCongratsAlert()
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                //タイマー再開
                setTimer()
            }
        }else if receivedCellNumber == 4{
            
            //121-150
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    showCongratsAlert()
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            
            if wordCount == 149{
                showCongratsAlert()
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                //タイマー再開
                setTimer()
            }
            
            
        }else if receivedCellNumber == 5{
            
            //151-180
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            
            switch whichHinshi {
            case "verb":
                if wordCount == materialList.TOEIC600verbList.count - 1{
                    return
                }
            case "noun":
                if wordCount == materialList.TOEIC600NounList.count - 1{
                    return
                }
            case "adjective":
                
                if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                    return
                }
                
            case "adverb":
                if wordCount == materialList.TOEIC600AdverbList.count - 1{
                    return
                }
            case "others":
                if wordCount == materialList.TOEIC600OthersList.count - 1{
                    return
                }
            default:
                return
            }
            
            
            if wordCount == 179{
                showCongratsAlert()
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                playWordSound()
                displayGifWordJapan()
                //タイマー再開
                setTimer()
            }
            
            
        }
        
        
    }
    
    func avoidOutOfRange(){
        switch whichHinshi {
        case "verb":
            if wordCount == materialList.TOEIC600verbList.count - 1{
                return
            }
        case "noun":
            if wordCount == materialList.TOEIC600NounList.count - 1{
                return
            }
        case "adjective":
            
            if wordCount == materialList.TOEIC600AdjectiveList.count - 1{
                return
            }
            
        case "adverb":
            if wordCount == materialList.TOEIC600AdverbList.count - 1{
                return
            }
        case "others":
            if wordCount == materialList.TOEIC600OthersList.count - 1{
                return
            }
        default:
            break
        }
    }
    
    
    @IBAction func soundButton(_ sender: Any) {
        playWordSound()
    }
    
    
    
    func playWordSound() {
        //単語の音声流す
        
        switch whichHinshi {
        case "verb":
            
            soundFile.playSound(fileName: materialList.TOEIC600verbList[wordCount].Words, extensionName: "mp3")
            
        case "noun":
            soundFile.playSound(fileName: materialList.TOEIC600NounList[wordCount].Words, extensionName: "mp3")
            
        case "adjective":
            soundFile.playSound(fileName: materialList.TOEIC600AdjectiveList[wordCount].Words, extensionName: "mp3")
            
        case "adverb":
            
            soundFile.playSound(fileName: materialList.TOEIC600AdverbList[wordCount].Words, extensionName: "mp3")
            
        case "others":
            soundFile.playSound(fileName: materialList.TOEIC600OthersList[wordCount].Words, extensionName: "mp3")
            
        default:
            break
        }
        
    }
    
    func displayGifWordJapan(){
        //単語の番号、gif,英単語とその訳を表示する
                
        numberLabel.text = String("No. \(wordCount + 1)")
        
        switch whichHinshi {
        
        
        case "verb":
            gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
            wordLabel.text = String(materialList.TOEIC600verbList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600verbList[wordCount].japanWords)
            
        case "noun":
            gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
            wordLabel.text = String(materialList.TOEIC600NounList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600NounList[wordCount].japanWords)
            
        case "adjective":
            gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
            wordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].japanWords)
            
        case "adverb":
            gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
            wordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].japanWords)
            
        case "others":
            gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
            wordLabel.text = String(materialList.TOEIC600OthersList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600OthersList[wordCount].japanWords)
            
        default:
            break
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backToRange(_ sender: Any) {
        self.timer?.invalidate()
        //ナビゲーションバー再表示
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationController?.popViewController(animated: true)
    }
    
    
    
    func showAlert(){
        //テストの説明を表示
        
        let alertController = UIAlertController(title: "はじめまして", message: "3秒で自動的に次の単語が出ます。1単語あたり2,3回音読ができると良いペースです。流れてくる音声に続いて「eat食べる、eat食べる」という風に音読します。では、頑張って下さい！", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "はい", style: .default) { (alert) in
            
            //タイマースタート
            self.setTimer()
            
            
            
        }
        
        alertController.addAction(action1)
        
        //ユーザーデフォルに起動した情報を記録
        firstOrNot = false
        UserDefaults.standard.set(firstOrNot, forKey: "alreadyManabu")
        self.present(alertController, animated: true,completion: nil)
    }
    
    
    func showCongratsAlert(){
        
        //単語最後まで行った時に「完了」を示すアラートを出す
        
        let alertController = UIAlertController(title: "お疲れ様でした！", message: "引き続き頑張ってくださいね！", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "ホームへ", style: .default) { (alert) in
            
            //学んだ数記録
            self.learnedNumber += 30
            UserDefaults.standard.setValue(self.learnedNumber, forKey: "learnedNumber")
            
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        let action2 = UIAlertAction(title: "範囲選択へ", style: .default) { (alert) in
            
            //学んだ数記録
            self.learnedNumber += 30
            UserDefaults.standard.setValue(self.learnedNumber, forKey: "learnedNumber")
            
            self.navigationController?.popViewController(animated: true)
            //ナビゲーションバー再表示
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
        let action3 = UIAlertAction(title: "まだ続ける", style: .default) { (alert) in
            return
        }
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        self.present(alertController, animated: true,completion: nil)
        
    }
    
    
}









