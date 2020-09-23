//
//  SettingViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/09/05.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit

//設定画面のコントローラ

class SettingViewController: UIViewController {
    
    var gifOnOff = true
    var switchOnOff = false
    
    @IBOutlet weak var Gifswitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //リザルトから戻ったときにナビゲーションバー消えないように
        self.navigationController?.isNavigationBarHidden = false
        
        
        //スイッチonOff設定
        if UserDefaults.standard.object(forKey: "switchOn") != nil{
            switchOnOff = UserDefaults.standard.object(forKey: "switchOn") as! Bool
            if switchOnOff == true{
                Gifswitch.setOn(true, animated: true)
            }else{
                Gifswitch.setOn(false, animated: true)
            }
        }
        
        
        
    }
    
    
    @IBAction func testGifSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            //gif表示しない設定
            gifOnOff = false
            UserDefaults.standard.set(gifOnOff, forKey: "gifOnOff")
            
            //スイッチがonであることを保存
            switchOnOff = sender.isOn
            UserDefaults.standard.set(switchOnOff, forKey: "switchOn")
            
        } else {
            //gif表示する設定
            gifOnOff = true
            UserDefaults.standard.set(gifOnOff, forKey: "gifOnOff")
            
            //スイッチがoffであることを保存
            switchOnOff = false
            UserDefaults.standard.set(switchOnOff, forKey: "switchOn")
            
            
            
        }
    }
    
    
    
}
