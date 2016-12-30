//
//  InkeHotViewModel.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/28.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class InkeHotViewModel {
    var InkeAnchors: [Live] = [Live]()
    
    
}

//MARK: ====== 请求数据 ======
extension InkeHotViewModel{
    func loadInkeAnchors(url: String,finished: @escaping () -> ()) {
        NetworkTool.shareInstance.reqest(method: .GET, url: url) { (result, error) in
            if error != nil{
                mprint(message: error)
                return
            }
            guard let result = result else{
                return
            }
            guard let lives = (result["lives"] as? [[String:Any]]) else { return }
            
            for dict in lives {
                let live = Live(fromDictionary: dict)
                self.InkeAnchors.append(live)
            }
            
            finished()
        }
    }
}
