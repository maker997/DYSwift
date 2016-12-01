//
//  UIColor-Extension.swift
//  DYSwift
//
//  Created by maker on 2016/12/1.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

extension UIColor{
    convenience init(r:CGFloat,g:CGFloat,b:CGFloat) {

        self.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: 1)
    }
    class func randomColor() -> UIColor {
        return UIColor(r: CGFloat(arc4random_uniform(256)), g: CGFloat(arc4random_uniform(256)), b: CGFloat(arc4random_uniform(256)))
    }
}
