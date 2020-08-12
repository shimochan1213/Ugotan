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
    
    @IBOutlet weak var makeAccount: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //機能実装までひとまずボタン隠す
        makeAccount.isHidden = true
        loginBtn.isHidden = true
        
        

        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        tipsBtn.layer.cornerRadius = 10.0
        manabuBtn.layer.cornerRadius = 10.0
        testBtn.layer.cornerRadius = 10.0
        
        //リザルトから戻ったときにナビゲーションバー消えないように
        self.navigationController?.isNavigationBarHidden = false
 
        
    }
    
 
    
 
    
    
    
}
