//
//  Creator1.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/29.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class Creator: NSObject {
    var nick : String!
    var portrait : String!
    
    init(fromDictionary dictionary: [String:Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
