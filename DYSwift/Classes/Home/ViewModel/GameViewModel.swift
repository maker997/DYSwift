//
//  GameViewModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class GameViewModel {
    var games : [GameModel] = [GameModel]() //游戏数据源
    
    
    func loadGameData(finish:  @escaping () -> ()) {
        
        NetworkTool.shareInstance.reqest(method: .GET, url: "http://capi.douyucdn.cn/api/v1/getColumnDetail", params: ["shortName" : "game"], finished: { result, error in
            
            // 1.获取到数据
            guard let result = result else { return}
            
            guard let dataArray = result["data"] as? [[String : Any]] else { return }
            
            // 2.字典转模型
            for dict in dataArray {
                self.games.append(GameModel(dict: dict))
            }
            
            // 3.完成回调
            finish()
        })
        
        
    }

}
