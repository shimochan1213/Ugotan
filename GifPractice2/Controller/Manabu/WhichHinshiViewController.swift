//
//  LearningLevelTableViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/09.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.


import UIKit
import ViewAnimator
import GoogleMobileAds

class WhichHinshiViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
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
        bannerView.adUnitID = "ca-app-pub-5717197999913003/1908900008"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        //リザルトから戻ったときにナビゲーションバー消えないように
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
        //        let animation = [AnimationType.zoom(scale: 1.1)]
        //        let animation = [AnimationType.random()]
        //        let animation = [AnimationType.from(direction: .left, offset: 0.2)]
        
        
        tableView.reloadData()
        //         UIView.animate(views: tableView.visibleCells, animations: animation)
        
        
        
        
        CellNumber = indexPath.row
        
        
        performSegue(withIdentifier: "next", sender: nil)
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        switch CellNumber {
        case 0:
            //動詞であるという情報を送る
            let verbTestRangeVC = segue.destination as! ManabuRangeViewController
            verbTestRangeVC.whichHinshi = "verb"
        case 1:
            //名詞であるという情報を送る
            let verbTestRangeVC = segue.destination as! ManabuRangeViewController
            verbTestRangeVC.whichHinshi = "noun"
        case 2:
            //形容詞であるという情報を送る
            let verbTestRangeVC = segue.destination as! ManabuRangeViewController
            verbTestRangeVC.whichHinshi = "adjective"
        case 3:
            //副詞
            let verbTestRangeVC = segue.destination as! ManabuRangeViewController
            verbTestRangeVC.whichHinshi = "adverb"
        case 4:
            //その他
            let verbTestRangeVC = segue.destination as! ManabuRangeViewController
            verbTestRangeVC.whichHinshi = "others"
        default:
            return
        }
        
    }
    
}
