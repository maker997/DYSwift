//
//  RecommandVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/2.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

//MARK:==========常量==========
fileprivate let CycleH = screenWidth/8*3
let GameviewH : CGFloat = 90

class RecommandVC: BaseAnchorGroupVC {
    //viewModel
    fileprivate lazy var RecommadModel : RecommadViewModel = RecommadViewModel()
    
    //cycleView
    fileprivate lazy var cycleView : MakerCycleView = {
        let cycleView = MakerCycleView.getCycleView()
        cycleView.frame = CGRect(x: 0, y: -(CycleH + GameviewH), width: screenWidth, height: CycleH)
        return cycleView
    }()
    
    //gameView
    fileprivate lazy var gameView : GameView = {
        let game = GameView.getGameView()
        game.frame = CGRect(x: 0, y: -GameviewH, width: screenWidth, height: GameviewH)
        return game
    }()
    
}

//MARK:==========设置 UI==========
extension RecommandVC{
    override func setupUI(){
        
        //1.调用父类的设置界面
        super.setupUI()
        
        //2.往集合视图中添加轮播
        collectionView.addSubview(cycleView)
        
        //3.添加推荐游戏视图
        collectionView.addSubview(gameView)
        
        //4.设置 collectionView 内边距
        collectionView.contentInset = UIEdgeInsetsMake(CycleH + GameviewH, 0, 0, 0)
    }
}

//MARK:==========请求数据==========
extension RecommandVC {
    override func loadData() {
        
        //1.给父类工具类赋值
        viewModel = RecommadModel
        
        //发送网络请求
        RecommadModel.getData {
            //1.显示 collectionView 的数据
            self.collectionView.reloadData()
            
            //2.处理数据显示推荐游戏
            var tempAnchorGroup = self.RecommadModel.anchorGroups
            tempAnchorGroup.removeFirst()
            tempAnchorGroup.removeFirst()
            
            let group = AnchorGroup()
            group.tag_name = "更多"
            tempAnchorGroup.append(group)
            self.gameView.anchorGroup = tempAnchorGroup
            
        }
        
        //请求轮播的数据
        RecommadModel.getCycleData {
            self.cycleView.cycleModels = self.RecommadModel.cycles
        }
    }
    
}

//MARK:==========collectionView 代理==========
extension RecommandVC: UICollectionViewDelegateFlowLayout {
    
    //设置 cell 不同样式
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
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
    
    //MARK:==========布局==========
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize{
        if indexPath.section == 1 {
            return CGSize(width: AnchorItemWidth, height: AnchorItemWidth * 1.25)
        }
        return CGSize(width: AnchorItemWidth, height: AnchorItemWidth * 0.75)
    }
}















