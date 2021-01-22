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


class ShuffleTestViewController: UIViewController,UIGestureRecognizerDelegate  {
    
    // AVSpeechSynthesizerをクラス変数で保持しておく、インスタンス変数だと読み上げるまえに破棄されてしまう
    var speechSynthesizer : AVSpeechSynthesizer!
    @IBOutlet weak var wordLabel: UILabel!
    @IBOutlet weak var jpnWordLabel: UILabel!
    @IBOutlet weak var selec1: UIButton!
    @IBOutlet weak var selec2: UIButton!
    @IBOutlet weak var selec3: UIButton!
    @IBOutlet weak var selec4: UIButton!
    @IBOutlet weak var quesNumberLabel: UILabel!
    
    var correctCount = 0
    var incorrectCount = 0
    
    var materialList = MaterialList()
    var wordCount = 0
    var receivedCellNumber = Int()
    //不正解の単語を記録
    var incorrectArray: [Int] = []
    
    var whereIsCorrectSelection = Int()
    var animationView = AnimationView()
    var animation2View = AnimationView()
    var soundFile = SoundFile()
    

    var learnedNumber = Int()

    
    var tapGesture: UITapGestureRecognizer!
    var tapOK:Bool = false
    
    //カウントダウンのラベル用
    var timerCount = 5
    var timer2 = Timer()
    @IBOutlet weak var countdownLabel: UILabel!
    
    //次の単語に行くまでの秒数
    var timerSec = 6.0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        var radiusRate:CGFloat = 20
        selec1.layer.cornerRadius = radiusRate
        selec2.layer.cornerRadius = radiusRate
        selec3.layer.cornerRadius = radiusRate
        selec4.layer.cornerRadius = radiusRate
        
