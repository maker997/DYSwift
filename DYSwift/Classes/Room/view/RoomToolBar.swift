//
//  RoomToolBar.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/29.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
protocol LivingCellDelegate: NSObjectProtocol {
    func closeLivingRoom()
}

class RoomToolBar: UIView {
    weak var delegate: LivingCellDelegate?
    
    @IBAction func closeClick(_ sender: UIButton) {
        //通知控制器,消失控制器
        delegate?.closeLivingRoom()
    }
    
    @IBAction func messageClick(_ sender: UIButton) {
        mprint(message: "messageClick")
    }
    @IBAction func shareClick(_ sender: UIButton) {
        mprint(message: "shareClick")
    }
    
    @IBAction func giftClick(_ sender: UIButton) {
        mprint(message: "giftClick")
    }
    @IBAction func contactClick(_ sender: UIButton) {
        mprint(message: "contactClick")
    }
    
   class func getToolView() -> RoomToolBar {
    
    return Bundle.main.loadNibNamed("RoomToolBar", owner: nil, options: [:])?.first as! RoomToolBar
    }
    

}
