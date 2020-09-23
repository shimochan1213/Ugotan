//
//  ModeSelectViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/07.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit
import GoogleMobileAds

//トップ画面


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
        
        
        

        bannerView.adUnitID = "ca-app-pub-5717197999913003/8439320158"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        
       
        
        
        tipsBtn.layer.cornerRadius = 10.0
        manabuBtn.layer.cornerRadius = 10.0
        testBtn.layer.cornerRadius = 10.0
        reviewBtn.layer.cornerRadius = 10.0
        settingBtn.layer.cornerRadius = 10.0
        
        //リザルトから戻ったときにナビゲーションバー消えないように
        self.navigationController?.isNavigationBarHidden = false
 
        
    }
    

 
    
 
    
    
    
}
