//
//  TestMaterialModel.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/19.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import Foundation

class MaterialModel {
    
    
    //画像名を取得して、その画像名が人間かそうでないかをフラグによって判定するための機能
    
    
    let Words:String
    let japanWords:String
    let answer : Bool
    
    init(wordsName:String, japanWordsName:String, correctOrNot:Bool) {
        
        //外部から入ってきたimageName,correctOrNotをImageModelクラスのプロパティに入れてる
        
//        GifText = GifName
        
        Words = wordsName
        
        japanWords = japanWordsName
        
        answer = correctOrNot
       
    }
    
    
}
