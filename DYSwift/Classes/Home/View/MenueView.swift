//
//  MenueView.swift
//  DYSwift
//
//  Created by maker on 2016/12/8.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let menueBigCellId = "menueBigCellId"
class MenueView: UIView {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var collectionView: UICollectionView!
    var groups : [AnchorGroup]? {
        didSet{
            if groups == nil {
                return
            }
            collectionView.reloadData()
        }
    }
    
    
    //提供一个类方法来创建MenueView
    class func getMenueView () -> MenueView{
        
      return  Bundle.main.loadNibNamed("MenueView", owner: nil, options: nil)?.first as! MenueView
    }
    
    override func awakeFromNib() {
        
        collectionView.register(UINib(nibName: "MenueCell", bundle: nil), forCellWithReuseIdentifier: menueBigCellId)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: collectionView.widths(), height: collectionView.heights())
    }
    
}

//MARK:==========collectionView 代理==========
extension MenueView : UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if groups == nil {
            return 0
        }
        
        let pages = (groups!.count - 1)/8 + 1
        pageControl.numberOfPages = pages
        return pages
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: menueBigCellId
            , for: indexPath) as! MenueCell
        
        cell.backgroundColor = UIColor.randomColor()
        
        getMenueItemData(cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    //处理数据
    func getMenueItemData(cell: MenueCell, indexPath: IndexPath ) {
        let startIndex = indexPath.item * 8
        var endIndex = (indexPath.item + 1) * 8 - 1
        
        if endIndex > groups!.count - 1 {
            endIndex = groups!.count - 1
        }
        
        cell.groups = Array(groups![startIndex...endIndex])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / scrollView.widths())
        pageControl.currentPage = index
    }
}





