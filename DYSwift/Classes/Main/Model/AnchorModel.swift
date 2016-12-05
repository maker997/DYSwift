//
//  AnchorModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/3.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {
    var room_src : String?      //主播的缩略图
    var game_name : String?     //
    var nickname : String?      //主播昵称
    var room_name : String?     //房间名称
    var room_id : Int = 0       //房间 id
    var online : Int = 0        //在线人数
    var anchor_city : String?   //主播所在的城市
    
    
    init(dict : [String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
