
//
//  Common.swift
//  WBSwift
//
//  Created by maker on 2016/11/11.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

//MARK: ====== 尺寸 ======
let screenWidth = UIScreen.main.bounds.size.width
let screenHeight = UIScreen.main.bounds.size.height - 64
let margin : CGFloat = 15
let itemMargin :CGFloat = 10

//MARK: ====== 颜色 ======
//r g b (161,224,212)
let InkeGlobalColor : UIColor = UIColor(red:0.63, green:0.88, blue:0.83, alpha:1.00)

//MARK: ====== 映客接口 ======
//映客 URL
//"http://service.inke.com/api/live/aggregation?uid=47702860&interest=1";

/*
 有点像 banner
 http://service.inke.com/api/live/gettop?&uid=47702860
 */

/*
 热门列表
 "http://service.inke.com/api/live/simpleall?&uid=47702860"
 */

/*附近列表
 "http://service.inke.com/api/live/near_flow_old?uid=47702860&interest=0&longitude=117.077700&latitude=36.672928"
 */

/*
 banner
 "http://service.inke.com/api/live/infos?uid=47702860&id=1482812039111313%2C1482813779089704%2C1482813167367062%2C1482813150423926%2C1482815524386966&multiaddr=1&s_sg=ef26e690d5d39fa56920ad5ed68eea86"
 */

/*
 用户信息借口
 "http://service.inke.com/api/user/info?id=47702860"
 */











