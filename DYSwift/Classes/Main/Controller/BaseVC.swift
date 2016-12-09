//
//  BaseVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/9.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class BaseVC: UIViewController {
    var contentView : UIView?
   fileprivate lazy var animateVeiw : UIImageView = { [unowned self] in
        let iv = UIImageView(image: UIImage(named: "img_loading_1"))
        iv.animationImages = [UIImage(named: "img_loading_1")!,UIImage(named: "img_loading_2")!];
        iv.center = self.view.center
        iv.animationDuration = 0.5
        iv.animationRepeatCount = LONG_MAX
        iv.autoresizingMask = [.flexibleTopMargin,.flexibleBottomMargin]
        return iv
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

//MARK:==========设置 UI==========
extension BaseVC{
    func setupUI() {
        
        contentView?.isHidden = true
        view.backgroundColor = UIColor(r: 250, g: 250, b: 250)
        view.addSubview(animateVeiw)
        animateVeiw.startAnimating()
    }
    
    func finishLoadData() {
        contentView?.isHidden = false
        animateVeiw.stopAnimating()
        animateVeiw.isHidden = true
    }
}



















