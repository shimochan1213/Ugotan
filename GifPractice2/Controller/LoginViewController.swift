////
////  LoginViewController.swift
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
//class LoginViewController: UIViewController {
//    
//    let animationView = AnimationView()
//    
//    @IBOutlet weak var emailTextField: UITextField!
//    
//    @IBOutlet weak var passwordTextField: UITextField!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//    }
//    
//    @IBAction func loginButton(_ sender: Any) {
//        startAnimation()
//        
//        Auth.auth().signIn(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
//            
//            if error != nil{
//                print(error as Any)
//            }else{
//                
//                print("ログイン成功")
//                self.stopAnimaiton()
//               
//                //ナビゲーションコントロール下ならこれ
////                self.navigationController?.popViewController(animated: true)
//                
//                self.dismiss(animated: true, completion: nil)
//                
//            }
//        }
//        
//    }
//    
//    
//    
//    
//    func startAnimation(){
//        
//        let animation = Animation.named("loading")
//        animationView.frame = CGRect(x: view.frame.size.width/2, y: view.frame.size.height/2, width: view.frame.size.width/4, height: view.frame.size.height/4)
//        
//        animationView.animation = animation
//        
//        
////        animationView.contentMode = .scaleAspectFit
////        animationView.contentMode = .top
//        
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
