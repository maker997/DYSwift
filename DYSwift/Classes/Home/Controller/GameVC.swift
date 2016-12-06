//
//  GameVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let itemWidth = (screenWidth - 2*itemMargin)/3
fileprivate let itemHeight = itemWidth*6/5
let gameVCCellId = "gameVCCellId"
fileprivate let gameHeaderId = "gameHeaderId"


class GameVC: UIViewController {
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, itemMargin, 0, itemMargin)
        layout.headerReferenceSize = CGSize(width: screenWidth, height: SectionHeadH)
        
        let collect = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        collect.dataSource = self
        collect.frame = self.view.bounds
        collect.backgroundColor = UIColor.white
        collect.autoresizingMask = [.flexibleHeight,.flexibleWidth]
        collect.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: gameVCCellId)
        return collect
    }()
    fileprivate lazy var viewModel : GameViewModel = GameViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        collectionView.register(UINib(nibName: "CollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: gameHeaderId)
        
        //加载数据
        viewModel.loadGameData { [unowned self] in
            
            self.collectionView.reloadData()
        }
    }
}

//MARK:==========设置 UI==========
extension GameVC {
    fileprivate func setupUI() {
        view.addSubview(collectionView)
        
    }
}

//MARK:==========集合视图代理==========
extension GameVC : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.games.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: gameVCCellId, for: indexPath) as! GameCell
        
        cell.gameModel = viewModel.games[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: gameHeaderId, for: indexPath) as! CollectionHeader
        header.headerMoreBtn.isHidden = true
        header.headerTitle.text = "全部"
        header.headerIcon.image = UIImage(named: "Img_orange")
        return header
        
    }
}















