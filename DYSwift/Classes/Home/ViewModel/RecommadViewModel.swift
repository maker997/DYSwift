//
//  RecommadViewModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/3.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class RecommadViewModel: NSObject {
    var anchorGroups : [AnchorGroup] = [AnchorGroup]()
    
    
    func getData() {
        //1.请求推荐的数据
        
        //2.请求颜值的数据
        
        //3.请求后面的数据http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1480748073
        let params = ["limit":"4","offset":"0","time":NSDate.getNowTime()]

        NetworkTool.shareInstance.reqest(method: .GET, url: "http://capi.douyucdn.cn/api/v1/getHotCate", params: params, finished: {response,error in
            
            guard let response = response else{
                return
            }
            
            guard  let data = response["data"] as? [[String:Any]] else{ return }
            
            for dict in data {
               let anchorGroup = AnchorGroup(dict: dict)
                self.anchorGroups.append(anchorGroup)
                mprint(message: "--------")
                for anchor in anchorGroup.AnchorGroups{
                    mprint(message: anchor.nickname)
                }
            }
            
        })
    }

}



















