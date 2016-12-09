//
//  FunnyViewModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/9.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class FunnyViewModel: BaseViewModel {

}

extension FunnyViewModel {
    
    func loadFunnyData(finish: @escaping () -> ()) {
        
        loadAnchorGroupData(isGroup: false,url:"http://capi.douyucdn.cn/api/v1/getColumnRoom/3",params:["limit":30,"offset":0],finish: finish)
    }
}
