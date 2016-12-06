//
//  RecommandVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

//MARK:==========常量==========
fileprivate let itemWidth = (screenWidth - 3*itemMargin)/2
let SectionHeadH: CGFloat = 50.0
let NormalCellId = "NormalCellId"
let PrettyCellId = "PrettyCellId"
let SectionHeadId = "SectionHeadId"
let CycleH = screenWidth/8*3
let GameviewH : CGFloat = 90



class RecommandVC: UIViewController {
    fileprivate lazy var viewModel : RecommadViewModel = RecommadViewModel()
    fileprivate lazy var cycleView : MakerCycleView = {
        let cycleView = MakerCycleView.getCycleView()
        cycleView.frame = CGRect(x: 0, y: -(CycleH + GameviewH), width: screenWidth, height: CycleH)
        return cycleView
    }()
    fileprivate lazy var gameView : GameView = {
        let game = GameView.getGameView()
        game.frame = CGRect(x: 0, y: -GameviewH, width: screenWidth, height: GameviewH)
        return game
    }()
    
    fileprivate lazy var collectionView: UICollectionView = {[unowned self] in
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
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        //发送网络请求
        viewModel.getData { 
            self.collectionView.reloadData()
            self.gameView.anchorGroup = self.viewModel.anchorGroups
        }
        
        //请求轮播的数据
        viewModel.getCycleData {
            self.cycleView.cycleModels = self.viewModel.cycles
        }
    }
}


//MARK:==========设置 UI==========
extension RecommandVC{
    fileprivate func setupUI(){
        //1.添加 collectionView
        view.addSubview(collectionView)
        
        //2.往集合视图中添加轮播
        collectionView.addSubview(cycleView)
        
        //3.添加推荐游戏视图
        collectionView.addSubview(gameView)
        
    }
}

//MARK:==========collectionView 代理==========
extension RecommandVC : UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return viewModel.anchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let anchorGroup = viewModel.anchorGroups[section]
        
        return anchorGroup.AnchorGroups.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        if indexPath.section == 1 {
          let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: PrettyCellId, for: indexPath) as! PrettyCollectionCell
            let anchorGroup = viewModel.anchorGroups[indexPath.section]
            cell.anchor = anchorGroup.AnchorGroups[indexPath.item]
            return cell
        }else{
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NormalCellId, for: indexPath) as! NormalCollectionCell
            let anchorGroup = viewModel.anchorGroups[indexPath.section]
            cell.anchor = anchorGroup.AnchorGroups[indexPath.item]
            return cell
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeadId, for: indexPath) as! CollectionHeader
        headerView.group = viewModel.anchorGroups[indexPath.section]
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















