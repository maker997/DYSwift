//
//  ContentView.swift
//  DYSwift
//
//  Created by maker on 2016/12/1.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

protocol scrollProgressDelegate : NSObjectProtocol {
    func scrollProgress(progress: CGFloat,target: Int, source:Int)
}

private let cellId = "cellId"
class ContentView: UIView {
     var chirlds: [UIViewController]?
     weak var parent: UIViewController?
     fileprivate var startOffsetX: CGFloat = 0.0
     var delegate: scrollProgressDelegate?
     var isClick = false
    
     fileprivate lazy var collectView: UICollectionView = {[weak self]  in   //集合视图
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = (self?.bounds.size)!
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
    
        let collect = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collect.showsHorizontalScrollIndicator = false
        collect.isPagingEnabled = true
        collect.bounces = false
        collect.dataSource = self
        collect.delegate = self
        collect.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        return collect
    }()
    
    
     init(frame: CGRect,chirldVCS:[UIViewController],parent:UIViewController) {
        self.chirlds = chirldVCS
        self.parent = parent
        super.init(frame: frame)
        
        setupUI()
    }
    
     required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:==========设置 UI==========
extension ContentView{
    func setupUI() {
        for vc in chirlds! {
            parent?.addChildViewController(vc)
        }
        
        addSubview(collectView)
        collectView.frame = bounds
    }
}

//MARK:==========集合代理==========
extension ContentView : UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return chirlds!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        let vc = chirlds?[indexPath.item]
        vc?.view.backgroundColor = UIColor.randomColor()
        cell.contentView.addSubview((vc?.view)!)
        return cell
    }
    
    //开始滚动
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        startOffsetX = scrollView.contentOffset.x
        isClick = false
    }
    //正在滚动
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isClick {
            return
        }
        //判断是左右滑动
        var progress : CGFloat = 0.0
        var source : Int = 0
        var target : Int = 0
        
        let width = scrollView.bounds.size.width
        if scrollView.contentOffset.x < startOffsetX {
            //向右滑动
            progress = (startOffsetX - scrollView.contentOffset.x) / width
            
            target = Int(floor(scrollView.contentOffset.x / width))
            source = target + 1
            if target <= 0 {
                target = 0
            }
        }else{
            progress = (scrollView.contentOffset.x - startOffsetX ) / width
            
            source = Int(floor(startOffsetX / width))
            target = source + 1
            if target >= chirlds!.count {
                target = chirlds!.count - 1
            }
        }
        
        self.delegate?.scrollProgress(progress: progress, target: target, source: source)

    }
}

//MARK:==========对外开放的方法==========
extension ContentView{
    func setOffset(page:Int) {
        isClick = true
        collectView.setContentOffset(CGPoint(x:CGFloat(page) * bounds.size.width,y:0), animated: false)
        
    }
}














