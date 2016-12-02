//
//  HomeVC.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

private let headerH: CGFloat = 40


class HomeVC: UIViewController {
    lazy var headerView : PageTitleView = {         //header
        let rect = CGRect(x: 0, y: 64, width: screenWidth, height: headerH)
        let header = PageTitleView(frame:rect , titles: ["推荐","游戏","娱乐","趣玩"])
        return header
    }()
    
    lazy var contentView: ContentView = {           //内容视图
        let rect = CGRect(x: 0, y: 64.0 + headerH, width: screenWidth, height: screenHeight - headerH - 44)
        var chirlds = [UIViewController]()
        chirlds.append(RecommandVC())
        for _ in 0..<3 {
           let chirld = UIViewController()
           chirlds.append(chirld)
           chirld.view.backgroundColor = UIColor.randomColor()
        }
        let content = ContentView(frame: rect, chirldVCS: chirlds, parent: self)
        return content
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
        
        //3.设置内容视图
        view.addSubview(contentView)
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
        headerView.delegate = self
        contentView.delegate = headerView
    }
}

//MARK:==========头部代理==========
extension HomeVC: headerClickDelegate{
    func titleClick(headView: PageTitleView, index: Int) {
        contentView.setOffset(page: index)
    }
}















