//
//  NSDate-Extension.swift
//  DYSwift
//
//  Created by maker on 2016/12/3.
//  Copyright © 2016年 maker. All rights reserved.
//

import Foundation

extension NSDate {
   class func getNowTime() -> String {
    let nowDate = NSDate()
    
    let interval = Int(nowDate.timeIntervalSince1970)

    return "\(interval)"
    }
}
