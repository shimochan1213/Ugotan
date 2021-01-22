//
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.


import UIKit
import GoogleMobileAds
import AVFoundation


class ShuffleReviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    //復習画面のコントローラ
    
    @IBOutlet weak var tableView: UITableView!
    
    var speechSynthesizer : AVSpeechSynthesizer!
    
    var receivedCellNumber = Int()
    
    var verb0:[Int] = []
    var verb1:[Int] = []
    var verb2:[Int] = []
    var verb3:[Int] = []
    var noun0:[Int] = []
    var noun1:[Int] = []
    var noun2:[Int] = []
    var noun3:[Int] = []
    var noun4:[Int] = []
    var adjective0:[Int] = []
    var adjective1:[Int] = []
    var adjective2:[Int] = []
    var adverb0:[Int] = []
    var others0:[Int] = []
    
    var TOEIC0:[Int] = []
    var TOEIC1:[Int] = []
    var TOEIC2:[Int] = []
    var TOEIC3:[Int] = []
    var TOEIC4:[Int] = []
    var TOEIC5:[Int] = []
    var TOEIC6:[Int] = []
    var TOEIC7:[Int] = []
    var TOEIC8:[Int] = []
    
    
    
    //間違えた問題の番号が入っている配列
    var resultIncorrectNumberArray: [Int] = []
    
    var materialList = MaterialList()
    
    var whichHinshi = String()
    let soundFile = SoundFile()
    //タップされたセルの番号を入れておく（indexPath.row番目だね）
    var CellNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        
        
        //resultIncorrectNumberArrayに、ユーザーデフォルトで保存したものを呼び出し、いれる
            switch receivedCellNumber{
            case 0:if UserDefaults.standard.object(forKey: "TOEIC0") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC0") as! [Int]
                }
            case 1:if UserDefaults.standard.object(forKey: "TOEIC1") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC1") as! [Int]
                }
            case 2:if UserDefaults.standard.object(forKey: "TOEIC2") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC2") as! [Int]
                }
            case 3:if UserDefaults.standard.object(forKey: "TOEIC3") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC3") as! [Int]
                }
            case 4:if UserDefaults.standard.object(forKey: "TOEIC4") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC4") as! [Int]
                }
            case 5:if UserDefaults.standard.object(forKey: "TOEIC5") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC5") as! [Int]
                }
            case 6:if UserDefaults.standard.object(forKey: "TOEIC6") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC6") as! [Int]
                }
            case 7:if UserDefaults.standard.object(forKey: "TOEIC7") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "TOEIC7") as! [Int]
                }
            default: break
            }
            
            
        }
        
        
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の中身の数だけセルを返す。間違えた問題の数だけセルを作る
        return resultIncorrectNumberArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let wordLabel = cell.viewWithTag(1) as! UILabel
   
            wordLabel.text = materialList.TOEIC600List[resultIncorrectNumberArray[indexPath.row]].Words

        
        let jpnWordLabel = cell.viewWithTag(2) as! UILabel
        
            jpnWordLabel.text = materialList.TOEIC600List[resultIncorrectNumberArray[indexPath.row]].japanWords
            
        
        let gifView = cell.viewWithTag(3) as! UIImageView
       
            gifView.loadGif(name: materialList.TOEIC600List[resultIncorrectNumberArray[indexPath.row]].Words)
     
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height * 2/7
    }
    
    //セルがタップされた時に呼ばれる
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        tableView.reloadData()
//        //        UIView.animate(views: tableView.visibleCells, animations: animation)
//
//
//            soundFile.playSound(fileName: materialList.TOEIC600List[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
//
//
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        soundYomiage(string: materialList.TOEIC600List[resultIncorrectNumberArray[indexPath.row]].Words)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
    
    @IBAction func backToHome(_ sender: Any) {
//        self.navigationController?.popToRootViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    
    func soundYomiage(string:String){
        // AVSpeechSynthesizerのインスタンス作成
        self.speechSynthesizer = AVSpeechSynthesizer()
        // 読み上げる、文字、言語などの設定
        let utterance = AVSpeechUtterance(string:string) // 読み上げる文字
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US") // 言語
        utterance.rate = 0.5; // 読み上げ速度
        utterance.pitchMultiplier = 0.9; // 読み上げる声のピッチ
        utterance.preUtteranceDelay = 0; // 読み上げるまでのため
        self.speechSynthesizer.speak(utterance)
    }
    
    
    
    @IBAction func reoButton(_ sender: Any) {
        let alertController = UIAlertController(title: "頑張っていますね！", message: "間違えた単語は多めに音読してみましょう", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "はい", style: .default) { (alert) in
            
            
            
        }
        
        alertController.addAction(action1)
        
        self.present(alertController, animated: true,completion: nil)
        
        
    }
    
    
    
    
}
