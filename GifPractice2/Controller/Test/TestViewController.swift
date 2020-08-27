
//  TestViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/19.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//
import UIKit

class TestViewController: UIViewController{
    
    let materialList = MaterialList()
    var wordCount = Int()
    var pickedAnswer = Bool()
    var questionNumber = 0
    var timer = Timer()
    var timer2 = Timer()
    var soundFile = SoundFile()
    var correctCount = 0
    var incorrectCount = 0
    var timerCount = 2
    //制限時間
    var timeLimit = 3.0
    //選択肢を左右ランダムに表示するための変数（0か1のみいれるつもり。のちに四択にする可能性も考慮して、BoolでなくInt型で宣言）
    var selectionRightOrLeft = Int()
    var incorrectArray: [Int] = []
    var receivedCellNumber = Int()
    let batsuImage = UIImage(named: "batsucat")
    let maruImage = UIImage(named: "marucat")
    var firstOrNot = true
    var whichHinshi = String()
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var maruBatsuImage: UIImageView!
    @IBOutlet weak var testGifView: UIImageView!
    @IBOutlet weak var testWordLabel: UILabel!
    @IBOutlet weak var selection1: UIButton!
    @IBOutlet weak var selection2: UIButton!
    @IBOutlet weak var countdownLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selection1.layer.cornerRadius = 15.0
        selection2.layer.cornerRadius = 15.0
        
        //ナビゲーションバーの戻るボタンは非表示にしよう
        navigationController?.setNavigationBarHidden(true, animated: true)
        
        //初起動かどうかのチェック
        if UserDefaults.standard.object(forKey: "already") != nil{
            firstOrNot = UserDefaults.standard.object(forKey: "already") as! Bool
        }
        
        switch firstOrNot {
        case true:
            //初めての起動
            showAlert()
         
            
            
        case false:
//            2回目以降の起動ではアラート出さない
//             タイマーを設定　制限時間カウントダウンタイマー
            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TestViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
            countdownLabel.text = String(timerCount)

            // タイマーを設定　時間切れで次の問題へ行くためのタイマー
            timer = Timer.scheduledTimer(timeInterval: timeLimit, target: self, selector: #selector(TestViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            
            
            default:
                return
            }
            
            
            
            
            
            switch receivedCellNumber {
            case 0:
                //0-30
                questionNumber = 0
                
                switch whichHinshi {
                case "verb":
                    
                  
                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                case "noun":
                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                case "adjective":
                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                case "adverb":
                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                case "others":
                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                default:
                    return
                }
                
                //選択肢を左右ランダムに表示したい
                showRandomSelection()
                
                
            case 1:
                //31-60
                questionNumber = 31
                
                switch whichHinshi {
                case "verb":
                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                case "noun":
                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                case "adjective":
                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                case "adverb":
                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                case "others":
                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                default:
                    return
                }
                
                showRandomSelection()
                
            case 2:
                //61-90
                questionNumber = 61
                switch whichHinshi {
                case "verb":
                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                case "noun":
                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                case "adjective":
                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                case "adverb":
                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                case "others":
                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                default:
                    return
                }
                showRandomSelection()
            case 3:
                //91-120
                questionNumber = 91
                switch whichHinshi {
                case "verb":
                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                case "noun":
                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                case "adjective":
                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                case "adverb":
                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                case "others":
                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                default:
                    return
                }
                showRandomSelection()
                
            case 4:
                //121-150
                questionNumber = 121
                
                switch whichHinshi {
                case "verb":
                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                case "noun":
                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                case "adjective":
                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                case "adverb":
                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                case "others":
                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                default:
                    return
                }
                
                //選択肢を左右ランダムに表示したい
                showRandomSelection()
            case 5:
                //151-180
                questionNumber = 151
                
                switch whichHinshi {
                case "verb":
                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                case "noun":
                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                case "adjective":
                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                case "adverb":
                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                case "others":
                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                default:
                    return
                }
                
                //選択肢を左右ランダムに表示したい
                showRandomSelection()
            default:
                return
            }
            
//        case false:
//            //2回目以降の起動ではアラート出さない
//            // タイマーを設定　制限時間カウントダウンタイマー
//            timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TestViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
//            countdownLabel.text = String(timerCount)
//
//            // タイマーを設定　時間切れで次の問題へ行くためのタイマー
//            timer = Timer.scheduledTimer(timeInterval: timeLimit, target: self, selector: #selector(TestViewController.onTimer(timer:)), userInfo: nil, repeats: true)
//
//
//            switch receivedCellNumber {
//            case 0:
//                //0-30
//                questionNumber = 0
//                switch whichHinshi {
//                case "verb":
//
//                    soundFile.playSound(fileName: materialList.TOEIC600verbList[questionNumber].Words, extensionName: "mp3")
//
//                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
//                case "noun":
//                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
//                case "adjective":
//                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                case "adverb":
//                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
//                case "others":
//                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
//                default:
//                    return
//                }
//                //選択肢を左右ランダムに表示したい
//                showRandomSelection()
//
//
//            case 1:
//                //31-60
//                questionNumber = 31
//                switch whichHinshi {
//                case "verb":
//                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
//                case "noun":
//                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
//                case "adjective":
//                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                case "adverb":
//                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
//                case "others":
//                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
//                default:
//                    return
//                }
//                showRandomSelection()
//
//            case 2:
//                //61-90
//                questionNumber = 61
//                switch whichHinshi {
//                case "verb":
//                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
//                case "noun":
//                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
//                case "adjective":
//                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                case "adverb":
//                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
//                case "others":
//                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
//                default:
//                    return
//                }
//                showRandomSelection()
//            case 3:
//                //91-120
//                questionNumber = 91
//                switch whichHinshi {
//                case "verb":
//                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
//                case "noun":
//                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
//                case "adjective":
//                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                case "adverb":
//                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
//                case "others":
//                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
//                default:
//                    return
//                }
//                showRandomSelection()
//
//            case 4:
//                //121-150
//                questionNumber = 121
//
//                switch whichHinshi {
//                case "verb":
//                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
//                case "noun":
//                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
//                case "adjective":
//                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                case "adverb":
//                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
//                case "others":
//                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
//                default:
//                    return
//                }
//
//                //選択肢を左右ランダムに表示したい
//                showRandomSelection()
//            case 5:
//                //151-180
//                questionNumber = 151
//
//                switch whichHinshi {
//                case "verb":
//                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
//                case "noun":
//                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
//                case "adjective":
//                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
//                case "adverb":
//                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
//                case "others":
//                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
//                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
//                default:
//                    return
//                }
//
//                //選択肢を左右ランダムに表示したい
//                showRandomSelection()
//
//            default:
//                return
//            }
            
            
//        default:
//            return
//        }
        
        
    }
    
    
    
    
    
    
    
