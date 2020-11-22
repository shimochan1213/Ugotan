//
//  ModeSelectViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/06/07.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit
import GoogleMobileAds



class ModeSelectViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var bannerView: GADBannerView!

    @IBOutlet weak var tipsBtn: UIButton!
    @IBOutlet weak var settingBtn: UIButton!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var learnedNumberLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileView: UIView!
    var learnedNumber = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.adUnitID = "ca-app-pub-5717197999913003/8439320158"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        
        tipsBtn.layer.cornerRadius = 10.0
        settingBtn.layer.cornerRadius = 10.0
        
//        //リザルトから戻ったときにナビゲーションバー消えないように
//        self.navigationController?.isNavigationBarHidden = false
        NotificationCenter.default.addObserver(self, selector: #selector(fromEdit), name: .notificationFromEditName, object: nil)
        
        
        if UserDefaults.standard.object(forKey: "profileIconImage") != nil{
            let data = UserDefaults.standard.object(forKey: "profileIconImage")
            profileImageView.image = UIImage(data: data as! Data)
        }
        
        if UserDefaults.standard.object(forKey: "userName") != nil{
            userNameLabel.text =  UserDefaults.standard.object(forKey: "userName") as! String
        }
        
        if UserDefaults.standard.object(forKey: "learnedNumber") != nil{
            learnedNumber = UserDefaults.standard.object(forKey: "learnedNumber") as! Int
            learnedNumberLabel.text = String(learnedNumber)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        
        //リザルトから戻ったときにナビゲーションバー消えないように
        self.navigationController?.isNavigationBarHidden = false
        
        
//        if UserDefaults.standard.object(forKey: "userName") != nil{
//            userNameLabel.text =  UserDefaults.standard.object(forKey: "userName") as! String
//        }
        
       
        
        
    }
    
    @objc func fromEdit() {
        userNameLabel.text = UserDefaults.standard.object(forKey: "userName") as! String
    }
    
    
    @IBAction func tapped(_ sender: Any) {
        performSegue(withIdentifier: "newUserName", sender: nil)
        print("aaa")
    }
    
    @IBAction func imageTapped(_ sender: Any) {
        showAlert()
        print("aaa")
    }
    
    //以下、アイコン設定関連
    //アラートを出す
    func showAlert(){
        
        let alertController = UIAlertController(title: "選択", message: "どちらの方法で画像を追加しますか", preferredStyle: .actionSheet)
        
        let action1 = UIAlertAction(title: "カメラ", style: .default) { (alert) in
            
            self.doCamera()
            
        }
        
        let action2 = UIAlertAction(title: "アルバム", style: .default) { (alert) in
            
            self.doAlubm()
            
        }
        
        let action3 = UIAlertAction(title: "キャンセル", style: .cancel)
        
        alertController.addAction(action1)
        alertController.addAction(action2)
        alertController.addAction(action3)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //カメラ立ち上げメソッド
    func doCamera(){
        
        let sourceType:UIImagePickerController.SourceType = .camera
        
        //カメラ利用かチェック
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    //アルバム立ち上げメソッド
    func doAlubm(){
        
        let sourceType:UIImagePickerController.SourceType = .photoLibrary
        
        //カメラ利用かチェック
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            
            let cameraPicker = UIImagePickerController()
            cameraPicker.allowsEditing = true
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            self.present(cameraPicker, animated: true, completion: nil)
        }
    }
    
    //カメラやアルバムで選択された画像のデータを受けとる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if info[.originalImage] as? UIImage != nil{
            
            //         let selectedImage = info[.originalImage] as! UIImage
            let selectedImage = info[.editedImage] as! UIImage
            
            profileImageView.image = selectedImage
            
            //userDefaultsはUIImage型は保存できないためdata型で保存
            let data = profileImageView.image?.jpegData(compressionQuality: 0.1)
            UserDefaults.standard.setValue(data, forKey: "profileIconImage")
            
    
            
            //ピッカーを閉じる
            picker.dismiss(animated: true, completion: nil)
        }
        
    }
    
    
    
    
    

 
    
 
    
    
    
}
