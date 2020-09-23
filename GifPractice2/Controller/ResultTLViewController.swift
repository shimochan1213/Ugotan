//
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.


import UIKit
import ViewAnimator
import GoogleMobileAds


class ResultTLViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
//twitterなどのTL風にテスト結果（間違えた単語）を表示するコントローラ
    
    
    @IBOutlet weak var tableView: UITableView!
    //間違えた問題の番号が入っている配列
    var resultIncorrectNumberArray: [Int] = []
    
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
    
    
    
    
    var receivedCellNumber = Int()
    
    var materialList = MaterialList()
    
    var whichHinshi = String()
    let soundFile = SoundFile()
    //タップされたセルの番号を入れておく（indexPath.row番目だね）
    var CellNumber = Int()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        print(resultIncorrectNumberArray)
        
        //全問正解の時はアラート出す
        if resultIncorrectNumberArray.isEmpty == true{
            showCongratsAlert()
        }
        
        
        //復習用に、間違えた単語たちを保存
        //動詞　セル0 ならば　”verb0”で配列の中身を保存
        switch whichHinshi {
        case "Verb":
            switch receivedCellNumber{
            case 0:verb0 = resultIncorrectNumberArray
            UserDefaults.standard.set(verb0, forKey: "verb0")
            case 1:verb1 = resultIncorrectNumberArray
            UserDefaults.standard.set(verb1, forKey: "verb1")
            case 2:verb2 = resultIncorrectNumberArray
            UserDefaults.standard.set(verb2, forKey: "verb2")
            case 3:verb3 = resultIncorrectNumberArray
            UserDefaults.standard.set(verb3, forKey: "verb3")
            default: return
            }
            
            
        case "Noun":
            switch receivedCellNumber{
            case 0:noun0 = resultIncorrectNumberArray
            UserDefaults.standard.set(noun0, forKey: "noun0")
            case 1:noun1 = resultIncorrectNumberArray
            UserDefaults.standard.set(noun1, forKey: "noun1")
            case 2:noun2 = resultIncorrectNumberArray
            UserDefaults.standard.set(noun2, forKey: "noun2")
            case 3:noun3 = resultIncorrectNumberArray
            UserDefaults.standard.set(noun3, forKey: "noun3")
            case 4:noun4 = resultIncorrectNumberArray
            UserDefaults.standard.set(noun4, forKey: "noun4")
            default: return
            }
        case "Adjective":
            switch receivedCellNumber{
            case 0:adjective0 = resultIncorrectNumberArray
            UserDefaults.standard.set(adjective0, forKey: "adjective0")
            case 1:adjective1 = resultIncorrectNumberArray
            UserDefaults.standard.set(adjective1, forKey: "adjective1")
            case 2:adjective2 = resultIncorrectNumberArray
            UserDefaults.standard.set(adjective2, forKey: "adjective2")
            default: return
            }
            
        case "Adverb":
            switch receivedCellNumber{
            case 0:adverb0 = resultIncorrectNumberArray
            UserDefaults.standard.set(adverb0, forKey: "adverb0")
            default: return
            }
            
        case "Others":
            switch receivedCellNumber{
            case 0:others0 = resultIncorrectNumberArray
            UserDefaults.standard.set(others0, forKey: "others0")
            default: return
            }
            
        default: print("どれでもないよ")
            
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
        switch whichHinshi {
        case "Verb":
            wordLabel.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].Words
        case "Noun":
            wordLabel.text = materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].Words
        case "Adjective":
            wordLabel.text = materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].Words
        case "Adverb":
            wordLabel.text = materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].Words
        case "Others":
            wordLabel.text = materialList.TOEIC600OthersList[resultIncorrectNumberArray[indexPath.row]].Words
        default: print("どれでもないよ")
        }
        
        
        
        let jpnWordLabel = cell.viewWithTag(2) as! UILabel
        switch whichHinshi {
        case "Verb":
            jpnWordLabel.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "Noun":
            jpnWordLabel.text = materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "Adjective":
            jpnWordLabel.text = materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "Adverb":
            jpnWordLabel.text = materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "Others":
            jpnWordLabel.text = materialList.TOEIC600OthersList[resultIncorrectNumberArray[indexPath.row]].japanWords
            
        default: print("どれでもないよ")
        }
        
        
        
        let gifView = cell.viewWithTag(3) as! UIImageView
        switch whichHinshi {
        case "Verb":
            gifView.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "Noun":
            gifView.loadGif(name: materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "Adjective":
            gifView.loadGif(name: materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "Adverb":
            gifView.loadGif(name: materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "Others":
            gifView.loadGif(name: materialList.TOEIC600OthersList[resultIncorrectNumberArray[indexPath.row]].Words)
            
        default: print("どれでもないよ")
            
        }
        
        
        
        //        //セルに丸みを帯びさせる
        //        cell.layer.cornerRadius = 8
        
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height/4
    }
    
    //セルがタップされた時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        let animation = [AnimationType.rotate(angle: CGFloat.pi/6)]
        //        let animation = [AnimationType.zoom(scale: 10)]
        
        tableView.reloadData()
        //        UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        
        
        switch whichHinshi {
        case "Verb":
            soundFile.playSound(fileName: materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "Noun":
            soundFile.playSound(fileName: materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "Adjective":
            soundFile.playSound(fileName: materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "Adverb":
            soundFile.playSound(fileName: materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "Others":
            soundFile.playSound(fileName: materialList.TOEIC600OthersList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        default: print("どれでもないよ")
            
        }
        
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
    }
    
    
    @IBAction func backToHome(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    @IBAction func reoButton(_ sender: Any) {
        let alertController = UIAlertController(title: "頑張っていますね！", message: "間違えた単語は多めに音読してみましょう", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "はい", style: .default) { (alert) in
            
            
            
        }
        
        alertController.addAction(action1)
        
        self.present(alertController, animated: true,completion: nil)
        
        
    }
    
    func showCongratsAlert(){
        //全問正解の時にアラートを出す
        
        let alertController = UIAlertController(title: "全問正解です！", message: "素晴らしいです。引き続きがんばって下さいね。応援しています！", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "ホームへ", style: .default) { (alert) in
            self.navigationController?.popToRootViewController(animated: true)
        }
        
        let action2 = UIAlertAction(title: "範囲選択へ", style: .default) { (alert) in
            
            //     self.navigationController?.popViewController(animated: true)
            
            //2つ前の画面に戻る。
            let index = self.navigationController!.viewControllers.count - 3
            self.navigationController?.popToViewController(self.navigationController!.viewControllers[index], animated: true)
            
            
            //ナビゲーションバー再表示
            self.navigationController?.setNavigationBarHidden(false, animated: true)
        }
        
        
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        
        self.present(alertController, animated: true,completion: nil)
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
