//
//  CycleModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class CycleModel: NSObject {
    var title : String = ""     //标题
    var pic_url : String = ""   //图片 URL
    var anchor : AnchorModel?   //主播
    var room : [String:Any]?{
        didSet{
            guard let room = room else {return}
            anchor = AnchorModel(dict: room)
        }
    }
    
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
        
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
    
}



















