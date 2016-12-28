//
//  InkeHotAnchorCell.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/28.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import Kingfisher

let inkeHotAnchorCell = "InkeHotAnchorCell"

class InkeHotAnchorCell: UITableViewCell {
    var anchorModel : Live?  {
        didSet{
            guard let model = anchorModel else { return }

            setData(model: model)
        }
    }
    
    
    @IBOutlet weak var headerView: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var onlineLbl: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var descriptLbl: UILabel!

    @IBOutlet weak var bottomLine: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

extension InkeHotAnchorCell{
    
    //设置数据
    fileprivate func setData(model: Live) {
        let url = URL(string: model.creator.portrait)
        headerView.kf.setImage(with: url)
        nameLbl.text = model.creator.nick
        cityLbl.text = model.city
        onlineLbl.text = "\(model.onlineUsers!)人"
        bigImage.kf.setImage(with: url)
        descriptLbl.text = model.name
        
        
        if model.rowHeight == 0.0 {
            layoutIfNeeded()
            model.rowHeight = bottomLine.frame.maxY
        }
        
    }
}






