//
//  SettingViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/09/05.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit

//設定画面のコントローラ

extension UserDefaults {

    var sliderValue: Float {
        get { return float(forKey: "SliderValue") }
        set { set(newValue, forKey: "SliderValue") }
    }
}


class SettingViewController: UIViewController {
    
    var gifOnOff = true
    var switchOnOff = false
    @IBOutlet weak var secSliderForManabu: UISlider!
    var secForManabu = Int()
    @IBOutlet weak var secLabel: UILabel!
    
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
        
     
        //保存されている値をスライダーに反映
        secSliderForManabu.value = UserDefaults.standard.sliderValue
        
        
        if UserDefaults.standard.object(forKey: "secForManabu") != nil{
            secForManabu = UserDefaults.standard.object(forKey: "secForManabu") as! Int
            secLabel.text = "学ぶモードの自動遷移秒数： \(secForManabu)"
        }else{
            secLabel.text = "学ぶモードの自動遷移秒数： 6"
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
    
    @IBAction func sliderValue(_ sender: UISlider) {
        //学ぶモードの自動遷移までの時間を設定
        secForManabu = Int(sender.value)
        secLabel.text = "学ぶモードの自動遷移秒数： \(secForManabu)"

        UserDefaults.standard.set(secForManabu, forKey: "secForManabu")
        
        UserDefaults.standard.sliderValue = secSliderForManabu.value
    }
    
    
    
    
    
}
