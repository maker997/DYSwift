//
//  HomeVC.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    lazy var headerView : PageTitleView = {
        let rect = CGRect(x: 0, y: 64, width: screenWidth, height: 40)
        let header = PageTitleView(frame:rect , titles: ["推荐","游戏","娱乐","趣玩"])
        return header
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

//MARK:==========设置 UI==========
extension HomeVC{
    
    fileprivate func setupUI() {
       //1.设置导航栏
        setNavigationBar()
        
       //2.设置 titleView
        setupHeaderView()
    }
    
    //1.设置导航
    fileprivate func setNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: "logo")
        
        let searchItem = UIBarButtonItem(image: "btn_search", selectImage: "btn_search_clicked", size: CGSize(width: 40, height: 40))
        let historyItem = UIBarButtonItem(image: "image_my_history", selectImage: "Image_my_history_click", size: CGSize(width: 40, height: 40))
        let scanItem = UIBarButtonItem(image: "Image_scan", selectImage: "Image_scan_click", size: CGSize(width: 40, height: 40))
        
        navigationItem.rightBarButtonItems = [historyItem,searchItem,scanItem]
    }
    
    //2.设置 titleView
    fileprivate func setupHeaderView(){
        automaticallyAdjustsScrollViewInsets = false
        view.addSubview(headerView)
    }
}


















