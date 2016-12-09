//
//  BaseViewModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class BaseViewModel{
    var anchorGroups : [AnchorGroup] = [AnchorGroup]()
}

extension BaseViewModel{
    func loadAnchorGroupData(isGroup:Bool, url:String,params:[String:Any]?=nil,finish: @escaping () -> ()) {
        
        NetworkTool.shareInstance.reqest(method: .GET, url: url,params: params,finished: { response ,error in
            
            guard let response = response else { return}
            guard let data = (response["data"] as? [[String:Any]]) else { return }
            
            if isGroup{
                for dict in data {
                    let groups = AnchorGroup(dict: dict)
                    groups.groupIcon = "home_header_normal"
                    if groups.AnchorGroups.count > 0 {
                        self.anchorGroups.append(groups)
                    }
                }
            }else{
                let group = AnchorGroup()
                for dict in data {
                    let anchor = AnchorModel(dict: dict)
                    group.AnchorGroups.append(anchor)
                }
                self.anchorGroups.append(group)
            }
            
            finish()
        })

    }
}