        // ジェスチャーの生成
        tapGesture = UITapGestureRecognizer(target:self,action: #selector(ShuffleTestViewController.tap))
        view.addGestureRecognizer(tapGesture)
        
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
        
        quesNumberLabel.text = "\(wordCount % 50 + 1) /50"
        wordLabel.text = materialList.TOEIC600List[wordCount].Words
        soundYomiage()
        showRandomSelection()
        
        //        nextQuesBtn.isEnabled = false
        
        
        setTimer()
        setTimer2()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if UserDefaults.standard.object(forKey: "learnedNumber") != nil{
            learnedNumber = UserDefaults.standard.object(forKey: "learnedNumber") as! Int
        }
    }
    
    
    func setTimer(){
        timer = Timer.scheduledTimer(timeInterval: timerSec, target: self, selector: #selector(ShuffleTestViewController.onTimer(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func onTimer(timer: Timer) {
        //配列のカウントまでとしてout of rangeしないようにする
        if wordCount == materialList.TOEIC600List.count - 1{
            endTest()
            //下の処理を続けないようにreturn
            return
        }
        
        //正解表示
        jpnWordLabel.text = materialList.TOEIC600List[wordCount].japanWords
        
        //解答後、初めてタップを有効にする
        tapOK = true
        
        //ボタン何回も押してアニメバグらないように
        selec1.isEnabled = false
        selec2.isEnabled = false
        selec3.isEnabled = false
        selec4.isEnabled = false
        
        timer.invalidate()
        timer2.invalidate()
        
        playIncorrectAniSound()
        incorrectArray.append(wordCount)
        

//
//        setTimer2()
//        endOrContinue()

    }
    
    
    func setTimer2(){
        //残り時間を表示
        timer2.invalidate()
        countdownLabel.textColor = .black
        timerCount = 5
        
        timer2 = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(ShuffleTestViewController.onTimer2(timer:)), userInfo: nil, repeats: true)
        countdownLabel.text = String(timerCount)
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
    
    
    
    
    
    // ジェスチャーイベント処理
    @objc func tap(_ sender: UITapGestureRecognizer) {
        //        print("Tap")
        //回答されていたら
        if tapOK == true{
            nextQuestionMethod()
        }
        
        //未回答なら何もしない
    }
    
    
    
    @IBAction func yomiageBtn(_ sender: Any) {
        soundYomiage()
    }
    
    func soundYomiage(){
        // AVSpeechSynthesizerのインスタンス作成
        self.speechSynthesizer = AVSpeechSynthesizer()
        // 読み上げる、文字、言語などの設定
        let utterance = AVSpeechUtterance(string:materialList.TOEIC600List[wordCount].Words) // 読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // 言語
        utterance.rate = 0.5; // 読み上げ速度
        utterance.pitchMultiplier = 0.9; // 読み上げる声のピッチ
        utterance.preUtteranceDelay = 0; // 読み上げるまでのため
        self.speechSynthesizer.speak(utterance)
    }
    
    
    @IBAction func answer(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            //一番上の選択肢が押された
            if whereIsCorrectSelection == 0{
                //正解が一番上の選択肢に表示されているから正解
                playCorrectAniSound()
            }else{
                playIncorrectAniSound()
                incorrectArray.append(wordCount)
            }
        case 2:
            //2番目の選択肢が押された
            if whereIsCorrectSelection == 1{
                //正解が2番目の選択肢に表示されているから正解
                playCorrectAniSound()
            }else{
                playIncorrectAniSound()
                incorrectArray.append(wordCount)
            }
        case 3:
            if whereIsCorrectSelection == 2{
                playCorrectAniSound()
            }else{
                playIncorrectAniSound()
                incorrectArray.append(wordCount)
            }
        case 4:
            if whereIsCorrectSelection == 3{
                playCorrectAniSound()
            }else{
                playIncorrectAniSound()
                incorrectArray.append(wordCount)
            }
        default:
            break
        }
        
        //タイマーとめる
        timer.invalidate()
        timer2.invalidate()
        
        //正解表示
        jpnWordLabel.text = materialList.TOEIC600List[wordCount].japanWords
        
        //解答後、初めてタップを有効にする
        tapOK = true
        
        //        nextQuesBtn.isEnabled = true
        
        //ボタン何回も押してアニメバグらないように
        selec1.isEnabled = false
        selec2.isEnabled = false
        selec3.isEnabled = false
        selec4.isEnabled = false
        
        if UserDefaults.standard.object(forKey: "visitedTest") == nil{
            //初回起動のみ、タップで次の問題いけるチュートリアル出す
            animation2View = .init(name: "tap")
            animation2View.frame = CGRect(x: view.bounds.width/2, y: view.bounds.height * 2/3, width: view.bounds.width/3, height: view.bounds.height/3)
            animation2View.contentMode = .scaleAspectFit
            animation2View.loopMode = .loop
            animation2View.animationSpeed = 2
            view.addSubview(animation2View)
            animation2View.play()
        }
        
    }
    
    
    func showRandomSelection(){
        
        //回答する前にタップで次の問題いかないように
        tapOK = false
        
        //正解選択肢を置く場所を決める
        whereIsCorrectSelection = Int(arc4random_uniform(UInt32(4)))
        
        //ダミー選択肢を表示させるために被りのない数字を生成する
        var damiNumber1 = Int(arc4random_uniform(UInt32(materialList.TOEIC600List.count)))
        var damiNumber2 = Int(arc4random_uniform(UInt32(materialList.TOEIC600List.count)))
        var damiNumber3 = Int(arc4random_uniform(UInt32(materialList.TOEIC600List.count)))
        
        if damiNumber1 == wordCount || damiNumber1 == damiNumber2 || damiNumber1 == damiNumber3 || damiNumber2 == damiNumber3{
            damiNumber1 = Int(arc4random_uniform(UInt32(materialList.TOEIC600List.count)))
            damiNumber2 = Int(arc4random_uniform(UInt32(materialList.TOEIC600List.count)))
            damiNumber3 = Int(arc4random_uniform(UInt32(materialList.TOEIC600List.count)))
        }else if damiNumber1 == wordCount || damiNumber1 == damiNumber2 || damiNumber1 == damiNumber3 || damiNumber2 == damiNumber3{
            //それでもダメならこれらを表示
            damiNumber1 = 25
            damiNumber2 = 65
            damiNumber3 = 90
        }
        
        //        print(damiNumber1,damiNumber2,damiNumber3)
        
        switch whereIsCorrectSelection {
        case 0:
            //正解を一番上に表示
            selec1.setTitle(materialList.TOEIC600List[wordCount].japanWords, for: UIControl.State.normal)
            //その他選択肢を表示
            selec2.setTitle(materialList.TOEIC600List[damiNumber1].japanWords, for: UIControl.State.normal)
            selec3.setTitle(materialList.TOEIC600List[damiNumber2].japanWords, for: UIControl.State.normal)
            selec4.setTitle(materialList.TOEIC600List[damiNumber3].japanWords, for: UIControl.State.normal)
            
        case 1:
            //正解を2番目に表示
            selec2.setTitle(materialList.TOEIC600List[wordCount].japanWords, for: UIControl.State.normal)
            //その他選択肢を表示
            selec1.setTitle(materialList.TOEIC600List[damiNumber1].japanWords, for: UIControl.State.normal)
            selec3.setTitle(materialList.TOEIC600List[damiNumber2].japanWords, for: UIControl.State.normal)
            selec4.setTitle(materialList.TOEIC600List[damiNumber3].japanWords, for: UIControl.State.normal)
        case 2:
            selec3.setTitle(materialList.TOEIC600List[wordCount].japanWords, for: UIControl.State.normal)
            //その他選択肢を表示
            selec2.setTitle(materialList.TOEIC600List[damiNumber1].japanWords, for: UIControl.State.normal)
            selec1.setTitle(materialList.TOEIC600List[damiNumber2].japanWords, for: UIControl.State.normal)
            selec4.setTitle(materialList.TOEIC600List[damiNumber3].japanWords, for: UIControl.State.normal)
        case 3:
            selec4.setTitle(materialList.TOEIC600List[wordCount].japanWords, for: UIControl.State.normal)
            //その他選択肢を表示
            selec2.setTitle(materialList.TOEIC600List[damiNumber1].japanWords, for: UIControl.State.normal)
            selec3.setTitle(materialList.TOEIC600List[damiNumber2].japanWords, for: UIControl.State.normal)
            selec1.setTitle(materialList.TOEIC600List[damiNumber3].japanWords, for: UIControl.State.normal)
            
        default:
            break
        }
        
        
    }
    
