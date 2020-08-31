//
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.












import UIKit
import ViewAnimator
import GoogleMobileAds

//動詞編をタップされたときに表示されるセルたち。30こずつ範囲を選ばせる予定。

class ReviewRangeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{


    
  
    var receivedCellNumber = 0
    
    var whichHinshi = String()
    
    let materialList = MaterialList()
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //タップされたセルの番号を入れておく（indexPath.row番目だね）
    var CellNumber = Int()
     var textArray = ["0-30","31-60","61-90","91-120","121-150","151-180"]
     
     override func viewDidLoad() {
         super.viewDidLoad()

         tableView.delegate = self
         tableView.dataSource = self
        
        
        
        //広告表示
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
         
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         //配列の中身の数だけセルを返す
        var numberOfRows = Int()
        
        switch whichHinshi {
            
            //30こ刻みでやるのであれば31で割るべき（余分なセルを作らない様に）
        case "verb":
            numberOfRows = materialList.TOEIC600verbList.count/31 + 1
        case "noun":
            numberOfRows = materialList.TOEIC600NounList.count/31 + 1
        case "adjective":
            numberOfRows = materialList.TOEIC600AdjectiveList.count/31 + 1
        case "adverb":
            numberOfRows = materialList.TOEIC600AdverbList.count/31 + 1
        case "others":
            numberOfRows = materialList.TOEIC600OthersList.count/31 + 1
        default:
            print("エラー")
        }
        
        
         return numberOfRows
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
         
         //偶数のセルの時
         if indexPath.row % 2 == 0{
             
            cell.backgroundColor = .opaqueSeparator
             
         }else{
            cell.backgroundColor = .init(red: 80/255, green: 208/255, blue: 255/255, alpha: 1.0)
         }
         
         cell.textLabel?.text = textArray[indexPath.row]
         cell.textLabel?.font = .boldSystemFont(ofSize: 40)
        cell.textLabel?.textColor = .white
        //セルに丸みを帯びさせる
        cell.layer.cornerRadius = 8
      
         
         return cell
         
     }
     
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
     }
     
     //セルがタップされた時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let animation = [AnimationType.rotate(angle: CGFloat.pi/6)]
        let animation = [AnimationType.random()]
        
        tableView.reloadData()
        UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        //どのセルが押されたか記録
        CellNumber = indexPath.row
        
      
             performSegue(withIdentifier: "next", sender: nil)
           
      

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let ReviewVC = segue.destination as! ReviewViewController
        ReviewVC.receivedCellNumber = CellNumber

      
        switch whichHinshi {
        case "verb":
            ReviewVC.whichHinshi = "verb"
           
        case "noun":
            ReviewVC.whichHinshi = "noun"
        case "adjective":
            ReviewVC.whichHinshi = "adjective"
        case "adverb":
            ReviewVC.whichHinshi = "adverb"
        case "others":
            ReviewVC.whichHinshi = "others"
        default:
            return
        }
        
      
        
        
    }
    
}
