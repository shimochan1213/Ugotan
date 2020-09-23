
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//あたらしい方 テストのレベル用

import UIKit
import ViewAnimator
import GoogleMobileAds

class WhichHinshiTestViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var tableView: UITableView!
    
    //タップされたセルの番号を入れておく（indexPath.row番目だね）
    var CellNumber = Int()
    var textArray = ["動詞編","名詞編","形容詞編","副詞編","その他重要表現"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //広告表示
        bannerView.adUnitID = "ca-app-pub-5717197999913003/4320533202"
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
            cell.backgroundColor = .systemYellow
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

        tableView.reloadData()
        //        UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        
        CellNumber = indexPath.row
        //        performSegue(withIdentifier: "next", sender: nil)
        
        
        
        performSegue(withIdentifier: "next", sender: nil)
        
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let TestRangeVC = segue.destination as! TestRangeViewController
        
        switch CellNumber {
        case 0:
            
            TestRangeVC.whichHinshi = "verb"
        case 1:
            
            TestRangeVC.whichHinshi = "noun"
        case 2:
            
            TestRangeVC.whichHinshi = "adjective"
        case 3:
            
            TestRangeVC.whichHinshi = "adverb"
        case 4:
            
            TestRangeVC.whichHinshi = "others"
        default:
            return
        }
        
        
    }
    
}
