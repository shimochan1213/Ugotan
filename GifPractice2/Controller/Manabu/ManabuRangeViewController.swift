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

class ManabuRangeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

//    @IBOutlet weak var bannerView: GADBannerView!
    
  
    var receivedCellNumber = 0
    
    var whichHinshi = String()
    let materialList = MaterialList()
    let manabuVC = ManabuViewController()

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bannerView: GADBannerView!
    
    //タップされたセルの番号を入れておく（indexPath.row番目だね）
    var CellNumber = Int()
     var textArray = ["1-30","31-60","61-90","91-120","121-150","151-180"]
     
     override func viewDidLoad() {
         super.viewDidLoad()

         tableView.delegate = self
         tableView.dataSource = self
        
        //広告表示
        bannerView.adUnitID = "ca-app-pub-5717197999913003/2476547037"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        

        
         
     }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
//        //この画面に戻った時に学ぶモードのタイマーを無効化
//        manabuVC.timer?.invalidate()
        
    }
     
     func numberOfSections(in tableView: UITableView) -> Int {
         return 1
     }
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         //配列の中身の数だけセルを返す
        
        var numberOfRows = Int()
        
        //品詞ごとに変えよう
        
        //名詞編
        switch whichHinshi {
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
            cell.backgroundColor = .systemOrange
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
//        let animation = [AnimationType.random()]
        tableView.reloadData()
//        UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        
        CellNumber = indexPath.row
        
        performSegue(withIdentifier: "manabu", sender: nil)
        
        
    }
    
        
        
        
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
          //単語の範囲を次の画面へ伝える（押されたセルを教えることで伝えてる）
        
            let ManabuVC = segue.destination as! ManabuViewController
            ManabuVC.receivedCellNumber  = CellNumber
        
        //どの品詞なのかを伝える
        switch whichHinshi {
        case "verb":
            ManabuVC.whichHinshi = "verb"
        case "noun":
            ManabuVC.whichHinshi = "noun"
        case "adjective":
            ManabuVC.whichHinshi = "adjective"
        case "adverb":
            ManabuVC.whichHinshi = "adverb"
        case "others":
            ManabuVC.whichHinshi = "others"
        default:
            return
        }
        
        
     
        }
    
    
    
        
        
    }
    

