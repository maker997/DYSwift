//
//  MenueCell.swift
//  DYSwift
//
//  Created by maker on 2016/12/8.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

private let menueItemCellId = "menueItemCellId"

class MenueCell: UICollectionViewCell {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var groups : [AnchorGroup]? {
        didSet{
            if groups == nil {
                return
            }
           collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: menueItemCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
        let menueItemWidth = (collectionView.widths()/4)
        let menueItemHeight = (collectionView.heights()/2)

        layout.itemSize = CGSize(width: menueItemWidth, height: menueItemHeight)
    }
}

//MARK:==========collectionView 代理==========
extension MenueCell : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groups == nil {
            return 0
        }
        return groups!.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menueItemCellId, for: indexPath) as! GameCell
        
        cell.gameModel = groups![indexPath.item]
        cell.clipsToBounds = true
        
        return cell
    }
}












