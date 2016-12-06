//
//  CycleCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import Kingfisher
class CycleCell: UICollectionViewCell {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    
    var model : CycleModel? {
        didSet{
            guard let  model = model else {return}
            title.text = model.title
            let url = URL(string: model.pic_url)
            icon.kf.setImage(with: url)
        }
    }

    



}
