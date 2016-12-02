//
//  NormalCollectionCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class NormalCollectionCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.layer.cornerRadius = 4
//        contentView.layer.masksToBounds
    }

}
