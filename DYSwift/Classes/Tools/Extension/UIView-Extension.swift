//
//  UIView-Extension.swift
//  WBSwift
//
//  Created by maker on 2016/11/16.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

extension UIView{
    func widths() -> CGFloat {
        return frame.size.width
    }
    func heights() -> CGFloat {
        return frame.size.height
    }
    func left() -> CGFloat {
        
        return frame.origin.x
    }
    func right() -> CGFloat {
        return frame.origin.x + frame.size.width
    }
    func top() -> CGFloat {
        return frame.origin.y
    }
    func bot() -> CGFloat {
        return frame.origin.y + frame.size.height
    }
    //MARK:==========set 方法==========
    func setW(_ w:CGFloat) {
        frame.size.width = w
    }
    func setH(_ H:CGFloat) {
        frame.size.height = H
    }
    func setX(_ X:CGFloat) {
        frame.origin.x = X
    }
    func setY(_ Y:CGFloat) {
        frame.origin.y = Y
    }
}
