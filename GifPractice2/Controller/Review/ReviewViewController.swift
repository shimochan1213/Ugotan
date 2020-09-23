//
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.


import UIKit
import ViewAnimator
import GoogleMobileAds


class ReviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    //復習画面のコントローラ
    
    @IBOutlet weak var tableView: UITableView!
    
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
        switch whichHinshi {
        case "verb":
            switch receivedCellNumber{
            case 0:if UserDefaults.standard.object(forKey: "verb0") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "verb0") as! [Int]
                }
            case 1:if UserDefaults.standard.object(forKey: "verb1") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "verb1") as! [Int]
                }
            case 2:if UserDefaults.standard.object(forKey: "verb2") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "verb2") as! [Int]
                }
            case 3:if UserDefaults.standard.object(forKey: "verb3") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "verb3") as! [Int]
                }
            default: return
            }
            
            
        case "noun":
            switch receivedCellNumber{
            case 0:if UserDefaults.standard.object(forKey: "noun0") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "noun0") as! [Int]
                }
            case 1:if UserDefaults.standard.object(forKey: "noun1") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "noun1") as! [Int]
                }
            case 2:if UserDefaults.standard.object(forKey: "noun2") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "noun2") as! [Int]
                }
            case 3:if UserDefaults.standard.object(forKey: "noun3") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "noun3") as! [Int]
                }
            case 4:if UserDefaults.standard.object(forKey: "noun4") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "noun4") as! [Int]
                }
            default: return
            }
        case "adjective":
            switch receivedCellNumber{
            case 0:if UserDefaults.standard.object(forKey: "adjective0") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "adjective0") as! [Int]
                }
            case 1:if UserDefaults.standard.object(forKey: "adjective1") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "adjective1") as! [Int]
                }
            case 2:if UserDefaults.standard.object(forKey: "adjective2") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "adjective2") as! [Int]
                }
            default: return
            }
            
        case "adverb":
            switch receivedCellNumber{
            case 0:if UserDefaults.standard.object(forKey: "adverb0") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "adverb0") as! [Int]
                }
            default: return
            }
            
        case "others":
            switch receivedCellNumber{
            case 0:if UserDefaults.standard.object(forKey: "others0") != nil{
                resultIncorrectNumberArray = UserDefaults.standard.object(forKey: "others0") as! [Int]
                }
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
        case "verb":
            wordLabel.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].Words
        case "noun":
            wordLabel.text = materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].Words
        case "adjective":
            wordLabel.text = materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].Words
        case "adverb":
            wordLabel.text = materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].Words
        case "others":
            wordLabel.text = materialList.TOEIC600OthersList[resultIncorrectNumberArray[indexPath.row]].Words
        default: print("どれでもないよ")
        }
        
        
        
        let jpnWordLabel = cell.viewWithTag(2) as! UILabel
        switch whichHinshi {
        case "verb":
            jpnWordLabel.text = materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "noun":
            jpnWordLabel.text = materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "adjective":
            jpnWordLabel.text = materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "adverb":
            jpnWordLabel.text = materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].japanWords
        case "others":
            jpnWordLabel.text = materialList.TOEIC600OthersList[resultIncorrectNumberArray[indexPath.row]].japanWords
            
        default: print("どれでもないよ")
        }
        
        
        
        let gifView = cell.viewWithTag(3) as! UIImageView
        switch whichHinshi {
        case "verb":
            gifView.loadGif(name: materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "noun":
            gifView.loadGif(name: materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "adjective":
            gifView.loadGif(name: materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "adverb":
            gifView.loadGif(name: materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].Words)
        case "others":
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
        
        tableView.reloadData()
        //        UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        
        
        switch whichHinshi {
        case "verb":
            soundFile.playSound(fileName: materialList.TOEIC600verbList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "noun":
            soundFile.playSound(fileName: materialList.TOEIC600NounList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "adjective":
            soundFile.playSound(fileName: materialList.TOEIC600AdjectiveList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "adverb":
            soundFile.playSound(fileName: materialList.TOEIC600AdverbList[resultIncorrectNumberArray[indexPath.row]].Words, extensionName: "mp3")
        case "others":
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
    
    
    
    
}
