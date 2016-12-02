//
//  RecommandVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

//MARK:==========常量==========
let itemWidth = (screenWidth - 3*itemMargin)/2
let SectionHeadH: CGFloat = 50.0
let NormalCellId = "NormalCellId"
let PrettyCellId = "PrettyCellId"
let SectionHeadId = "SectionHeadId"

class RecommandVC: UIViewController {

    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth*0.75)
        layout.minimumLineSpacing = 0
        layout.headerReferenceSize = CGSize(width: screenWidth, height: SectionHeadH)
        layout.minimumInteritemSpacing = itemMargin
        
        
        let collect = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collect.dataSource = self
        collect.delegate = self
        collect.contentInset = UIEdgeInsetsMake(0, itemMargin, 0, itemMargin)
        collect.register(UINib(nibName: "CollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: SectionHeadId)
        collect.register(UINib(nibName: "NormalCollectionCell", bundle: nil), forCellWithReuseIdentifier: NormalCellId)
        collect.register(UINib(nibName: "PrettyCollectionCell", bundle: nil), forCellWithReuseIdentifier: PrettyCellId)
        collect.backgroundColor = UIColor.white
        collect.showsVerticalScrollIndicator = false
        collect.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        return collect
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        

    }
}


//MARK:==========设置 UI==========
extension RecommandVC{
    fileprivate func setupUI(){
        //1.添加 collectionView
        view.addSubview(collectionView)
        
    }
}

//MARK:==========collectionView 代理==========
extension RecommandVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 8
        }
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        if indexPath.section == 1 {
          let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrettyCellId, for: indexPath)
            return cell
        }else{
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCellId, for: indexPath)
            return cell
        }
    
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeadId, for: indexPath)
        
        return headerView
    }
    
    //MARK:==========布局==========
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: itemWidth, height: itemWidth * 1.25)
        }
        return CGSize(width: itemWidth, height: itemWidth * 0.75)
    }
}















