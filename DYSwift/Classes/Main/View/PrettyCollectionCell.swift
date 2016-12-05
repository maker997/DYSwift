//
//  PrettyCollectionCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class PrettyCollectionCell: collectionBaseCell {

    @IBOutlet weak var cityLbl: UILabel!

    override var anchor: AnchorModel? {
        didSet{
            super.anchor = anchor
            cityLbl.text = anchor?.anchor_city
        }
    }

}
