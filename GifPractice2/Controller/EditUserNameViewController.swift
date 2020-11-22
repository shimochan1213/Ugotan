//
//  EditUserNameViewController.swift
//  FireStoreEitangoApp
//
//  Created by 下川勇輝 on 2020/10/29.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit


extension Notification.Name {
    static let notificationFromEditName = Notification.Name("SettingsDone")
}

class EditUserNameViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var renewBtn: UIButton!

    @IBOutlet weak var textField: UITextField!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        textField.placeholder = "新しいユーザー名を入れてください"

        
        textField.textColor = .systemBlue
        
        renewBtn.layer.cornerRadius = 10
        
        
      
        
    }
    
    //画面が閉じるときに、元のviewへ「閉じるよ！」と伝える（プロフィールデータを更新のため）
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.post(name: .notificationFromEditName, object: nil)
    }
    
    
    
    @IBAction func dismiss(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
    
    @IBAction func renewUserInformation(_ sender: Any) {
        //テキストが空でないなら、入れる
        if let newUserName = textField.text,!newUserName.isEmpty{
           
            UserDefaults.standard.setValue(newUserName, forKey: "userName")
            
            
            //アラート
            let alertController = UIAlertController(title: "成功", message: "ユーザー名を更新しました", preferredStyle: .actionSheet)
            let action = UIAlertAction(title:"OK", style: .default){(alert) in
                self.dismiss(animated: true, completion: nil)
            }
            
            
            alertController.addAction(action)
            self.present(alertController, animated:true)
            
        }else{
            //警告アラート
            let alertController2 = UIAlertController(title: "変更失敗", message: "新しいユーザー名を入力してください", preferredStyle: .actionSheet)
            let action2 = UIAlertAction(title:"OK", style: .default){(alert) in
                return
            }
            
            alertController2.addAction(action2)
            self.present(alertController2, animated:true)
            
        }
        
    }
    
    
    //タッチでキーボ閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textField.resignFirstResponder()
    }
    
    
    //リターンでキーボ閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
