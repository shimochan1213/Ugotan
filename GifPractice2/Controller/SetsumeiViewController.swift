//
//  SetsumeiViewController.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/08/11.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import UIKit

class SetsumeiViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backToModeSelect(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
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
