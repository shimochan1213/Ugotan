//
//  ResultViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/28.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//


//間違えた単語を8個表示（resultIncorrectArrayの0番目から7番目）
//間違いが9個以上の場合は次のページまでつづく（そうでないときはページ移動ボタン隠す？）


import UIKit

class ResultViewController: UIViewController{

    
    var resultCorrectCount = 0
    var resultIncorrectCount = 0
    
   //間違えた問題の番号が入っている配列
    var resultIncorrectNumberArray: [Int] = []
    
    var resultCorrectNumber = 0
    var cellNumberForKekkaView = Int()
    
    let materialList = MaterialList()
    

    @IBOutlet weak var resultCorrectLabel: UILabel!
    @IBOutlet weak var resultIncorrectLabel: UILabel!
    @IBOutlet weak var correctRate: UILabel!
    

 
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var wordLabel1: UILabel!
    @IBOutlet weak var jpnLabel1: UILabel!
    @IBOutlet weak var gif1: UIImageView!
    
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var jpn2: UILabel!
    @IBOutlet weak var gif2: UIImageView!
    
    

    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        print(resultIncorrectNumberArray)
        
        wordLabel1.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].Words
        jpnLabel1.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].japanWords
        gif1.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].Words)
        
        label2.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[1]].Words
        jpn2.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[1]].japanWords
        gif2.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[1]].Words)
        
        
    
        
        //不正解が入ってる配列の中身を表示
        
        switch resultIncorrectNumberArray.count {
            case 0: return
            //全問正解。何も出さない
            case 1:
            //一つ目のラベルにgif、英単語、日本語を表示
            wordLabel1.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].Words
            jpnLabel1.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].japanWords
            gif1.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].Words)
            
            case 2:
                wordLabel1.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].Words
                jpnLabel1.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].japanWords
                gif1.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[0]].Words)
                
                label2.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[1]].Words
                jpn2.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[1]].japanWords
                gif2.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[1]].Words)
            //配列の0-1番目の単語を表示
//            case 3:
//            //0-2
//            case 4:
//            //0-3
//            case 5:
//            //0-4
//            case 6:
//            //0-5
//            case 7:
//            //0-6
//            case 8:
//            //0-7
          
        default:
            return
        }
        
        
//        resultCorrectLabel.text = "正解数：" + String(resultCorrectCount)
//        resultIncorrectLabel.text = "不正解数：" + String(resultIncorrectCount)
//        
//        //正答率を表示　小数点切り上げ
//        let rateOfCorrect = ((Double(resultCorrectCount) / (Double(resultCorrectCount)+Double(resultIncorrectCount)))*100)
//        let numRound = round(rateOfCorrect)
//        correctRate.text = "正解率は" + String(Int(numRound)) + "%です！"
        
        
    }
    
    
    
    @IBAction func backToModeLesect(_ sender: Any) {
        
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func backToLevelSelect(_ sender: Any) {
//        let testLevelVC = self.storyboard?.instantiateViewController(identifier: "testLevel") as! TestViewController
//        navigationController?.pushViewController(testLevelVC, animated: true)
        //ナビゲーションバー再表示（テスト画面で消したやつ）
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        // ２階層前の画面に戻る
        // layerNumber：階層番号を表す。０がトップ画面（rootView）
        let layerNumber = navigationController!.viewControllers.count
        self.navigationController?.popToViewController(navigationController!.viewControllers[layerNumber - 3], animated: true)
    }
    
    


    
    
    
    
    
}
