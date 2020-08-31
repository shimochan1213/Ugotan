
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.


import UIKit
import ViewAnimator
import GoogleMobileAds

class WhichReviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var tableView: UITableView!
   
    var firstOrNot = true
    //タップされたセルの番号を入れておく（indexPath.row番目だね）
    var CellNumber = Int()
    var textArray = ["動詞編","名詞編","形容詞編","副詞編","その他重要表現"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //初起動かどうかのチェック
        if UserDefaults.standard.object(forKey: "alreadyReview") != nil{
            firstOrNot = UserDefaults.standard.object(forKey: "alreadyReview") as! Bool
        }
        
        if firstOrNot == true{
        showAlert()
        }
        
        
        
        
        
        
        
        
        //広告表示
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        //リザルトから戻ったときにナビゲーションバー消えないように再表示。
        self.navigationController?.isNavigationBarHidden = false
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //配列の中身の数だけセルを返す
        return textArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //偶数のセルの時
        if indexPath.row % 2 == 0{
            
            cell.backgroundColor = .opaqueSeparator
            
        }else{
            cell.backgroundColor = .init(red: 80/255, green: 208/255, blue: 255/255, alpha: 1.0)
            
        }
        
//        cell.textLabel?.font = UIFont(name: "MarkerFelt-Thin", size: 40)
        cell.textLabel?.text = textArray[indexPath.row]
        cell.textLabel?.font = .boldSystemFont(ofSize: 40)
        cell.textLabel?.textColor = .white
        
        //セルに丸みを帯びさせる
        cell.layer.cornerRadius = 8
        
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //         return view.frame.size.height / CGFloat(textArray.count)
        return 80
    }
    
    //セルがタップされた時に呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //         let animation = [AnimationType.from(direction: .right, offset: 30.0)]
        
        //         let animation = [AnimationType.zoom(scale: 50)]
        
//        let animation = [AnimationType.rotate(angle: CGFloat.pi/6)]
//        let animation = [AnimationType.random()]
        tableView.reloadData()
//        UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        
        CellNumber = indexPath.row
        //        performSegue(withIdentifier: "next", sender: nil)
        
        
        
        performSegue(withIdentifier: "next", sender: nil)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let ReviewRangeVC = segue.destination as! ReviewRangeViewController
        
        switch CellNumber {
        case 0:
            
            ReviewRangeVC.whichHinshi = "verb"
        case 1:
          
            ReviewRangeVC.whichHinshi = "noun"
        case 2:
          
            ReviewRangeVC.whichHinshi = "adjective"
        case 3:
          
            ReviewRangeVC.whichHinshi = "adverb"
        case 4:
         
            ReviewRangeVC.whichHinshi = "others"
        default:
            return
        }
        
        
    }
    
    
    func showAlert(){
       
        
        let alertController = UIAlertController(title: "復習モードへようこそ", message: "テストモードで間違えた単語のみを表示します。繰り返し英単語に触れてくださいね!", preferredStyle: .alert)
        
        let action1 = UIAlertAction(title: "はい", style: .default) { (alert) in
            
            
            return
            
            
        }
        
        alertController.addAction(action1)
        
        //ユーザーデフォルに起動した情報を記録
        firstOrNot = false
        UserDefaults.standard.set(firstOrNot, forKey: "alreadyReview")
        self.present(alertController, animated: true,completion: nil)
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
}
