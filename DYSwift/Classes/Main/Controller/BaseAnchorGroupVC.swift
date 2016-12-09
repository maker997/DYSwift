//
//  BaseAnchorGroupVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

let AnchorItemWidth = (screenWidth - 3*itemMargin)/2
let SectionHeadH: CGFloat = 50.0
let NormalCellId = "NormalCellId"
let PrettyCellId = "PrettyCellId"
let SectionHeadId = "SectionHeadId"

class BaseAnchorGroupVC: BaseVC {
    
    //collectionView
     lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: AnchorItemWidth, height: AnchorItemWidth*0.75)
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
    override func setupUI() {
        contentView = collectionView
        view.addSubview(collectionView)
        
        super.setupUI()
        
    }
}

//MARK:==========collectionView 代理==========
extension BaseAnchorGroupVC:UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if viewModel == nil {
            return 1
        }
        return viewModel.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if viewModel == nil {
            return 20
        }
        
        let groups = viewModel.anchorGroups[section]
        
        return groups.AnchorGroups.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCellId, for: indexPath) as! NormalCollectionCell
        
        if viewModel == nil {
            return cell
        }
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

//MARK:==========collectionViewDegate==========
extension BaseAnchorGroupVC :UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let anchor = viewModel.anchorGroups[indexPath.section].AnchorGroups[indexPath.item]
        
        anchor.isVertical == 0 ? pushNormalRoom() : presentShowRoom()
    }
    
    fileprivate func presentShowRoom(){
        let show = ShowRoomVC()
        present(show, animated: true, completion: nil)
        
    }
    
    fileprivate func pushNormalRoom(){
        let normal = NormalRoomVC()
        
        navigationController?.pushViewController(normal, animated: true)
        
    }
}


