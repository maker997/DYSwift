//
//  GameCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import Kingfisher
class GameCell: UICollectionViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var groupNameLbl: UILabel!
    var gameModel  : GameBaseModel?{
        didSet{
            guard let gameModel = gameModel else {
                return
            }
            groupNameLbl.text = gameModel.tag_name
            let url  = URL(string: gameModel.icon_url)
            icon.kf.setImage(with: url, placeholder: UIImage(named: "home_more_btn"))
        }
    }
    


}







