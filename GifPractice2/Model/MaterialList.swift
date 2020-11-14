//
//  TestMaterialList.swift
//  GifPractice2
//
//  Created by 下川勇輝 on 2020/05/19.
//  Copyright © 2020 Yuki Shimokawa. All rights reserved.
//

import Foundation

class MaterialList{
    
    //英単語を格納する
    
    var list = [MaterialModel]()
    var TOEIC600verbList = [MaterialModel]()
    var TOEIC600NounList = [MaterialModel]()
    var TOEIC600AdjectiveList = [MaterialModel]()
    var TOEIC600AdverbList = [MaterialModel]()
    var TOEIC600OthersList = [MaterialModel]()
    
    var TOEIC600AdverbOthersList = [MaterialModel]()
    
    init(){
        
        //correctOrNotについて。正解はすべてtrueであることを前提に作っているのでこの配列では全てtrueでOK
        

        
        
        
        //TOEIC600VerbList
        TOEIC600verbList.append(MaterialModel(wordsName: "operate", japanWordsName: "操作する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "ship", japanWordsName: "出荷する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "explore", japanWordsName: "探検する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "expect", japanWordsName: "期待する、予想する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "determine", japanWordsName: "決定する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "gain", japanWordsName: "得る", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "launch", japanWordsName: "（事業などを）立ち上げる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "seek", japanWordsName: "追い求める", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "increase", japanWordsName: "増加する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "accept", japanWordsName: "受け入れる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "agree", japanWordsName: "同意する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "locate", japanWordsName: "位置する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "expand",japanWordsName:"拡張する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "attend", japanWordsName: "出席する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "hesitate", japanWordsName: "ためらう", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "repair", japanWordsName: "修理する", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "purchase", japanWordsName: "購入する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "submit", japanWordsName: "提出する", correctOrNot: true))
        //         TOEIC600verbList.append(MaterialModel(wordsName: "organize", japanWordsName: "整理する、編成する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "replace", japanWordsName: "取り換える", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "distribute", japanWordsName: "分配する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "attach", japanWordsName: "くっ付ける", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "avoid", japanWordsName: "避ける", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "approve", japanWordsName: "賛成する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "enclose", japanWordsName: "同封する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "participate in", japanWordsName: "〜に参加する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "reduce", japanWordsName: "減らす", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "improve", japanWordsName: "改善する", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "vote", japanWordsName: "投票する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "proceed", japanWordsName: "前に進む", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "achieve", japanWordsName: "成し遂げる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "remove", japanWordsName: "除去する", correctOrNot: true))
        //        TOEIC600verbList.append(MaterialModel(wordsName: "eliminate", japanWordsName: "取り除く", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "release", japanWordsName: "公開する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "confirm", japanWordsName: "確認する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "emphasize", japanWordsName: "強調する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "raise", japanWordsName: "上げる、育てる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "renew", japanWordsName: "更新する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "hire", japanWordsName: "雇う", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "include", japanWordsName: "含む", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "convey", japanWordsName: "伝える", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "analyse", japanWordsName: "分析する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "mail", japanWordsName: "郵送する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "offer", japanWordsName: "提供する", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "consider", japanWordsName: "よく考える", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "state", japanWordsName: "述べる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "provide", japanWordsName: "提供する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "enhance", japanWordsName: "（能力などを）高める", correctOrNot: true))
        
        
        
        TOEIC600verbList.append(MaterialModel(wordsName: "register", japanWordsName: "登録する", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "affect", japanWordsName: "影響を与える", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "fund", japanWordsName: "資金を集める", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "recognize", japanWordsName: "認識する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "separate", japanWordsName: "分ける", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "earn", japanWordsName: "稼ぐ", correctOrNot: true))
        
        
        TOEIC600verbList.append(MaterialModel(wordsName: "charge", japanWordsName: "請求する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "conduct", japanWordsName: "行う", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "confirm", japanWordsName: "確認する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "consult", japanWordsName: "相談する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "note", japanWordsName: "注目する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "appear", japanWordsName: "現れる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "create", japanWordsName: "創り出す", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "require", japanWordsName: "要求する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "attract", japanWordsName: "引き寄せる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "assure", japanWordsName: "保証する、安心させる", correctOrNot: true))
        
        //        TOEIC600verbList.append(MaterialModel(wordsName: "obtain", japanWordsName: "得る", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "establish", japanWordsName: "設立する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "delay", japanWordsName: "遅らせる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "demand", japanWordsName: "要求する", correctOrNot: true))
        //        TOEIC600verbList.append(MaterialModel(wordsName: "announce", japanWordsName: "発表する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "inquire", japanWordsName: "質問する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "develop", japanWordsName: "発展させる、開発する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "fit", japanWordsName: "（ぴったりと）合う", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "prove", japanWordsName: "証明する、だと分かる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "reserve", japanWordsName: "予約する", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "inform", japanWordsName: "知らせる", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "occur", japanWordsName: "起こる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "repair", japanWordsName: "修理する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "remind", japanWordsName: "思い出させる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "impress", japanWordsName: "感動させる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "finalize", japanWordsName: "完成させる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "broadcast", japanWordsName: "放送する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "appoint", japanWordsName: "任命する、約束する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "resolve", japanWordsName: "解決する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "calculate", japanWordsName: "計算する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "display", japanWordsName: "展示する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "publish", japanWordsName: "出版する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "complain", japanWordsName: "不満をいう", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "direct", japanWordsName: "指導する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "contain", japanWordsName: "含む", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "compete", japanWordsName: "競争する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "cause", japanWordsName: "引き起こす", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "arrange", japanWordsName: "準備する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "introduce", japanWordsName: "導入する、紹介する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "found", japanWordsName: "設立する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "deserve", japanWordsName: "価値がある", correctOrNot: true))
        //        TOEIC600verbList.append(MaterialModel(wordsName: "stress", japanWordsName: "強調する", correctOrNot: true))
        
        TOEIC600verbList.append(MaterialModel(wordsName: "maintain", japanWordsName: "維持する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "represent", japanWordsName: "代表する、表す", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "postpone", japanWordsName: "延期する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "recommend", japanWordsName: "勧める", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "mention", japanWordsName: "述べる", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "reschedule", japanWordsName: "（日程を）再調整する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "praise", japanWordsName: "褒める", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "preserve", japanWordsName: "保存する、保護する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "advise", japanWordsName: "アドバイスする", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "appreciate", japanWordsName: "感謝する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "regret", japanWordsName: "後悔する、残念に思う", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "retire", japanWordsName: "退職する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "apologize", japanWordsName: "謝罪する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "guarantee", japanWordsName: "（品質などを）保証する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "regard A as B", japanWordsName: "AをBとみなす", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "share A with B", japanWordsName: "AをBと共有する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "allow A to V", japanWordsName: "人が〜するのを許す", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "divide into A", japanWordsName: "A(個）に分割する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "prefer A to B", japanWordsName: "BよりAを好む", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "imply", japanWordsName: "暗に意味する", correctOrNot: true))
        TOEIC600verbList.append(MaterialModel(wordsName: "can afford to V", japanWordsName: "〜する余裕がある", correctOrNot: true))
        
        
        
        
        
        
        
        
        
        
        //TOEIC600NounList
        
        TOEIC600NounList.append(MaterialModel(wordsName: "resume", japanWordsName: "履歴書", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "memorandom", japanWordsName: "メモ", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "destination", japanWordsName: "目的地", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "complex", japanWordsName: "(ショッピングモールなど)複合施設", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "equipment", japanWordsName: "設備", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "advertisement", japanWordsName: "広告", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "deadline", japanWordsName: "締切", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "resident", japanWordsName: "住人", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "departure", japanWordsName: "出発", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "preparation", japanWordsName: "(プレゼンなどの)準備", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "option", japanWordsName: "選択肢", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "vehicle", japanWordsName: "乗り物", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "detail", japanWordsName: "詳細", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "council", japanWordsName: "会議、議会", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "organization", japanWordsName: "組織", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "fee", japanWordsName: "料金", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "survey", japanWordsName: "調査", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "packaging", japanWordsName: "梱包", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "delivery", japanWordsName: "配達", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "branch", japanWordsName: "枝、支店", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "brochure", japanWordsName: "パンフレット冊子", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "flyer", japanWordsName: "チラシ", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "crop", japanWordsName: "作物", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "fuel", japanWordsName: "燃料", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "landscaping", japanWordsName: "造園", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "component", japanWordsName: "部品", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "income", japanWordsName: "収入", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "regulation", japanWordsName: "ルール、制約", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "exhibition", japanWordsName: "展示", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "warehouse", japanWordsName: "倉庫", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "district", japanWordsName: "地区", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "duty", japanWordsName: "義務", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "occasion", japanWordsName: "機会", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "opportunity", japanWordsName: "機会", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "function", japanWordsName: "機能", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "institution", japanWordsName: "機関", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "equipment", japanWordsName: "機器、設備", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "conference", japanWordsName: "会議", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "firm", japanWordsName: "会社", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "job opening", japanWordsName: "仕事の空き(役職の空席）", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "management", japanWordsName: "管理、経営", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "candidate", japanWordsName: "候補者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "executive", japanWordsName: "(企業の)重役", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "personnel", japanWordsName: "人事、職員", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "basis", japanWordsName: "基準", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "crew", japanWordsName: "（職場での）チーム", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "atmosphere", japanWordsName: "雰囲気", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "reference", japanWordsName: "前職での実績（転職面接時に確認）", correctOrNot: true))
        //        TOEIC600NounList.append(MaterialModel(wordsName: "resume", japanWordsName: "履歴書", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "department", japanWordsName: "(部署など)部門", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "client", japanWordsName: "顧客、お客様", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "employee", japanWordsName: "従業員", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "stock-holder", japanWordsName: "株主", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "headquarters", japanWordsName: "本社", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "cafeteria", japanWordsName: "社員食堂", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "promotion", japanWordsName: "昇進", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "suggestion", japanWordsName: "提案", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "policy", japanWordsName: "方針", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "expense", japanWordsName: "費用", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "membership", japanWordsName: "会員（サブスクなど）", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "estimate", japanWordsName: "見積もり", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "balance", japanWordsName: "（請求書の）未払い額", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "contract", japanWordsName: "契約", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "payment", japanWordsName: "支払い", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "path", japanWordsName: "小道", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "budget", japanWordsName: "予算", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "quarter", japanWordsName: "四半期(3ヶ月間)", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "bill", japanWordsName: "請求書", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "document", japanWordsName: "書類", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "ability", japanWordsName: "能力", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "reward", japanWordsName: "報酬", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "profit", japanWordsName: "利益", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "benefit", japanWordsName: "福利厚生", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "proposal", japanWordsName: "提案", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "popularity", japanWordsName: "人気", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "labour", japanWordsName: "労働", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "capacity", japanWordsName: "収容能力(部屋など)", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "concern", japanWordsName: "心配", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "background", japanWordsName: "背景", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "research", japanWordsName: "調査", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "recommendation", japanWordsName: "推薦", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "invitation", japanWordsName: "招待", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "reputation", japanWordsName: "評判", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "applicant", japanWordsName: "志願者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "application", japanWordsName: "応募用紙", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "process", japanWordsName: "過程", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "region", japanWordsName: "地域", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "method", japanWordsName: "方法", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "transportation", japanWordsName: "交通手段", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "shuttle", japanWordsName: "（バスなど）送迎便", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "arrival", japanWordsName: "到着", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "result", japanWordsName: "結果", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "agreement", japanWordsName: "同意", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "tips", japanWordsName: "コツ", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "saving", japanWordsName: "節約", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "display", japanWordsName: "展示", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "exhibit", japanWordsName: "展示", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "instruction", japanWordsName: "指示", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "industory", japanWordsName: "産業", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "production", japanWordsName: "生産、製造", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "manufacture", japanWordsName: "メーカー、製造者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "agency", japanWordsName: "（広告や旅行の）代理店", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "editor", japanWordsName: "編集者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "host", japanWordsName: "主催者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "author", japanWordsName: "著者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "mayor", japanWordsName: "市長", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "decade", japanWordsName: "10年", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "anniversary", japanWordsName: "記念日", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "celebration", japanWordsName: "祝賀、祝うこと", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "trade", japanWordsName: "商売", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "profit", japanWordsName: "利益", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "automobile", japanWordsName: "自動車", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "merchandise", japanWordsName: "商品", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "facility", japanWordsName: "施設", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "construction", japanWordsName: "建設", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "clothing", japanWordsName: "衣服", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "award", japanWordsName: "賞", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "representative", japanWordsName: "代表者", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "individual", japanWordsName: "個人", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "environment", japanWordsName: "環境", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "neighborhood", japanWordsName: "近所", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "reputation", japanWordsName: "評判", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "complaint", japanWordsName: "不満", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "strength", japanWordsName: "強さ", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "contrast", japanWordsName: "対比", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "cooperation", japanWordsName: "協力", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "claim", japanWordsName: "主張", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "response", japanWordsName: "反応", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "warranty", japanWordsName: "保証書", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "insurance premium", japanWordsName: "保険料", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "deposit", japanWordsName: "保証金", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "donation", japanWordsName: "寄付", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "refund", japanWordsName: "返金", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "priority", japanWordsName: "優先", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "luggage", japanWordsName: "手荷物", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "procedure", japanWordsName: "手続き", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "permission", japanWordsName: "許可", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "proof", japanWordsName: "証拠", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "factor", japanWordsName: "要因", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "connection", japanWordsName: "接続", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "comparison", japanWordsName: "比較", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "findings", japanWordsName: "発見", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "impact", japanWordsName: "影響", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "content", japanWordsName: "中身", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "aspect", japanWordsName: "側面", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "figure", japanWordsName: "グラフ、図", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "range", japanWordsName: "範囲", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "import", japanWordsName: "輸入", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "resource", japanWordsName: "資源", correctOrNot: true))
        TOEIC600NounList.append(MaterialModel(wordsName: "discount", japanWordsName: "割引", correctOrNot: true))
        
        TOEIC600NounList.append(MaterialModel(wordsName: "admission", japanWordsName: "入場", correctOrNot: true))
        
        
        
        
        
        
        //TOEIC600AdjectiveList
        
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "unique", japanWordsName: "独特な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "local", japanWordsName: "地方の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "various", japanWordsName: "様々な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "crowded", japanWordsName: "混雑した", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "advance", japanWordsName: "進歩した", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "sufficient", japanWordsName: "十分な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "accurate", japanWordsName: "正確な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "economic", japanWordsName: "経済の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "ideal", japanWordsName: "理想的な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "commercial", japanWordsName: "商業の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "generous", japanWordsName: "気前の良い", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "helpful", japanWordsName: "助けとなる", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "latest", japanWordsName: "最新の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "experienced", japanWordsName: "経験豊富な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "overall", japanWordsName: "全体的に", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "specific", japanWordsName: "特定の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "related", japanWordsName: "関連のある", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "significant", japanWordsName: "重要な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "informal", japanWordsName: "非公式の、カジュアルな", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "complicated", japanWordsName: "複雑な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "corporate", japanWordsName: "会社の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "mechanical", japanWordsName: "機械の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "overseas", japanWordsName: "海外の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "former", japanWordsName: "（2つを比べて）前者の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "practical", japanWordsName: "実用的な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "valuable", japanWordsName: "価値のある", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "limited", japanWordsName: "限られた", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "paid", japanWordsName: "支払い済みの", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "comfortable", japanWordsName: "快適な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "familiar", japanWordsName: "慣れ親しんだ", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "modern", japanWordsName: "現代の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "exact", japanWordsName: "正確な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "initial", japanWordsName: "最初の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "involved", japanWordsName: "関係のある", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "legal", japanWordsName: "合法な", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "available", japanWordsName: "利用できる", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "agricultural", japanWordsName: "農業の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "upcoming", japanWordsName: "今度の、次の", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "temporary", japanWordsName: "一時的な(交通規制など)", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "successful", japanWordsName: "成功した", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "existing", japanWordsName: "既にある", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "favorable", japanWordsName: "好ましい", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "promising", japanWordsName: "将来有望な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "amazing", japanWordsName: "素晴らしい", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "correct", japanWordsName: "正しい", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "confident", japanWordsName: "自信のある", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "previous", japanWordsName: "以前の", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "financial", japanWordsName: "お金に関する", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "traditional", japanWordsName: "伝統的な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "intended", japanWordsName: "意図した", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "downtown", japanWordsName: "中心都市", correctOrNot: true))
        
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "full-time", japanWordsName: "常勤の（part-timeの反対）", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "permanent", japanWordsName: "永続的な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "alternative", japanWordsName: "代わりの", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "effective", japanWordsName: "効果的な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "necessary", japanWordsName: "必要な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "leading", japanWordsName: "先導する", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "available", japanWordsName: "利用できる", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "reasonable", japanWordsName: "理にかなった", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "suitable", japanWordsName: "適した", correctOrNot: true))
        
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "brief", japanWordsName: "簡潔な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "serious", japanWordsName: "深刻な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "efficient", japanWordsName: "効率的な", correctOrNot: true))
        TOEIC600AdjectiveList.append(MaterialModel(wordsName: "annual", japanWordsName: "毎年の", correctOrNot: true))
        
        
        
        
        
        
        
        //TOEIC600AdverbList
        TOEIC600AdverbList.append(MaterialModel(wordsName: "slightly", japanWordsName: "わずかに", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "rather", japanWordsName: "かなり", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "properly", japanWordsName: "適切に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "anyway", japanWordsName: "とにかく", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "frequently", japanWordsName: "頻繁に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "likely", japanWordsName: "する可能性が高い", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "absolutely", japanWordsName: "絶対に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "nearly", japanWordsName: "ほぼ", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "highly", japanWordsName: "とても", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "currently", japanWordsName: "現在", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "immediately", japanWordsName: "すぐに", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "equally", japanWordsName: "同じように", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "particularly", japanWordsName: "特に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "occasionally", japanWordsName: "時々", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "shortly", japanWordsName: "すぐに、じきに", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "fairly", japanWordsName: "かなり", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "alike", japanWordsName: "同様に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "relatively", japanWordsName: "比較的", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "regularly", japanWordsName: "定期的に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "unfortunately", japanWordsName: "不幸なことに", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "recently", japanWordsName: "最近（過去形、現在完了と使う）", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "almost", japanWordsName: "ほぼ", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "unlike", japanWordsName: "とは違って", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "perhaps", japanWordsName: "ひょっとしたら", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "eventually", japanWordsName: "最終的に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "hardly", japanWordsName: "ほとんどない", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "gradually", japanWordsName: "だんだんと、段階的に", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "somewhat", japanWordsName: "多少", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "afterwards", japanWordsName: "後で", correctOrNot: true))
        TOEIC600AdverbList.append(MaterialModel(wordsName: "approximately", japanWordsName: "およそ", correctOrNot: true))
        
        
        //30子以上入れる！！
        
        
        
        //TOEIC600OthersList
        TOEIC600OthersList.append(MaterialModel(wordsName: "be willing to V", japanWordsName: "進んで〜する", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "following A", japanWordsName: "Aの後で", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "guided tour", japanWordsName: "ガイド付きツアー", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "with ease", japanWordsName: "簡単に", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "loyal customer", japanWordsName: "忠実な客（常連客）", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be pleased with A", japanWordsName: "Aに対し嬉しい", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "according to", japanWordsName: "〜によると", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be eager to V", japanWordsName: "〜したい", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "in a different setting", japanWordsName: "違った環境では", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be aware of A", japanWordsName: "Aに気付いている", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be responsible of A", japanWordsName: "Aに責任をもつ", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be committed to A", japanWordsName: "献身的に取り組む", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be satisfied with A", japanWordsName: "Aに満足している", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "regarding A", japanWordsName: "Aに関して", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "be unable to V", japanWordsName: "〜できない", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "neither A nor B", japanWordsName: "AもBも違う", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "without A", japanWordsName: "Aなしで", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "in spite of A", japanWordsName: "Aにも関わらず", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "unlike", japanWordsName: "と違って", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "besides", japanWordsName: "に加えて", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "each 単数名詞", japanWordsName: "それぞれの", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "both A and B", japanWordsName: "AとB両方", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "hence", japanWordsName: "だから", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "seldom", japanWordsName: "滅多にない", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "latter", japanWordsName: "(二つのうち）後者", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "behind the wheel", japanWordsName: "運転する", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "every other week", japanWordsName: "1週間おきに", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "on board", japanWordsName: "（飛行）機内で", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "in cash", japanWordsName: "現金で", correctOrNot: true))
        TOEIC600OthersList.append(MaterialModel(wordsName: "due to A", japanWordsName: "Aが理由で", correctOrNot: true))
        
        
        //30子以上入れる！
        
        //AdverbとOthersの新リスト
        
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "slightly", japanWordsName: "わずかに", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "rather", japanWordsName: "かなり", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "properly", japanWordsName: "適切に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "anyway", japanWordsName: "とにかく", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "frequently", japanWordsName: "頻繁に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "likely", japanWordsName: "する可能性が高い", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "absolutely", japanWordsName: "絶対に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "nearly", japanWordsName: "ほぼ", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "highly", japanWordsName: "とても", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "currently", japanWordsName: "現在", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "immediately", japanWordsName: "すぐに", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "equally", japanWordsName: "同じように", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "particularly", japanWordsName: "特に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "occasionally", japanWordsName: "時々", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "shortly", japanWordsName: "すぐに、じきに", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "fairly", japanWordsName: "かなり", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "alike", japanWordsName: "同様に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "relatively", japanWordsName: "比較的", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "regularly", japanWordsName: "定期的に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "unfortunately", japanWordsName: "不幸なことに", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "recently", japanWordsName: "最近（過去形、現在完了と使う）", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "almost", japanWordsName: "ほぼ", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "unlike", japanWordsName: "とは違って", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "perhaps", japanWordsName: "ひょっとしたら", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "eventually", japanWordsName: "最終的に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "hardly", japanWordsName: "ほとんどない", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "gradually", japanWordsName: "だんだんと、段階的に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "somewhat", japanWordsName: "多少", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "afterwards", japanWordsName: "後で", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "approximately", japanWordsName: "およそ", correctOrNot: true))
        
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be willing to V", japanWordsName: "進んで〜する", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "following A", japanWordsName: "Aの後で", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "guided tour", japanWordsName: "ガイド付きツアー", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "with ease", japanWordsName: "簡単に", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "loyal customer", japanWordsName: "忠実な客（常連客）", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be pleased with A", japanWordsName: "Aに対し嬉しい", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "according to", japanWordsName: "〜によると", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be eager to V", japanWordsName: "〜したい", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "in a different setting", japanWordsName: "違った環境では", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be aware of A", japanWordsName: "Aに気付いている", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be responsible of A", japanWordsName: "Aに責任をもつ", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be committed to A", japanWordsName: "献身的に取り組む", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be satisfied with A", japanWordsName: "Aに満足している", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "regarding A", japanWordsName: "Aに関して", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "be unable to V", japanWordsName: "〜できない", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "neither A nor B", japanWordsName: "AもBも違う", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "without A", japanWordsName: "Aなしで", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "in spite of A", japanWordsName: "Aにも関わらず", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "unlike", japanWordsName: "と違って", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "besides", japanWordsName: "に加えて", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "each 単数名詞", japanWordsName: "それぞれの", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "both A and B", japanWordsName: "AとB両方", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "hence", japanWordsName: "だから", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "seldom", japanWordsName: "滅多にない", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "latter", japanWordsName: "(二つのうち）後者", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "behind the wheel", japanWordsName: "運転する", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "every other week", japanWordsName: "1週間おきに", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "on board", japanWordsName: "（飛行）機内で", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "in cash", japanWordsName: "現金で", correctOrNot: true))
        TOEIC600AdverbOthersList.append(MaterialModel(wordsName: "due to A", japanWordsName: "Aが理由で", correctOrNot: true))
        
        
        
        
        
        
        
    }
    
    
}
