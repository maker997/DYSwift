//
//  PageTitleView.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

let lineH : CGFloat = 0.5
let indicatorH : CGFloat = 1.5


class PageTitleView: UIView {
    lazy var titles : [String] = [String]()
    lazy var indicatorView : UIView = UIView()  //指示器
    lazy var titleLbls : [UILabel] = [UILabel]()
    var clickIndex = 0                          //现在点击的
    
    lazy var scrollView : UIScrollView = {      //容器
       let sv = UIScrollView()
       sv.isPagingEnabled = false
       sv.bounces = false
        return sv
    }()
    
    
    
    init(frame: CGRect,titles:[String]) {
        super.init(frame: frame)
        self.titles = titles
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK:==========设置 UI==========
extension PageTitleView{
    func setupUI() {
        
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //创建标签
        let width = screenWidth/CGFloat(titles.count)
        let height = frame.height - lineH - indicatorH
        
        for (index,title) in titles.enumerated() {
            let lbl = UILabel()
            
            //属性
            lbl.text = title
            lbl.font = UIFont.systemFont(ofSize: 16)
            lbl.textAlignment = .center
            if index == 0 {
                lbl.textColor = UIColor.orange
            }
            lbl.isUserInteractionEnabled = true
            lbl.tag = index
            titleLbls.append(lbl)
        
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.titleClick(sender:)))
            lbl.addGestureRecognizer(tap)
            
            //布局
            let x = width * CGFloat(index)
            lbl.frame = CGRect(x: x, y: 0, width: width, height: height)
            scrollView.addSubview(lbl)
        }
        
        //创建底部的线
        let lineView = UIView()
        let lineY = frame.height - lineH
        scrollView.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGray
        lineView.frame = CGRect(x: 0, y: lineY, width: screenWidth, height: lineH)
        
        //创建指示器
         scrollView.addSubview(indicatorView)
        let indicatorY = frame.height - indicatorH
        indicatorView.frame = CGRect(x: 0, y: indicatorY, width: width, height: indicatorH)
        indicatorView.backgroundColor = UIColor.orange
        
    }
}

//MARK:==========点击事件==========
extension PageTitleView{
    func titleClick(sender : UITapGestureRecognizer) {
        guard let lbl = sender.view else {
            return
        }
        
        if lbl.tag == clickIndex {
            return
        }
        
        let oldLbl = titleLbls[clickIndex]
        oldLbl.textColor = UIColor.black
        let currentLbl = titleLbls[lbl.tag]
        currentLbl.textColor = UIColor.orange
        clickIndex = lbl.tag
        
        //移动指示器

    }
}








