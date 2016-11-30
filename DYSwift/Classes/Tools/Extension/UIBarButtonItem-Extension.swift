//
//  UIBarButtonItem-Extension.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

extension UIBarButtonItem{
    convenience init(image:String,selectImage:String = "",size:CGSize = CGSize.zero) {
        
        let btn = UIButton()
        btn.setImage(UIImage(named:image), for: .normal)
        if selectImage != "" {
            btn.setImage(UIImage(named:selectImage), for: .highlighted)
        }
        if size != CGSize.zero {
            btn.frame = CGRect(origin: CGPoint.zero, size: size)
        }else{
            btn.sizeToFit()
        }
        
        self.init(customView: btn)
    }
}
