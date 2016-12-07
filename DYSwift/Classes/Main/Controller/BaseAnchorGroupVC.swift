//
//  BaseAnchorGroupVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let itemWidth = (screenWidth - 3*itemMargin)/2

class BaseAnchorGroupVC: UIViewController {
    
    //collectionView
     lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth*0.75)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = itemMargin
        layout.headerReferenceSize = CGSize(width: screenWidth, height: SectionHeadH)
        layout.sectionInset = UIEdgeInsets(top: 0, left: itemMargin, bottom: 0, right: itemMargin)
        
        
        let collect = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collect.dataSource = self
        collect.delegate = self
        
        collect.register(UINib(nibName: "CollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SectionHeadId)
        collect.register(UINib(nibName: "NormalCollectionCell", bundle: nil), forCellWithReuseIdentifier: NormalCellId)
        collect.register(UINib(nibName: "PrettyCollectionCell", bundle: nil), forCellWithReuseIdentifier: PrettyCellId)
        collect.backgroundColor = UIColor.white
        collect.showsVerticalScrollIndicator = false
        collect.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collect.contentInset = UIEdgeInsetsMake(CycleH + GameviewH, 0, 0, 0)
        return collect
        }()
    
    //viewModel
    var viewModel : BaseViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setupUI()
        loadData()
    }

}
//MARK:==========请求数据==========
extension BaseAnchorGroupVC {
    func loadData() {
        
    }
}

//MARK:==========设置 UI==========
extension BaseAnchorGroupVC {
    func setupUI() {
        view.addSubview(collectionView)
        
    }
}

//MARK:==========collectionView 代理==========
extension BaseAnchorGroupVC:UICollectionViewDataSource,UICollectionViewDelegate {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let groups = viewModel.anchorGroups[section]
        
        return groups.AnchorGroups.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCellId, for: indexPath) as! NormalCollectionCell
        
        let groups = viewModel.anchorGroups[indexPath.section]
        
        cell.anchor = groups.AnchorGroups[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeadId, for: indexPath) as! CollectionHeader
        header.group = viewModel.anchorGroups[indexPath.section]
        
        return header
    }
}



