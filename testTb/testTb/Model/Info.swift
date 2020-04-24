//
//  Info.swift
//  testTb
//
//  Created by Jz D on 2020/4/24.
//  Copyright © 2020 Jz D. All rights reserved.
//

import UIKit



struct MineData{
    
    let look : String
    let name : String
    let willHide: Bool

}
  


struct PersonalData{
    
    static let info = PersonalData()
    
    let items: [MineData]
    let finalIdx: Int
    
    let cellH: CGFloat = 66
    let headH: CGFloat = 60
    
    init(){
        let sources: [(look : String, name : String, willHide: Bool)] = [("on_us", "关于我们", true),
                                                                         ("my_use_guide", "使用指南", true),
                                                                         ("my_feed_back", "意见反馈", false),
                                                                         ("my_settings", "设置" , true)]
        
        
        items = sources.map { (look, name, willHide) -> MineData in
                    return MineData(look: look, name: name, willHide: willHide)
                }
        
        
        finalIdx = sources.count - 1
        
    }
    
    
}
