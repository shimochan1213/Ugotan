//
//  PreManabuViewController.swift
//  FireStoreEitangoApp
//
//  Created by 下川勇輝 on 2020/10/12.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit

class ShuffleHomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    //    @IBOutlet weak var reviewCollectinView: UICollectionView!
    @IBOutlet weak var testCollectionView: UICollectionView!
    
    @IBOutlet weak var ReviewCollectionView: UICollectionView!
    @IBOutlet weak var learnCollectionView: UICollectionView!
    
    let ranges: [String] = ["1-50","51-100","101-150","151-200","201-250","251-300","301-350","351-400"]
    
    //タップされたセルの番号を入れておく
    var cellNumber = Int()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionViewプロトコルのメソッドを使えるようにする
        
        learnCollectionView.dataSource = self
        learnCollectionView.delegate = self
    
        testCollectionView.dataSource = self
        testCollectionView.delegate = self
        
        ReviewCollectionView.dataSource = self
        ReviewCollectionView.delegate = self
        
        
        
        //         //セル同士の間隔調整
        //        let layout = UICollectionViewFlowLayout()
        ////        layout.minimumLineSpacing = 30
        //        layout.minimumInteritemSpacing = 30
        //        collectionView.collectionViewLayout = layout
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1{
            return ranges.count
        }else if collectionView.tag == 2{
            return ranges.count
        }else if collectionView.tag == 3{
            return ranges.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cellRadius:CGFloat = 30
        
        if collectionView.tag == 1{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            //                cell.backgroundColor = .blue
            
            cell.layer.masksToBounds = false
            // 影の方向（width=右方向、height=下方向、CGSize.zero=方向指定なし）
            cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            // 影の色
            cell.layer.shadowColor = UIColor.black.cgColor
            // 影の濃さ
            cell.layer.shadowOpacity = 0.05
            // 影をぼかし
            cell.layer.shadowRadius = 4
            cell.layer.cornerRadius = cellRadius
            
            let rangeLabel = cell.contentView.viewWithTag(1) as! UILabel
            rangeLabel.text = ranges[indexPath.row]
            
            //            let rangeImage = cell.viewWithTag(2) as! UIImageView
            //            rangeImage.image = UIImage(named: "120reo")
            
            
            return cell
            
        }else if collectionView.tag == 2{
            //確認テスト用のcollectionView
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell2", for: indexPath)
            
            cell2.layer.masksToBounds = false
            cell2.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            cell2.layer.shadowColor = UIColor.black.cgColor
            cell2.layer.shadowOpacity = 0.05
            cell2.layer.shadowRadius = 4
            cell2.layer.cornerRadius = cellRadius
            
            let reviewRangeLabel = cell2.contentView.viewWithTag(1) as! UILabel
            reviewRangeLabel.text = ranges[indexPath.row]
            
            return cell2
            
        }else if collectionView.tag == 3{
            //review用のcollectionView
            let cell3 = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell3", for: indexPath)
            
            cell3.layer.masksToBounds = false
            cell3.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
            cell3.layer.shadowColor = UIColor.black.cgColor
            cell3.layer.shadowOpacity = 0.05
            cell3.layer.shadowRadius = 4
            cell3.layer.cornerRadius = cellRadius
            
            let reviewRangeLabel = cell3.contentView.viewWithTag(1) as! UILabel
            reviewRangeLabel.text = ranges[indexPath.row]
            
            return cell3
            
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView.tag == 1{
            let cellSize : CGFloat = self.view.bounds.width * 6/7
            return CGSize(width: cellSize, height: self.view.bounds.height/5)
        }else if collectionView.tag == 2{
            let cellSize : CGFloat = self.view.bounds.width * 6/7
            return CGSize(width: cellSize, height: self.view.bounds.height/5)
        }else if collectionView.tag == 3{
            let cellSize : CGFloat = self.view.bounds.width * 6/7
            return CGSize(width: cellSize, height: self.view.bounds.height/5)
        }
        return CGSize(width: 100, height: 100)
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView.tag == 1{
            return 1
        }else if collectionView.tag == 2{
            return 1
        }else if collectionView.tag == 3{
            return 1
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView.tag == 1{
            cellNumber = indexPath.row
            performSegue(withIdentifier: "manabu", sender: nil)
        }else if collectionView.tag == 2{
            cellNumber = indexPath.row
            performSegue(withIdentifier: "test", sender: nil)
        }else if collectionView.tag == 3{
            cellNumber = indexPath.row
            performSegue(withIdentifier: "review", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //単語の範囲を次の画面へ伝える（押されたセルを教えることで伝えてる
        
        if segue.identifier == "manabu"{
            let ManabuVC = segue.destination as! ShuffleManabuViewController
            ManabuVC.receivedCellNumber  = cellNumber
        }else if segue.identifier == "test"{
            let TestVC = segue.destination as! ShuffleTestViewController
//            TestVC.receivedCellNumber  = cellNumber
        }else if segue.identifier == "review"{
            let ReviewVC = segue.destination as! ShuffleReviewViewController
//            ReviewVC.receivedCellNumber = cellNumber
        }
    }
    
    
    
    
    
    
    
    
    
    
    
}
