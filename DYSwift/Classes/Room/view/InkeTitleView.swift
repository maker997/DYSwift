//
//  InkeTitleView.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/27.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class InkeTitleView: UIView {
    
    //左按钮
    var leftItem: UIButton = {
       let leftBtn = UIButton(frame: CGRect(x: 0, y: 20, width: 44, height: 44))
       let image = UIImage(named: "search")
        leftBtn.setImage(image, for: .normal)
        
        return leftBtn
    }()
    //右按钮
    var rightItem: UIButton = {
        let rightBtn = UIButton(frame: CGRect(x: screenWidth - 44, y: 20, width: 44, height: 44))
        let image = UIImage(named: "message")
        rightBtn.setImage(image, for: .normal)
        
        return rightBtn
    }()
    // 标题
    var titleView : PageTitleView!
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

//MARK: ====== 设置 UI ======
extension InkeTitleView
{
    func setupUI() {
        //1.设置背景色和左右按钮
        self.backgroundColor = InkeGlobalColor
        addSubview(leftItem)
        addSubview(rightItem)
        
        //2.设置标题
        titleView  = PageTitleView(frame:CGRect(x: leftItem.right(), y: 20.0, width: screenWidth - 88.0, height: 44.0) , titles: ["关注","热门","附近","才艺","好声音"])
        addSubview(titleView)
        titleView.indicatorView.isHidden = true
        titleView.DefulteTitleColor = UIColor.white
        
    }
}









