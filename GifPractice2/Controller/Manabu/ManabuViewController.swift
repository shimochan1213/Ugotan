//
//  ManabuViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/12.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//












import UIKit
import AVFoundation

//verbを120まで入れることが大前提！！
//品詞関連の処理のところをかたっぱしからswitch文で分ければよくね？？



class ManabuViewController: UIViewController, AVAudioPlayerDelegate {
    
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
    
    @IBOutlet weak var beforeViewBtn: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var soundButton: UIButton!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var japanWordLabel: UILabel!
    
    @IBOutlet weak var gifView: UIImageView!
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
            
            switch receivedCellNumber {
            case 0:
                wordCount = 0
            case 1:
                wordCount = 31
            case 2:
                wordCount = 61
            case 3:
                wordCount = 91
            case 4:
                wordCount = 121
            case 5:
                wordCount = 151
            default:
                return
            }
            
            switch whichHinshi {
            case "verb":
                wordLabel.text = String(materialList.TOEIC600verbList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600verbList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600verbList[wordCount].Words )
                
            case "noun":
                wordLabel.text = String(materialList.TOEIC600NounList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600NounList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600NounList[wordCount].Words )
                
            case "adjective":
                wordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600AdjectiveList[wordCount].Words )
                
            case "adverb":
                wordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600AdverbList[wordCount].Words )
                
                
            case "others":
                wordLabel.text = String(materialList.TOEIC600OthersList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600OthersList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600OthersList[wordCount].Words )
                
            default:
                return
            }
            
            
        case false:
            //2回目以降の起動
            switch receivedCellNumber {
            case 0:
                wordCount = 0
            case 1:
                wordCount = 31
            case 2:
                wordCount = 61
            case 3:
                wordCount = 91
            case 4:
                wordCount = 121
            case 5:
                wordCount = 151
            default:
                return
            }
            
            
            switch whichHinshi {
            case "verb":
                wordLabel.text = String(materialList.TOEIC600verbList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600verbList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600verbList[wordCount].Words )
                
            case "noun":
                wordLabel.text = String(materialList.TOEIC600NounList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600NounList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600NounList[wordCount].Words )
                
            case "adjective":
                wordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600AdjectiveList[wordCount].Words )
                
            case "adverb":
                wordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600AdverbList[wordCount].Words )
                
                
            case "others":
                wordLabel.text = String(materialList.TOEIC600OthersList[wordCount].Words)
                japanWordLabel.text = String(materialList.TOEIC600OthersList[wordCount].japanWords)
                gifView.loadGif(name:materialList.TOEIC600OthersList[wordCount].Words )
                
            default:
                return
            }
            
            // タイマーを設定
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            
            
            
            
            
            
        default: return
            
            
        }
        
        
        
    }
    
    
    
    
    // NSTimerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer) {
        
        
        //0-30
        if receivedCellNumber == 0 && wordCount < 30{
            
            // 表示しているgifの番号を1増やす
            wordCount += 1
            // 表示している画像の番号を基にgifを表示する。
            displayGif()
            //wordCountに応じてラベルを変更（英単語と日本語訳）
            changeLabelsOfWordAndJapan()
            
        }else if receivedCellNumber == 1 && wordCount < 60{
            //31-60
            
            wordCount += 1
            displayGif()
            changeLabelsOfWordAndJapan()
        }else if receivedCellNumber == 2 && wordCount < 90{
            //61-90
            
            wordCount += 1
            displayGif()
            changeLabelsOfWordAndJapan()
            
        }else if receivedCellNumber == 3 && wordCount < 120{
            //91-120
            wordCount += 1
            displayGif()
            changeLabelsOfWordAndJapan()
        }else if receivedCellNumber == 4 && wordCount < 150{
            //121-150
            wordCount += 1
            displayGif()
            changeLabelsOfWordAndJapan()
        }else if receivedCellNumber == 5 && wordCount < 180{
            //151-180
            wordCount += 1
            displayGif()
            changeLabelsOfWordAndJapan()
        }
    }
    
    
    
    
    @IBAction func beforeQuestion(_ sender: Any) {
        
        //countが0になったらreturn
        if wordCount == 0{
            return
        }else{
            //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
            self.timer?.invalidate()
            wordCount -= 1
            //0-30ならば
            if receivedCellNumber == 0{
                
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                
                
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
                
            }else if receivedCellNumber == 1{
                //31-60
                
                if wordCount == 30{
                    return
                }else{
                    
                    switch whichHinshi {
                    case "verb":
                        gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                        
                    case "noun":
                        gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                        
                    case "adjective":
                        gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                        
                    case "adverb":
                        
                        gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                        
                    case "others":
                        gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                        
                    default:
                        return
                    }
                    
                    changeLabelsOfWordAndJapan()
                    //タイマー再開
                    timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
                }
                
            }else if receivedCellNumber == 2 {
                //61-90
                
                if wordCount == 61{
                    return
                }else{
                    
                    switch whichHinshi {
                    case "verb":
                        gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                        
                    case "noun":
                        gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                        
                    case "adjective":
                        gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                        
                    case "adverb":
                        
                        gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                        
                    case "others":
                        gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                        
                    default:
                        return
                    }
                    changeLabelsOfWordAndJapan()
                    //タイマー再開
                    timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
                    
                }
                
                
            }else if receivedCellNumber == 3{
                //91-120
                
                if wordCount == 91{
                    return
                }
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
                
            }else if receivedCellNumber == 4{
                if wordCount == 121{
                    return
                }
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
                
                
                
            }else if receivedCellNumber == 5{
                
                if wordCount == 151{
                    return
                }
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
                
            }
            
            
            
            
            
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
    @IBAction func stopAndRestartButton(_ sender: Any) {
        //一時停止する
        
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
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
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
        
        //動詞編の場合
        //countが問題数最大になるならreturn
        if receivedCellNumber == 0{
            //0-30
            if wordCount == 30{
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                
                
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            }
        }else if receivedCellNumber == 1{
            //31-60
            if wordCount == 60{
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            }
        }else if receivedCellNumber == 2{
            //61-90
            if wordCount == 90{
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            }
        }else if receivedCellNumber == 3{
            //91-120
            if wordCount == 120{
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            }
        }else if receivedCellNumber == 4{
            
            //91-120
            if wordCount == 150{
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            }
            
            
        }else if receivedCellNumber == 5{
            
            //91-120
            if wordCount == 180{
                return
            }else{
                //タイマーをリセット（一単語戻ったら即つぎにいくことがあったため）
                self.timer?.invalidate()
                wordCount += 1
                
                switch whichHinshi {
                case "verb":
                    gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
                    
                case "noun":
                    gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
                    
                case "adjective":
                    gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
                    
                case "adverb":
                    
                    gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
                    
                case "others":
                    gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
                    
                default:
                    return
                }
                
                changeLabelsOfWordAndJapan()
                //タイマー再開
                timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            }
            
            
        }
        
        
    }
    
    
    //音源ないときの処理をなんとかしないとね。オプショナル型を学ぼう
    @IBAction func soundButton(_ sender: Any) {
        
        
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
            return
        }
        
        
        
    }
    
    
    
    
    func displayGif() {
        switch whichHinshi {
        case "verb":
            gifView.loadGif(name: materialList.TOEIC600verbList[wordCount].Words)
            
        case "noun":
            gifView.loadGif(name: materialList.TOEIC600NounList[wordCount].Words)
            
        case "adjective":
            gifView.loadGif(name: materialList.TOEIC600AdjectiveList[wordCount].Words)
            
        case "adverb":
            
            gifView.loadGif(name: materialList.TOEIC600AdverbList[wordCount].Words)
            
        case "others":
            gifView.loadGif(name: materialList.TOEIC600OthersList[wordCount].Words)
            
        default:
            return
        }
    }
    
    func changeLabelsOfWordAndJapan(){
        
        
        switch whichHinshi {
        case "verb":
            wordLabel.text = String(materialList.TOEIC600verbList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600verbList[wordCount].japanWords)
            
        case "noun":
            wordLabel.text = String(materialList.TOEIC600NounList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600NounList[wordCount].japanWords)
            
        case "adjective":
            wordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600AdjectiveList[wordCount].japanWords)
            
        case "adverb":
            
            wordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600AdverbList[wordCount].japanWords)
            
        case "others":
            wordLabel.text = String(materialList.TOEIC600OthersList[wordCount].Words)
            japanWordLabel.text = String(materialList.TOEIC600OthersList[wordCount].japanWords)
            
        default:
            return
        }
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func backToLevel(_ sender: Any) {
        self.timer?.invalidate()
        //ナビゲーションバー再表示
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
    func showAlert(){
        //テストの説明を表示
        
        let alertController = UIAlertController(title: "はじめまして", message: "3秒で自動的に次の単語が出ます。一時停止も可能です。3秒の間に2-3回音読ができると良いペースです。「increase増加する、increase増加する」という風に音読します。では、頑張って下さい！", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "はい", style: .default) { (alert) in
            
            //タイマースタート
            self.timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(ManabuViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            
            
            
        }
        
        alertController.addAction(action1)
        
        //ユーザーデフォルに起動した情報を記録
        firstOrNot = false
        UserDefaults.standard.set(firstOrNot, forKey: "alreadyManabu")
        self.present(alertController, animated: true,completion: nil)
    }
    
    
}