    func nextQuestionMethod(){
        
        //初回のみタップのチュートリアルでてるので消す
        if UserDefaults.standard.object(forKey: "visitedTest") == nil{
            animation2View.removeFromSuperview()
            UserDefaults.standard.set(true, forKey: "visitedTest")
        }
        
        
        //正解不正解のアニメ消す
        animationView.removeFromSuperview()
    
        //out of rangeしないように。
        if wordCount == materialList.TOEIC600List.count - 1{
            endTest()
            return
        }
        
        //タイマー再開
        setTimer()
        setTimer2()
        
        
        wordCount += 1
        //        wordLabel.text = materialList.TOEIC600List[wordCount].Words
        quesNumberLabel.text = "\(wordCount % 50 + 1) / 50"
        jpnWordLabel.text = ""
        selec1.isEnabled = true
        selec2.isEnabled = true
        selec3.isEnabled = true
        selec4.isEnabled = true
        
        switch receivedCellNumber {
        case 0:
            if wordCount == 50{
                //終了
                endTest()
            }else{
                //問題終了時に次の単語が表示されないようにelse内に書いてる
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 1:
            if wordCount == 100{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 2:
            if wordCount == 150{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 3:
            if wordCount == 200{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 4:
            if wordCount == 250{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 5:
            if wordCount == 300{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 6:
            if wordCount == 350{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        case 7:
            if wordCount == 400{
                endTest()
            }else{
                soundYomiage()
                wordLabel.text = materialList.TOEIC600List[wordCount].Words
                showRandomSelection()
            }
        default:
            break
        }
        
    }
    
    func endTest(){
        
     //学んだ単語数を記録
        learnedNumber += 50
        UserDefaults.standard.setValue(self.learnedNumber, forKey: "learnedNumber")
        
        //結果画面へ
        performSegue(withIdentifier: "result", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultVC = segue.destination as! ShuffleResultViewController
        
        //不正解の問題の番号を渡す
        resultVC.receivedIncorrectNumberArray = incorrectArray
        //単語の範囲を渡す（復習用保存のため）
        resultVC.receivedCellNumber = receivedCellNumber
//        //正解数不正解数を渡す
//        resultVC.correctCount = correctCount
//        resultVC.incorrectCount = incorrectCount
        
    }
    
    
    @IBAction func test(_ sender: Any) {
        showRandomSelection()
        animationView.removeFromSuperview()
    }
    
    func playCorrectAniSound(){
        //日本語を黒色に
        jpnWordLabel.textColor = .black
        
        animationView = .init(name: "success")
        //         animationView.frame = view.bounds
        animationView.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/4, width: view.bounds.width/2, height: view.bounds.height/2)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .repeat(1)
        animationView.animationSpeed = 2
        view.addSubview(animationView)
        animationView.play()
        
        //音ならす
        soundFile.playSound(fileName: "seikai", extensionName: "mp3")
        correctCount += 1
    }
    
    func playIncorrectAniSound(){
        
        //日本語を赤色に
        jpnWordLabel.textColor = .red
        
        animationView = .init(name: "failure")
        animationView.frame = CGRect(x: view.bounds.width/4, y: view.bounds.height/4, width: view.bounds.width/2, height: view.bounds.height/2)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .playOnce
        animationView.animationSpeed = 2
        view.addSubview(animationView)
        animationView.play()
        
        //音ならす
//        soundFile.playSound(fileName: "fuseikai", extensionName: "mp3")
        incorrectCount += 1
    }
    
    
    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
}
