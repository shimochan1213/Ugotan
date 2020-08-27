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

//    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var tableView: UITableView!
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
        
        print(resultIncorrectNumberArray)
//        //広告表示
//        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
//        bannerView.rootViewController = self
//        bannerView.load(GADRequest())
        
         
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
    
    


}
