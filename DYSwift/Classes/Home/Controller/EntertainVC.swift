//
//  EntertainVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/7.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let MenueViewH : CGFloat = 200

class EntertainVC: BaseAnchorGroupVC {
    
    //viewModel
    fileprivate lazy var EntertainVM : EntertainViewModel = EntertainViewModel()
    
    fileprivate lazy var menueView : MenueView = {
       let menue = MenueView.getMenueView()
        menue.frame = CGRect(x: 0, y: -MenueViewH, width: screenWidth, height: MenueViewH)
        return menue
    }()
    
}

//MARK:==========设置 UI==========
extension EntertainVC {
    override func setupUI() {
        super.setupUI()
        
        collectionView.addSubview(menueView)
        collectionView.contentInset = UIEdgeInsets(top: MenueViewH, left: 0, bottom: 0, right: 0)
    }
}

//MARK:==========请求数据==========
extension EntertainVC {
   override  func loadData() {
      viewModel = EntertainVM
    
        EntertainVM.loadEntertainData {
            
            self.collectionView.reloadData()
            
            var tempGroup = self.EntertainVM.anchorGroups
            tempGroup.remove(at: 0)
            
            self.menueView.groups = tempGroup
        }
    
    }
}

/*
    来到子类EntertainVC
 
 拥有了属性:
    1.自身的属性:EntertainVM 自己的一个数据工具类
 
    2.父类的属性:
        2.1 collectionView
        2.2 viewModel (nil)
 
 执行父类的系统回调方法
    1.viewDidLoad()
        1.1 setupUI()  (view 添加 collectionView)
        2.2 loadData() (执行子类中的方法)
    2.子类的loadData() 方法:
        2.1 给父类的viewModel 赋值为 EntertainVM
        2.2 调用EntertainVM 的loadEntertainData 方法
        2.3 loadEntertainData 方法中又执行其父类中 请求数据的方法
    3.通过闭包的传递
        回到自身后刷新collectionView
 
 
 */





















