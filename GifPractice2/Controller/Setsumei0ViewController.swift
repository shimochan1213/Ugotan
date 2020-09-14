//
//  Setsumei0ViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/09/14.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit

class Setsumei0ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        textView.isEditable = false
        textView.isSelectable = false
        
        
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
