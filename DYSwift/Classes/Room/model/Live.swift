//
//  Live1.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/29.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class Live: NSObject {
    var city : String!
    var creator :[String:Any]?{
        didSet{
            guard let creators = creator else {return}
            creatorModel = Creator(fromDictionary: creators)
        }
    }
    var name : String!
    var online_users : Int!
    var stream_addr : String!
    var creatorModel: Creator!
    
    var rowHeight: CGFloat = 0.0
    
    init(fromDictionary dictionary: [String:Any]) {
        super.init()
        setValuesForKeys(dictionary)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}












