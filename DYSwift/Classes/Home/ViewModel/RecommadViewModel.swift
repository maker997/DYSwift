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
    var recommandGroup : AnchorGroup = AnchorGroup()
    var pretteyGroup : AnchorGroup = AnchorGroup()
    
    func getData(_ finished:@escaping () -> ()) {
         let params = ["limit":"4","offset":"0","time":NSDate.getNowTime()]
        let dispathG = DispatchGroup()
        
        //1.请求推荐的数据
        dispathG.enter()
        NetworkTool.shareInstance.reqest(method: .GET, url: "http://capi.douyucdn.cn/api/v1/getbigDataRoom", params: params, finished: {response,error in
            guard let response = response else{
                return
            }
            guard  let data = response["data"] as? [[String:Any]] else{ return }
            
            for dict in data {
                let model = AnchorModel(dict: dict)
                self.recommandGroup.AnchorGroups.append(model)
            }
            self.recommandGroup.groupIcon = "home_header_hot"
            self.recommandGroup.tag_name = "最热"
            dispathG.leave()

        })
        //2.请求颜值的数据
        dispathG.enter()
        NetworkTool.shareInstance.reqest(method: .GET, url: "http://capi.douyucdn.cn/api/v1/getVerticalRoom", params: params, finished: {response,error in
            guard let response = response else{
                return
            }
            guard  let data = response["data"] as? [[String:Any]] else{ return }
            
            for dict in data {
                let model = AnchorModel(dict: dict)
                self.pretteyGroup.AnchorGroups.append(model)
            }
            self.pretteyGroup.groupIcon = "home_header_phone"
            self.pretteyGroup.tag_name = "颜值"
            dispathG.leave()

        })
        
        //3.请求后面的数据http://capi.douyucdn.cn/api/v1/getHotCate?limit=4&offset=0&time=1480748073
        dispathG.enter()
        
        NetworkTool.shareInstance.reqest(method: .GET, url: "http://capi.douyucdn.cn/api/v1/getHotCate", params: params, finished: {response,error in
            
            guard let response = response else{
                return
            }
            
            guard  let data = response["data"] as? [[String:Any]] else{ return }
            
            for dict in data
            {
               let anchorGroup = AnchorGroup(dict: dict)
                anchorGroup.groupIcon = "home_header_normal"
                if anchorGroup.AnchorGroups.count > 0 {
                    self.anchorGroups.append(anchorGroup)
                }

            }
            dispathG.leave()

        })
        
        dispathG.notify(queue: DispatchQueue.main, execute: {
            
             self.anchorGroups.insert(self.pretteyGroup, at: 0)
            self.anchorGroups.insert(self.recommandGroup, at: 0)
           
            finished()
        })
        
    }

}



















