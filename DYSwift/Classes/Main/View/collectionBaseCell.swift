//
//  collectionBaseCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/5.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class collectionBaseCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var anchorName: UILabel!
    @IBOutlet weak var onlineBtn: UIButton!


    
    var anchor : AnchorModel? {
        didSet{
            guard let anchor = anchor else {
                return
            }
            
            //设置图片
            if let room_src = anchor.room_src {
                
                guard let url = URL(string: room_src) else {
                    return
                }
                icon.kf.setImage(with:url)
            }
            
            //设置主播的名字
            anchorName.text = anchor.nickname
            
            //设置在线人数
            var onlineStr = ""
            if anchor.online > 10000 {
                onlineStr = "\(Int(anchor.online/10000)) 万人在线"
            }else{
                onlineStr = "\(anchor.online)人在线"
                
            }
            onlineBtn.setTitle(onlineStr, for: .normal)
            
        }
    }

    
}
