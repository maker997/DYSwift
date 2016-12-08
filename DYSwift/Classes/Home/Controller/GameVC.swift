//
//  GameVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let GameitemWidth = (screenWidth - 2*itemMargin)/3
fileprivate let itemHeight = GameitemWidth*6/5
let gameVCCellId = "gameVCCellId"
fileprivate let gameHeaderId = "gameHeaderId"


class GameVC: UIViewController {
    // CollectionView
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: GameitemWidth, height: itemHeight)
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
        collect.register(UINib(nibName: "CollectionHeader", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: gameHeaderId)
        collect.contentInset = UIEdgeInsets(top: (SectionHeadH + GameviewH), left: 0, bottom: 0, right: 0)
        return collect
    }()
    
    //头部 header
    fileprivate lazy var topHeaderView : CollectionHeader = {
        let header = CollectionHeader.getCollectionHeader()
        header.frame = CGRect(x: 0, y: -(SectionHeadH + GameviewH), width: screenWidth, height: SectionHeadH)
        header.headerIcon.image = UIImage(named: "Img_orange")
        header.headerTitle.text = "常见"
        header.headerMoreBtn.isHidden = true
        return header
    }()
    
    //第二栏 常见游戏
    fileprivate lazy var gameView : GameView = {
        let game = GameView.getGameView()
        game.frame = CGRect(x: 0, y: -GameviewH, width: screenWidth, height: GameviewH)
        return game
    }()
    
    //viewModel
    fileprivate lazy var viewModel : GameViewModel = GameViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        loadData()
        
    }
}

//MARK:==========设置 UI==========
extension GameVC {
    fileprivate func setupUI() {
        
        //1.添加 CollectionView
        view.addSubview(collectionView)
        
        //2.往 CollectionView 中添加 header
        collectionView.addSubview(topHeaderView)
        
        //3.推荐游戏
        collectionView.addSubview(gameView)
        
    }
}
//MARK:==========请求数据==========
extension GameVC {
    func loadData() {
        //加载数据
        viewModel.loadGameData { [unowned self] in
            
            //1.加载 collectionView的数据
            self.collectionView.reloadData()
            
            //2.取前十条展示
            let tempt =  self.viewModel.games[0..<10]
            self.gameView.anchorGroup = Array(tempt)
            
        }
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















