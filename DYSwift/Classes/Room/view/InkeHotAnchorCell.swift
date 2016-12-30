//
//  InkeHotAnchorCell.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/28.
//  Copyright © 2016年 maker. All rights reserved.
//
/*
 
 cell 的高度计算
 cell 的高度最后的取值 = bottomLine 的底部 y
 所以必须根据内容设置好 bottomLine 的约束.
 给 底部线设置两个 top 约束.约束一: 距离内容标签为 0
                         约束二: 距离内容标签上的图的高度设置为标签高度
 根据内容设置 top 约束二
 
 */
import UIKit
import Kingfisher



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
        let url = URL(string: model.creatorModel.portrait)
        headerView.kf.setImage(with: url)
        nameLbl.text = model.creatorModel.nick
        cityLbl.text = model.city
        onlineLbl.text = "\(model.online_users)人"
        bigImage.kf.setImage(with: url)
        descriptLbl.text = model.name
        
        if model.rowHeight == 0.0 {
            layoutIfNeeded()
            model.rowHeight = bottomLine.frame.maxY
        }
        
    }
}






