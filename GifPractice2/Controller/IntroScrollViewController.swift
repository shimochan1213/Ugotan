//
//  IntroViewController.swift
//  NewsApp1
//
//  Created by 下川勇輝 on 2020/06/23.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit
import Lottie

class IntroScrollViewController: UIViewController, UIScrollViewDelegate{

 
    @IBOutlet weak var scrollView: UIScrollView!
    
    //jsonファイルを入れる
    var onboardArray = ["summer","fall","dancing","dog","cat"]
    //説明
    var onboardStringArray = ["あ","い","う","え","お"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ページングが可能になる(横にスクロール）
        scrollView.isPagingEnabled = true
        setupScroll()
        
        for i in 0...4{
            
            let animationView = AnimationView()
            let animation = Animation.named(onboardArray[i])
            animationView.frame = CGRect(x: CGFloat((i)) * view.frame.size.width , y: 0, width: view.frame.size.width/3, height: view.frame.size.height/3 )
            animationView.animation = animation
            animationView.contentMode = .scaleAspectFit
            animationView.loopMode = .loop
            animationView.play()
            //スクロールビューに追加
            scrollView.addSubview(animationView)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func setupScroll(){
        
        scrollView.delegate = self
//        スクロールビューの稼働領域 5このアニメーション流すから幅5倍
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height)
        
        
        for i in 0...4{
//            let onboardLabel = UILabel(frame: CGRect(x: CGFloat((i)) * view.frame.size.width, y: view.frame.size.height/3, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            let onboardLabel = UILabel(frame: CGRect(x: CGFloat((i)) * view.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.size.height))
            
            onboardLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
            onboardLabel.textAlignment = .center
            onboardLabel.text = onboardStringArray[i]
            scrollView.addSubview(onboardLabel)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
