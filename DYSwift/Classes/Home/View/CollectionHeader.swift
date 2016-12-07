//
//  CollectionHeader.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class CollectionHeader: UICollectionReusableView {

    @IBOutlet weak var headerIcon: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var headerMoreBtn: UIButton!
    
    var group : AnchorGroup? {
        didSet{
            guard let group = group else {
                return
            }
            
            headerTitle.text = group.tag_name
            headerIcon.image = UIImage(named: group.groupIcon)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
}

extension CollectionHeader {
    class func getCollectionHeader () -> CollectionHeader{
        return Bundle.main.loadNibNamed("CollectionHeader", owner: nil, options: nil)?.first as! CollectionHeader
    }
}








