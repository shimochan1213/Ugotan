
//  TestViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/19.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//
import UIKit


//コードを見る担当者様へ。品詞に関するswitch文が長くて申し訳ありません・・。メソッドで実行しようとしたのですがどうもうまくいかず、全てswitch文を書いてあります。お手数おかけします。

class TestViewController: UIViewController{
    
    let materialList = MaterialList()
    var wordCount = Int()
    var pickedAnswer = Bool()
    var questionNumber = 0
    var timer = Timer()
    var timer2 = Timer()
    var timer3 = Timer()
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
    var gifOnOff = true
    var whichHinshi = String()
    @IBOutlet weak var gifView: UIImageView!
    @IBOutlet weak var maruBatsuImage: UIImageView!
    @IBOutlet weak var testGifView: UIImageView!
    @IBOutlet weak var testWordLabel: UILabel!
    @IBOutlet weak var selection1: UIButton!
    @IBOutlet weak var selection2: UIButton!
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var quesNumberLabel: UILabel!
    
    
    //コードを見る担当者様へ。品詞に関するswitch文が長くて申し訳ありません・・。メソッドで実行しようとしたのですがどうもうまくいかず、全てswitch文を書いてあります。お手数おかけします。
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        quesNumberLabel.text = "\(questionNumber % 30 + 1) /30"
        
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
            break
        }
        
        //単語の範囲はどこか
        switch receivedCellNumber {
        case 0:
            //0-30
            
            questionNumber = 0
            
            displayGif()
            changeWordLabel()
            //選択肢を左右ランダムに表示したい
            showRandomSelection()
            
            
        case 1:
            //31-60
            questionNumber = 30
            
            displayGif()
            changeWordLabel()
            showRandomSelection()
            
        case 2:
            //61-90
            questionNumber = 60
            
            displayGif()
            changeWordLabel()
            showRandomSelection()
        case 3:
            //91-120
            questionNumber = 90
            
            displayGif()
            changeWordLabel()
            showRandomSelection()
            
        case 4:
            //121-150
            questionNumber = 120
            
            displayGif()
            changeWordLabel()
            showRandomSelection()
        case 5:
            //151-180
            questionNumber = 150
            
            displayGif()
            changeWordLabel()
            showRandomSelection()
        default:
            break
        }
        
        
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
        
        //不正解の音を鳴らす
        soundFile.playSound(fileName: "fuseikai", extensionName: "mp3")
        
        //不正解イラスト表示
        maruBatsuImage.image = batsuImage
        
        //タイマーをリセットし、残り時間を再表示
        timersResetAndShowLabel()
        
        //選択肢を0.5秒間無効化。制限時間ギリギリで超過時の誤タッチ防止。
        validateAndInvalidateButton()
        
        switch receivedCellNumber {
        case 0:
            //0-30
            
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                    NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            default:
                break
            }
            
  
            
        case 1:
            //31-60
            
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 2:
            //61-90
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 3:
            //91-120
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 4:
            //121-150
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 5:
            //151-180
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                   NEXTQUESTIONMETHOD()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            default:
                break
            }
            
            
            
        default:
            break
        }
        
    }
    
    func NEXTQUESTIONMETHOD(){
        questionNumber += 1
        displayGif()
        changeWordLabel()
        showRandomSelection()
        
        quesNumberLabel.text = "\(questionNumber % 30 + 1) /30"
    }
    

    
    //残り時間のラベル
    @objc func onTimer2(timer:Timer){
        timerCount -= 1
        //ラベルに表示
        countdownLabel.text = String(timerCount)
    }
    
 
    func displayGif(){
        //設定で「イラストを表示しない」となってたらここでreturnさせれば良い
        if UserDefaults.standard.object(forKey: "gifOnOff") != nil{
            gifOnOff = UserDefaults.standard.object(forKey: "gifOnOff") as! Bool
            if gifOnOff == false{
                return
            }else{
                
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
                    break
                }
                
                
            }
            
        }else{
            //初起動
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
                break
            }
        }
    }
    
    func changeWordLabel(){
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
            break
        }
        
        
    }
    
    
    
    //正答判定の機能
    func checkAnswer(){
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
            
            //不正解の音鳴らす
            soundFile.playSound(fileName: "fuseikai", extensionName: "mp3")
            
            //不正解イラスト表示
            maruBatsuImage.image = batsuImage
            maruBatsuImage.isHighlighted = true
            
        }
    }
    
    func NEWNEXTQUES(){
        questionNumber += 1
        displayGif()
        changeWordLabel()
    }
    
    
    func newNextQuestion(){
        //次の問題へ行く処理
        //タイマーをリセットし、残り時間を再表示
        timersResetAndShowLabel()
        
        switch receivedCellNumber {
        case 0:
            //0-30
            //OKのやつ
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                    NEWNEXTQUES()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
                
                
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                    NEWNEXTQUES()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
                
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                    NEWNEXTQUES()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    timerResetAndPerformSegue()
                }else if questionNumber != 29{
                    NEWNEXTQUES()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    timerResetAndPerformSegue()
                    
                }else if questionNumber != 29{
                    NEWNEXTQUES()
                }else if questionNumber == 29{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 1:
            //31-60
            
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                    NEWNEXTQUES()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                    NEWNEXTQUES()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                    NEWNEXTQUES()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                    NEWNEXTQUES()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 60{
                    NEWNEXTQUES()
                }else if questionNumber == 60{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 2:
            
            
            //61-90
            //品詞ごとに、その配列のカウントまでとしてout of rangeしないようにする
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                    NEWNEXTQUES()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                    NEWNEXTQUES()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                    NEWNEXTQUES()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                    NEWNEXTQUES()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 90{
                    NEWNEXTQUES()
                }else if questionNumber == 90{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
            
        case 3:
            
            
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                    NEWNEXTQUES()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                    NEWNEXTQUES()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                    NEWNEXTQUES()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                    NEWNEXTQUES()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 120{
                    NEWNEXTQUES()
                }else if questionNumber == 120{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
        case 4:
            
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                    NEWNEXTQUES()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                    NEWNEXTQUES()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                    NEWNEXTQUES()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                    NEWNEXTQUES()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 150{
                    NEWNEXTQUES()
                }else if questionNumber == 150{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
            
        case 5:
 
            switch whichHinshi {
            case "verb":
                if questionNumber == materialList.TOEIC600verbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                    NEWNEXTQUES()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "noun":
                if questionNumber == materialList.TOEIC600NounList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                    NEWNEXTQUES()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "adjective":
                
                if questionNumber == materialList.TOEIC600AdjectiveList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                    NEWNEXTQUES()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "adverb":
                if questionNumber == materialList.TOEIC600AdverbList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                    NEWNEXTQUES()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            case "others":
                if questionNumber == materialList.TOEIC600OthersList.count - 1{
                    
                    timerResetAndPerformSegue()
                }else if questionNumber != 180{
                    NEWNEXTQUES()
                }else if questionNumber == 180{
                    timerResetAndPerformSegue()
                }
            default:
                return
            }
            
            
            
            
            
        default:
            return
        }
    }
    
    
    func timerResetAndPerformSegue(){
        self.timer2.invalidate()
        self.timer.invalidate()
        performSegue(withIdentifier: "TL", sender: nil)
        return
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let resultTLVC = segue.destination as! ResultTLViewController
        
        //不正解の問題の番号を渡す
        resultTLVC.resultIncorrectNumberArray = incorrectArray
        
        //単語の範囲を渡す（復習用保存のため）
        resultTLVC.receivedCellNumber = receivedCellNumber
        
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
            
            //ダミー選択肢を左に表示（選択肢重複を防ぐ処理）
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
        //選択肢を0.5秒間無効化。制限時間ギリギリ超過時の誤タッチ防止。
        validateAndInvalidateButton()
        
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
                
                quesNumberLabel.text = "\(questionNumber % 30 + 1) /30"
                
            }else if selectionRightOrLeft == 1{
                //正解は右にある。つまり左を押したから不正解
                pickedAnswer = false
                checkAnswer()
                newNextQuestion()
                showRandomSelection()
                
                quesNumberLabel.text = "\(questionNumber % 30 + 1) /30"
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
                
                quesNumberLabel.text = "\(questionNumber % 30 + 1) /30"
                
            }else if selectionRightOrLeft == 1{
                //正解は右にある。つまり、右が押されたので正解。
                pickedAnswer = true
                checkAnswer()
                newNextQuestion()
                showRandomSelection()
                
                quesNumberLabel.text = "\(questionNumber % 30 + 1) /30"
            }
        }
    }
    
    
    func showAlert(){
        //テストの説明を表示
        
        let alertController = UIAlertController(title: "はじめまして", message: "制限時間はとても短いですが、即答できるレベルになって初めてリスニングや読解に対応できます。頑張って下さい！設定でイラストを非表示にすることもできます。", preferredStyle: .alert)
        
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
    
    
    func validateAndInvalidateButton (){
        //回答ボタンを無効化
        selection1.isEnabled = false
        selection2.isEnabled = false
        
        //0.3秒後にボタンを有効化
        //タイマーを設定
        timer3 = Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(TestViewController.onTimer3(timer:)), userInfo: nil, repeats: false)
    }
    
    @objc func onTimer3(timer: Timer){
        //回答ボタン有効化
        selection1.isEnabled = true
        selection2.isEnabled = true
    }
    
    
    
    
    
}















