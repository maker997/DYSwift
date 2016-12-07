//
//  AnchorGroup.swift
//  DYSwift
//
//  Created by maker on 2016/12/3.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class AnchorGroup: GameBaseModel {
    
    var AnchorGroups : [AnchorModel]  = [AnchorModel]()
    var groupIcon : String = ""         //本地小图
    
    //主播数组
    var room_list : [[String:Any]]?{
        didSet{
            guard let list = room_list else { return }
            for dict in list {
                let anchor = AnchorModel(dict: dict)
                AnchorGroups.append(anchor)
            }
        }
    }


    override init() {
        super.init()
    }
    
    override init(dict:[String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}









