//
//  MakerCycleView.swift
//  DYSwift
//
//  Created by maker on 2016/12/5.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

let cycleCellId = "cycleCellId"


class MakerCycleView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func awakeFromNib() {
        //设置自身不随父控件伸缩而伸缩
        autoresizingMask = UIViewAutoresizing()
        //注册 cell
        
//        collectionView.register(UINib(nibName: "MakerCycleView", bundle: nil), forCellWithReuseIdentifier: cycleCellId)
        collectionView.register(UINib(nibName: "MakerCycleView", bundle: nil), forCellWithReuseIdentifier: cycleCellId)

        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    //从 layoutSubviews 方法中设置布局准确
    override func layoutSubviews() {
        super.layoutSubviews()
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.bounds.size
        
    }
}

extension MakerCycleView {
    class func getCycleView() -> MakerCycleView{
        
     return  Bundle.main.loadNibNamed("MakerCycleView", owner: nil, options: nil)?.first as! MakerCycleView
        
    }
}

extension MakerCycleView : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCellId, for: indexPath)
        
        cell.backgroundColor = indexPath.item % 2 == 0 ? UIColor.blue : UIColor.orange
        return cell
        
    }
}













