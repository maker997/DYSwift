//
//  FunnyVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/9.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let contentTop : CGFloat = 8

class FunnyVC: BaseAnchorGroupVC {
   fileprivate lazy var funnyVM : FunnyViewModel = FunnyViewModel()
    

}

//MARK:==========设置 UI==========
extension FunnyVC{
    override func setupUI() {
        super.setupUI()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.headerReferenceSize = CGSize.zero
        
        collectionView.contentInset = UIEdgeInsets(top: contentTop, left: 0, bottom: 0, right: 0)
        
    }
}

//MARK:==========请求数据==========
extension FunnyVC{
    override func loadData() {
        viewModel = funnyVM
        
        funnyVM.loadFunnyData {
            self.finishLoadData()
            self.collectionView.reloadData()
        }
    }
}


