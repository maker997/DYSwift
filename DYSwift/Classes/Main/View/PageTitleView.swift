//
//  PageTitleView.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

//MARK:==========常量==========
let lineH : CGFloat = 0.5
let indicatorH : CGFloat = 1.5
let NormalColor : (CGFloat,CGFloat,CGFloat) = (85,85,85)
let SelectColor : (CGFloat,CGFloat,CGFloat) = (255, 128, 0)

//MARK:==========定义代理==========
protocol headerClickDelegate: NSObjectProtocol {
    func titleClick(headView: PageTitleView,index: Int)
}

//MARK:==========类定义==========
class PageTitleView: UIView {
    lazy var titles : [String] = [String]()         //标题数组
    lazy var indicatorView : UIView = UIView()      //指示器
    lazy var titleLbls : [UILabel] = [UILabel]()    //标签数组
    weak var delegate : headerClickDelegate?        //代理

    lazy var scrollView : UIScrollView = {          //容器
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
        
        //1.设置容器
        addSubview(scrollView)
        scrollView.frame = bounds
        
        //2.设置容器中 label
        let width = screenWidth/CGFloat(titles.count)
        let height = frame.height - lineH - indicatorH
        
        for (index,title) in titles.enumerated() {
            let lbl = UILabel()
            
            //属性
            lbl.text = title
            lbl.font = UIFont.systemFont(ofSize: 16)
            lbl.textColor = UIColor(r: NormalColor.0, g: NormalColor.1, b: NormalColor.2)
            lbl.textAlignment = .center
            if index == 0 {
                lbl.textColor = UIColor(r: SelectColor.0, g: SelectColor.1, b: SelectColor.2)
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
        
        //3.创建底部的线
        let lineView = UIView()
        let lineY = frame.height - lineH
        scrollView.addSubview(lineView)
        lineView.backgroundColor = UIColor.lightGray
        lineView.frame = CGRect(x: 0, y: lineY, width: screenWidth, height: lineH)
        
        //4.创建指示器
        scrollView.addSubview(indicatorView)
        let indicatorY = frame.height - indicatorH
        indicatorView.frame = CGRect(x: 0, y: indicatorY, width: width, height: indicatorH)
        indicatorView.backgroundColor = UIColor.orange
    }
    
}

//MARK:==========点击事件==========
extension PageTitleView{
    //标签的点击
    func titleClick(sender : UITapGestureRecognizer) {
        //1.校验
        guard let lbl = sender.view else {
            return
        }
        
        //2.设置其他标签,和当前标签
        for label in titleLbls {
            label.textColor = UIColor(r: NormalColor.0, g: NormalColor.1, b: NormalColor.2)
        }
        let currentLbl = titleLbls[lbl.tag]
        currentLbl.textColor = UIColor(r: SelectColor.0, g: SelectColor.1, b: SelectColor.2)
        
        //3.移动指示器
        UIView.animate(withDuration: 0.2, animations: { _ in
            self.indicatorView.setX(X: currentLbl.left())
        })
        
        //4.通过代理传到控制器
       delegate?.titleClick(headView: self, index: lbl.tag)
        
    }
}

//MARK:==========下面滚动视图的代理==========
extension PageTitleView: scrollProgressDelegate{
    
    func scrollProgress(progress: CGFloat, target: Int, source: Int) {
        //1.取出要改变的 Label
        let sourceLbl = titleLbls[source]
        let targetLbl = titleLbls[target]
        
        //2.移动指示器
        let  indictorX = sourceLbl.left() + progress * (targetLbl.left() - sourceLbl.left())
        indicatorView.setX(X: indictorX)
        
        //3.设置目标标签的渐变
        let range = (SelectColor.0 - NormalColor.0,SelectColor.1 - NormalColor.1,SelectColor.2 - NormalColor.2)
        let current = (NormalColor.0 + progress * range.0 ,NormalColor.1 + progress * range.1,NormalColor.2 + progress * range.2)
        targetLbl.textColor = UIColor(r: current.0, g: current.1, b: current.2)
        
        //4.设置正常的颜色
        let rang1 = (-range.0,-range.1,-range.2)
        let current1 = (SelectColor.0 + progress * (rang1.0) ,SelectColor.1 + progress * (rang1.1),SelectColor.2 + progress * (rang1.2))
        sourceLbl.textColor = UIColor(r: current1.0, g: current1.1, b: current1.2)
    }
}









