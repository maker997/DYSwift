//
//  NormalCollectionCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import Kingfisher

class NormalCollectionCell: collectionBaseCell {


    @IBOutlet weak var roomName: UILabel!
    
    
   override var anchor : AnchorModel? {
        didSet{
            super.anchor = anchor
            
            //设置房间名称
            roomName.text = anchor?.room_name
            
        }
    }
    

}