    //テスト中止ボタン
    @IBAction func cancelTest(_ sender: Any) {
        //タイマーを停止
        self.timer2.invalidate()
        self.timer.invalidate()
        //レベルセレクトに戻る
        
        //ナビゲーションバー再表示（テスト画面で消したやつ）
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        self.navigationController?.popViewController(animated: true)
        
    }
    
    
    
    // NSTimerによって、一定の間隔で呼び出される関数
    @objc func onTimer(timer: Timer){
        //不正解判定
        print("不正解")
        incorrectCount += 1
        
        //不正解の番号を記録
        incorrectArray.append(questionNumber)
        //
        //        UserDefaults.standard.set(questionNumber, forKey: String(questionNumber))
        
        //不正解の音を鳴らす
        soundFile.playSound(fileName: "fuseikai", extensionName: "mp3")
        
        
        maruBatsuImage.image = batsuImage
        
        //タイマーをリセットし、残り時間を再表示
        timersResetAndShowLabel()
        
        switch receivedCellNumber {
        case 0:
            //0-30　次の問題に行きたい時の処理を書き出す！その後メソッドにする?
            //            //タイマーをリセットし、残り時間を再表示
            //            timersResetAndShowLabel()
            
            if questionNumber < 29{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                showRandomSelection()
                
                
                //
                //                questionNumber += 1
                //
                //
                //                switch whichHinshi {
                //                case "verb":
                //                    testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
                //                    testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
                //                case "noun":
                //                    testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
                //                    testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
                //                case "adjective":
                //                    testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
                //                    testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
                //                case "adverb":
                //                    testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
                //                    testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
                //                case "others":
                //                    testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
                //                    testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
                //                default:
                //                    return
                //                }
                //
                //                showRandomSelection()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
        case 1:
            //31-60
            //            timersResetAndShowLabel()
            
            if questionNumber < 59{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                showRandomSelection()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 2:
            //            timersResetAndShowLabel()
            
            if questionNumber < 89{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                showRandomSelection()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 3:
            //            timersResetAndShowLabel()
            
            if questionNumber < 119{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                showRandomSelection()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 4:
            if questionNumber < 149{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                showRandomSelection()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 5:
            if questionNumber < 179{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                showRandomSelection()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
            
            
        default:
            return
        }
        
        
        
        //        newNextQuestion()
        //        showRandomSelection()
    }
    
    
    
    
    //残り時間のラベル
    @objc func onTimer2(timer:Timer){
        timerCount -= 1
        //ラベルに表示
        countdownLabel.text = String(timerCount)
    }
    
    //このへんはmodelにぶちこむかい？
    func displayGif(){
        
        //        testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
        
        switch whichHinshi {
        case "verb":
            testGifView.loadGif(name: materialList.TOEIC600verbList[questionNumber].Words)
        case "noun":
            testGifView.loadGif(name: materialList.TOEIC600NounList[questionNumber].Words)
        case "adjective":
            testGifView.loadGif(name: materialList.TOEIC600AdjectiveList[questionNumber].Words)
        case "adverb":
            testGifView.loadGif(name: materialList.TOEIC600AdverbList[questionNumber].Words)
        case "others":
            testGifView.loadGif(name: materialList.TOEIC600OthersList[questionNumber].Words)
        default:
            return
        }
        
    }
    
    func changeWordLabel(){
        //        testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
        
        switch whichHinshi {
        case "verb":
            testWordLabel.text = String(materialList.TOEIC600verbList[questionNumber].Words)
        case "noun":
            testWordLabel.text = String(materialList.TOEIC600NounList[questionNumber].Words)
        case "adjective":
            testWordLabel.text = String(materialList.TOEIC600AdjectiveList[questionNumber].Words)
        case "adverb":
            testWordLabel.text = String(materialList.TOEIC600AdverbList[questionNumber].Words)
        case "others":
            testWordLabel.text = String(materialList.TOEIC600OthersList[questionNumber].Words)
        default:
            return
        }
        
        
    }
    
    //おそらくセレクション1に正解を常に入れてる
    func selection1NextWord(){
        
        //        selection1.setTitle(materialList.TOEIC600verbList[questionNumber].japanWords, for: UIControl.State.normal)
        
        switch whichHinshi {
        case "verb":
            selection1.setTitle(materialList.TOEIC600verbList[questionNumber].japanWords, for: UIControl.State.normal)
        case "noun":
            selection1.setTitle(materialList.TOEIC600NounList[questionNumber].japanWords, for: UIControl.State.normal)
        case "adjective":
            selection1.setTitle(materialList.TOEIC600AdjectiveList[questionNumber].japanWords, for: UIControl.State.normal)
        case "adverb":
            selection1.setTitle(materialList.TOEIC600AdverbList[questionNumber].japanWords, for: UIControl.State.normal)
        case "others":
            selection1.setTitle(materialList.TOEIC600OthersList[questionNumber].japanWords, for: UIControl.State.normal)
        default:
            return
        }
        
        
        
        
        
        
    }
    
    func selection2NextWord(){
        let random = arc4random_uniform(UInt32(Int(materialList.TOEIC600verbList.count)))
        
        
        //        selection2.setTitle(materialList.TOEIC600verbList[Int(random)].japanWords, for:UIControl.State.normal)
        
        
        
        switch whichHinshi {
        case "verb":
            selection2.setTitle(materialList.TOEIC600verbList[Int(random)].japanWords, for:UIControl.State.normal)
        case "noun":
            selection2.setTitle(materialList.TOEIC600NounList[Int(random)].japanWords, for:UIControl.State.normal)
        case "adjective":
            selection2.setTitle(materialList.TOEIC600AdjectiveList[Int(random)].japanWords, for:UIControl.State.normal)
        case "adverb":
            selection2.setTitle(materialList.TOEIC600AdverbList[Int(random)].japanWords, for:UIControl.State.normal)
        case "others":
            selection2.setTitle(materialList.TOEIC600OthersList[Int(random)].japanWords, for:UIControl.State.normal)
        default:
            return
        }
        
        
    }
    
    
    //正答判定の機能
    func checkAnswer(){
        
        //                var correctAnswer = materialList.TOEIC600verbList[questionNumber].answer
        
        var correctAnswer = Bool()
        
        switch whichHinshi {
        case "verb":
            correctAnswer = materialList.TOEIC600verbList[questionNumber].answer
        case "noun":
            correctAnswer = materialList.TOEIC600NounList[questionNumber].answer
        case "adjective":
            correctAnswer = materialList.TOEIC600AdjectiveList[questionNumber].answer
        case "adverb":
            correctAnswer = materialList.TOEIC600AdverbList[questionNumber].answer
        case "others":
            correctAnswer = materialList.TOEIC600OthersList[questionNumber].answer
        default:
            return
        }
        
        
        
        if correctAnswer == pickedAnswer{
            print("正解")
            correctCount += 1
            //正解の音鳴らす
            soundFile.playSound(fileName: "seikai", extensionName: "mp3")
            maruBatsuImage.image = maruImage
        }else if correctAnswer != pickedAnswer{
            print("不正解")
            incorrectCount += 1
            //不正解を配列に記録
            incorrectArray.append(questionNumber)
            
            //            UserDefaults.standard.set(questionNumber, forKey: String(questionNumber))
            //不正解の音鳴らす
            soundFile.playSound(fileName: "fuseikai", extensionName: "mp3")
            
            maruBatsuImage.image = batsuImage
            maruBatsuImage.isHighlighted = true
            
        }
        
    }
    
    
    func newNextQuestion(){
        //次の問題へ行く処理
        //ランダムに選択肢を表示する処理も書くべきじゃね？
        
        //タイマーをリセットし、残り時間を再表示
        timersResetAndShowLabel()
        
        
        switch receivedCellNumber {
        case 0:
            //0-30
            if questionNumber < 29{
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                questionNumber += 1
                displayGif()
                changeWordLabel()
                
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                //                performSegue(withIdentifier: "next", sender: nil)
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
        case 1:
            //31-60
            if questionNumber < 59{
                
                
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
                
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 2:
            
            if questionNumber < 89{
                //61-90
                //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
            
        case 3:
            if questionNumber < 119{
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 4:
            if questionNumber < 149{
                
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
            
        case 5:
            if questionNumber < 179{
                
                //これならOk!
                switch whichHinshi {
                case "verb":
                    if questionNumber == materialList.TOEIC600verbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "noun":
                    if questionNumber == materialList.TOEIC600NounList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adjective":
                    
                    if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                        
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "adverb":
                    if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                case "others":
                    if questionNumber == materialList.TOEIC600OthersList.count - 1{
                        self.timer2.invalidate()
                        self.timer.invalidate()
                        performSegue(withIdentifier: "TL", sender: nil)
                        return
                    }
                default:
                    return
                }
                
                questionNumber += 1
                displayGif()
                changeWordLabel()
            }else{
                //問題終了
                //タイマーストップ
                self.timer2.invalidate()
                self.timer.invalidate()
                //リザルト画面へ遷移。
                performSegue(withIdentifier: "TL", sender: nil)
                return
                
            }
        default:
            return
        }
        
        
    }
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let resultTLVC = segue.destination as! ResultTLViewController
        
        //不正解の問題の番号を渡す
        resultTLVC.resultIncorrectNumberArray = incorrectArray
        
        
        //
        //            resultTLVC.whichHinshi = "Verb"
        //
        
        switch whichHinshi {
        case "verb":
            resultTLVC.whichHinshi = "Verb"
        case "noun":
            resultTLVC.whichHinshi = "Noun"
        case "adjective":
            resultTLVC.whichHinshi = "Adjective"
        case "adverb":
            resultTLVC.whichHinshi = "Adverb"
        case "others":
            resultTLVC.whichHinshi = "Others"
        default:
            return
        }
    }
    
    
    
    
    
    
    
    func showRandomSelection(){
        //次の問題の選択肢を左右ランダムに表示させる
        selectionRightOrLeft = Int(arc4random_uniform(UInt32(2)))
        if selectionRightOrLeft == 0 {
            //正解選択肢を左に表示
            switch whichHinshi {
            case "verb":
                selection1.setTitle(materialList.TOEIC600verbList[questionNumber].japanWords, for: UIControl.State.normal)
            case "noun":
                selection1.setTitle(materialList.TOEIC600NounList[questionNumber].japanWords, for: UIControl.State.normal)
            case "adjective":
                selection1.setTitle(materialList.TOEIC600AdjectiveList[questionNumber].japanWords, for: UIControl.State.normal)
            case "adverb":
                selection1.setTitle(materialList.TOEIC600AdverbList[questionNumber].japanWords, for: UIControl.State.normal)
            case "others":
                selection1.setTitle(materialList.TOEIC600OthersList[questionNumber].japanWords, for: UIControl.State.normal)
            default:
                return
            }
            //ダミー選択肢を右に表示させる処理
            //        var random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600verbList.count - 1))))
            
            var random = Int()
            
            switch whichHinshi {
            case "verb":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600verbList.count - 1))))
                
            case "noun":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600NounList.count - 1))))
                
            case "adjective":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600AdjectiveList.count - 1))))
                
            case "adverb":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600AdverbList.count - 1))))
                
            case "others":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600OthersList.count - 1))))
                
            default:
                return
            }
            
            
            
            
            
            if random != questionNumber{
                switch whichHinshi {
                case "verb":
                    
                    selection2.setTitle(materialList.TOEIC600verbList[random].japanWords, for: UIControl.State.normal)
                case "noun":
                    
                    selection2.setTitle(materialList.TOEIC600NounList[random].japanWords, for: UIControl.State.normal)
                case "adjective":
                    
                    selection2.setTitle(materialList.TOEIC600AdjectiveList[random].japanWords, for: UIControl.State.normal)
                case "adverb":
                    
                    selection2.setTitle(materialList.TOEIC600AdverbList[random].japanWords, for: UIControl.State.normal)
                case "others":
                    
                    selection2.setTitle(materialList.TOEIC600OthersList[random].japanWords, for: UIControl.State.normal)
                default:
                    return
                }
            }else if random == questionNumber{
                //テキトーな選択肢を表示
                
                switch whichHinshi {
                case "verb":
                    selection2.setTitle("引き渡す", for: UIControl.State.normal)
                case "noun":
                    selection2.setTitle("議論", for: UIControl.State.normal)
                case "adjective":
                    selection2.setTitle("美しい", for: UIControl.State.normal)
                case "adverb":
                    selection2.setTitle("激しく", for: UIControl.State.normal)
                case "others":
                    selection2.setTitle("の時", for: UIControl.State.normal)
                default:
                    return
                }
            }
        }else if selectionRightOrLeft == 1{
            //正解選択肢を右に表示
            
            switch whichHinshi {
            case "verb":
                selection2.setTitle(materialList.TOEIC600verbList[questionNumber].japanWords, for: UIControl.State.normal)
            case "noun":
                selection2.setTitle(materialList.TOEIC600NounList[questionNumber].japanWords, for: UIControl.State.normal)
            case "adjective":
                selection2.setTitle(materialList.TOEIC600AdjectiveList[questionNumber].japanWords, for: UIControl.State.normal)
            case "adverb":
                selection2.setTitle(materialList.TOEIC600AdverbList[questionNumber].japanWords, for: UIControl.State.normal)
            case "others":
                selection2.setTitle(materialList.TOEIC600OthersList[questionNumber].japanWords, for: UIControl.State.normal)
            default:
                return
            }
            
            //ダミー選択肢を左に表示（選択肢重複を防ぐ処理）　!!!まれに「選択肢1」や「選択肢2」が表示されてしまう。要修正。
            //        var random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600verbList.count - 1))))
            var random = Int()
            
            switch whichHinshi {
            case "verb":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600verbList.count - 1))))
            case "noun":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600NounList.count - 1))))
            case "adjective":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600AdjectiveList.count - 1))))
            case "adverb":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600AdverbList.count - 1))))
            case "others":
                random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600OthersList.count - 1))))
            default:
                return
            }
            
            
            
            
            
            
            if random != questionNumber{
                
                //                selection1.setTitle(materialList.TOEIC600verbList[random].japanWords, for: UIControl.State.normal)
                
                switch whichHinshi {
                case "verb":
                    random = Int(arc4random_uniform(UInt32(Int(materialList.TOEIC600verbList.count - 1))))
                    selection1.setTitle(materialList.TOEIC600verbList[random].japanWords, for: UIControl.State.normal)
                case "noun":
                    
                    selection1.setTitle(materialList.TOEIC600NounList[random].japanWords, for: UIControl.State.normal)
                case "adjective":
                    selection1.setTitle(materialList.TOEIC600AdjectiveList[random].japanWords, for: UIControl.State.normal)
                case "adverb":
                    selection1.setTitle(materialList.TOEIC600AdverbList[random].japanWords, for: UIControl.State.normal)
                case "others":
                    selection1.setTitle(materialList.TOEIC600OthersList[random].japanWords, for: UIControl.State.normal)
                default:
                    return
                }
            }else{
                switch whichHinshi {
                case "verb":
                    selection1.setTitle("引き渡す", for: UIControl.State.normal)
                case "noun":
                    selection1.setTitle("議論", for: UIControl.State.normal)
                case "adjective":
                    selection1.setTitle("美しい", for: UIControl.State.normal)
                case "adverb":
                    selection1.setTitle("激しく", for: UIControl.State.normal)
                case "others":
                    selection1.setTitle("の時", for: UIControl.State.normal)
                default:
                    return
                }
            }
        }
    }
    
    
    
    
    
    func timersResetAndShowLabel(){
        //回答がなされたら、時間切れタイマーをリセット
        self.timer.invalidate()
        //回答がなされたら、制限時間カウントダウンタイマーをリセット
        self.timer2.invalidate()
        
        //時間切れタイマーを再開
        timer = Timer.scheduledTimer(timeInterval: timeLimit, target: self, selector: #selector(TestViewController.onTimer(timer:)), userInfo: nil, repeats: true)
        //制限時間カウントダウンタイマー再開
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TestViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
        timerCount = 2
        countdownLabel.text = String(timerCount)
    }
    
    
    
    
    
    @IBAction func answer(_ sender: Any){
        
        timersResetAndShowLabel()
        
        if (sender as AnyObject).tag == 1{
            //左が押された
            //ビューディドロードで出したランダム。および前回の問題で出したランダム
            if selectionRightOrLeft == 0{
                //正解は今左にある。つまり左を押したから正解。
                pickedAnswer = true
                checkAnswer()
                
                newNextQuestion()
                showRandomSelection()
                
                
            }else if selectionRightOrLeft == 1{
                //正解は右にある。つまり左を押したから不正解
                pickedAnswer = false
                checkAnswer()
                
                newNextQuestion()
                showRandomSelection()
            }
            
        }else if (sender as AnyObject).tag == 2{
            //右が押された
            //ビューディドロードで出したランダム。および前回の問題で出したランダム
            if selectionRightOrLeft == 0{
                //正解は今左にある。つまり右をを押したから不正解。
                pickedAnswer = false
                checkAnswer()
                
                newNextQuestion()
                showRandomSelection()
                
            }else if selectionRightOrLeft == 1{
                //正解は右にある。つまり、右が押されたので正解。
                pickedAnswer = true
                checkAnswer()
                
                newNextQuestion()
                showRandomSelection()
            }
        }
    }
    
    
    func showAlert(){
        //テストの説明を表示
        
        let alertController = UIAlertController(title: "はじめまして", message: "制限時間はとても短いですが、即答できるレベルになって初めてリスニングや読解に対応できます。頑張って下さい！", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "はい", style: .default) { (alert) in
            
            //タイマースタート
            // タイマーを設定　制限時間カウントダウンタイマー
            self.timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(TestViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
            self.countdownLabel.text = String(self.timerCount)
            
            // タイマーを設定　時間切れで次の問題へ行くためのタイマー
            self.timer = Timer.scheduledTimer(timeInterval: self.timeLimit, target: self, selector: #selector(TestViewController.onTimer(timer:)), userInfo: nil, repeats: true)
            
        }
        
        alertController.addAction(action1)
        
        //ユーザーデフォルに起動した情報を記録
        firstOrNot = false
        UserDefaults.standard.set(firstOrNot, forKey: "already")
        self.present(alertController, animated: true,completion: nil)
    }
    
    func preventOutOfRange(){
        
        //品詞ごとに、単語の個数を超えてアプリが落ちないようにする処理
        switch whichHinshi {
        case "verb":
            if questionNumber == materialList.TOEIC600verbList.count - 1{
                self.timer2.invalidate()
                self.timer.invalidate()
                performSegue(withIdentifier: "TL", sender: nil)
                return
            }
        case "noun":
            if questionNumber == materialList.TOEIC600NounList.count - 1{
                self.timer2.invalidate()
                self.timer.invalidate()
                performSegue(withIdentifier: "TL", sender: nil)
                return
            }
        case "adjective":
            
            if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                
                self.timer2.invalidate()
                self.timer.invalidate()
                performSegue(withIdentifier: "TL", sender: nil)
                return
            }
        case "adverb":
            if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                self.timer2.invalidate()
                self.timer.invalidate()
                performSegue(withIdentifier: "TL", sender: nil)
                return
            }
        case "others":
            if questionNumber == materialList.TOEIC600OthersList.count - 1{
                self.timer2.invalidate()
                self.timer.invalidate()
                performSegue(withIdentifier: "TL", sender: nil)
                return
            }
        default:
            questionNumber += 1
            displayGif()
            changeWordLabel()
        }
    }
    
    
    
}















