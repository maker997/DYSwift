//
//  GameBaseModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class GameBaseModel: NSObject {
    var tag_name : String = ""
    var icon_url : String = ""
    
    override init() {
        super.init()
    }
    
    
    init(dict : [String:Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
