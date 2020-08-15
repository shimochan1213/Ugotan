////
////  RegisterViewController.swift
////  GifPractice2
////
////  Created by 下川勇輝 on 2020/06/10.
////  Copyright © 2020 Yuki Shimokawa. All rights reserved.
////
//
//import UIKit
//import Firebase
//import Lottie
//
//class RegisterViewController: UIViewController {
//
//    @IBOutlet weak var emailTextField: UITextField!
//    
//    @IBOutlet weak var passwordTextField: UITextField!
//
//    //クラスのインスタンス化
//    let animationView = AnimationView()
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
//
//    @IBAction func registerButton(_ sender: Any) {
//
//        //アニメーションのスタート
//        startAnimation()
//
//        //新規登録
//        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//
//            if error != nil{
//
//                print(error as Any)
//            }else{
//                print("ユーザーの作成に成功しました")
//
//                //アニメーションのストップ
//                self.stopAnimaiton()
//                //画面をモード選択の画面へ
////                self.navigationController?.popViewController(animated: true)
//                self.dismiss(animated: true, completion: nil)
//
//            }
//        }
//
//
//    }
//
//
//    func startAnimation(){
//
//        let animation = Animation.named("loading")
//        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height/5)
//
//        animationView.animation = animation
//        animationView.contentMode = .scaleAspectFit
//        animationView.loopMode = .loop
//        animationView.play()
//
//        view.addSubview(animationView)
//
//    }
//
//    func stopAnimaiton(){
//
//        animationView.removeFromSuperview()
//
//    }
//
//
//
//}
