//
//  ModeSelectViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/07.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit
import GoogleMobileAds


class ModeSelectViewController: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    @IBOutlet weak var manabuBtn: UIButton!
    @IBOutlet weak var testBtn: UIButton!
    @IBOutlet weak var tipsBtn: UIButton!
    @IBOutlet weak var reviewBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    
    @IBOutlet weak var makeAccount: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        //機能実装までひとまずボタン隠す
//        makeAccount.isHidden = true
//        loginBtn.isHidden = true
        
        

        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
//        manabuBtn.imageView?.contentMode = .scaleAspectFit
//        manabuBtn.contentHorizontalAlignment = .fill
//        manabuBtn.contentVerticalAlignment = .fill
//        manabuBtn.imageEdgeInsets = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 30)
//        manabuBtn.contentEdgeInsets = UIEdgeInsets(top: 85, left: 25, bottom: 25, right: 25)
//
//
//
//        reviewBtn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        
       
        
  
        
        
        
        tipsBtn.layer.cornerRadius = 10.0
        manabuBtn.layer.cornerRadius = 10.0
        testBtn.layer.cornerRadius = 10.0
        reviewBtn.layer.cornerRadius = 10.0
        settingBtn.layer.cornerRadius = 10.0
        
        //リザルトから戻ったときにナビゲーションバー消えないように
        self.navigationController?.isNavigationBarHidden = false
 
        
    }
    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        
//        manabuBtn.imageView?.frame = CGRect(x: self.view.frame.size.width/4, y: self.view.frame.size.height/4, width: self.view.frame.size.width/2, height: self.view.frame.size.height/2)
//    }
    
 
    
 
    
    
    
}
