//
//  AnchorListVC.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/27.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

fileprivate let headerH : CGFloat = 64.0
class AnchorListVC: UIViewController {
    var heardView : InkeTitleView!
    lazy var contentView: ContentView = {
       let rect = CGRect(x: 0, y: headerH, width: screenWidth, height: screenHeight)
       var chirlds = [UIViewController]()
        
        let careVc = CaredAnchorVC()
        chirlds.append(careVc)
        let hotVc = HotAnchorVC()
        chirlds.append(hotVc)
        for i in 0 ..< 3 {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            chirlds.append(vc)
        }
        let contentView = ContentView(frame: rect, chirldVCS: chirlds, parent: self)
        return contentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

    }

}

//MARK: ====== 设置 UI ======
extension AnchorListVC
{
    func setupUI() {
        //1.设置导航的颜色
        self.navigationController?.navigationBar.isHidden = true    
        heardView = InkeTitleView(frame: CGRect(x: 0.0, y: 0.0, width: screenWidth, height: headerH))
        view.addSubview(heardView)
        
        //2.添加内容 view
        view.addSubview(contentView)
        
        //3. 设置代理
        heardView.titleView.delegate = self
        contentView.delegate = heardView.titleView
        
    }
}

//MARK: ====== 标题的点击代理 ======
extension AnchorListVC: headerClickDelegate
{
    func titleClick(_ headView: PageTitleView, index: Int) {
        contentView.setOffset(index)
    }
    
    
}




