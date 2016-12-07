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
    fileprivate var timer : Timer?
    var cycleModels : [CycleModel]? {
        didSet{
            guard let cycleModels = cycleModels else {
                return
            }
            pageControl.numberOfPages = cycleModels.count
            collectionView.reloadData()
            
            //3.设置滚动到中间某一个位置
            let selectPath = IndexPath(item: (cycleModels.count * 10), section: 0)
            collectionView.scrollToItem(at: selectPath, at: .left, animated: false)
            
            //4.添加定时器
            removeTimer()
            addTimer()
        }
    }
    
    
    override func awakeFromNib() {
        //设置自身不随父控件伸缩而伸缩
        autoresizingMask = UIViewAutoresizing()
        
        //注册 cell
        collectionView.register(UINib(nibName: "CycleCell", bundle: nil), forCellWithReuseIdentifier: cycleCellId)
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
        return (cycleModels?.count ?? 0) * 10000
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cycleCellId, for: indexPath) as! CycleCell
        
        cell.model = cycleModels?[(indexPath.item % (cycleModels?.count  ?? 1))]
        
        return cell
        
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index = Int((scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width)
        let currentIndex = index % (cycleModels?.count ?? 1 )
        
        pageControl.currentPage = currentIndex
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        removeTimer()
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        addTimer()
    }
}

////MARK:========== 定时器 ==========
extension MakerCycleView{
    
    fileprivate func addTimer() {
        timer = Timer(timeInterval: 2.5, target: self, selector: #selector(MakerCycleView.scroll), userInfo: nil, repeats: true)
        RunLoop.main.add(timer!, forMode: .commonModes)
        
    }
    
    fileprivate func removeTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    @objc fileprivate func scroll() {
        let currentOffset = collectionView.contentOffset.x
        let nextOffset = currentOffset + collectionView.widths()
        
        collectionView.setContentOffset(CGPoint(x:nextOffset,y:0), animated: true)
        
    }
}













