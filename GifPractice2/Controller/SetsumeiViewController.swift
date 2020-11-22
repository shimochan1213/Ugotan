//
//  SetsumeiViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/08/11.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit

//「英単語を覚えるコツ」のコントローラ

class SetsumeiViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.isEditable = false
        textView.isSelectable = false
        
    }
    
    @IBAction func backToModeSelect(_ sender: Any) {
//        self.navigationController?.popToRootViewController(animated: true)
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
