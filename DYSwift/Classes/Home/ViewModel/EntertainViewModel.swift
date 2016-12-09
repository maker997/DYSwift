//
//  EntertainViewModel.swift
//  DYSwift
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class EntertainViewModel : BaseViewModel{

}

extension EntertainViewModel {
    //1.加载娱乐数据
    func loadEntertainData(finishs: @escaping () -> ()) {
         loadAnchorGroupData(isGroup: true,url: "http://capi.douyucdn.cn/api/v1/getHotRoom/2",finish: finishs)
        
    }
}







