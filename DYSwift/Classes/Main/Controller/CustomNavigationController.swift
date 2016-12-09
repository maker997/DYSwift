//
//  CustomNavigationController.swift
//  DYSwift
//
//  Created by maker on 2016/12/9.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1.在加载 view 的时候系统已经给添加好了手势
        guard let sysGesture = interactivePopGestureRecognizer else { return }
        
        //2.利用运行时打印手势的所有属性名称
//        var count : uint = 0
        
        //2.1返回成员变量的指针数组
//        let Ivars = class_copyIvarList(UIGestureRecognizer.self, &count)!
//        
//        for i in 0..<count {
//            let Ivar = Ivars[Int(i)]
//            let name = ivar_getName(Ivar)
//            print(String(cString: name!))
//            
//        }
        
        //3.获取手势在的 view
        let gestureView = sysGesture.view!
        
        //4.获取 target 和 action
        /*
         let targets = systemGes.value(forKey: "_targets") as? [NSObject]
         guard let targetObjc = targets?.first else { return }
         
         // 3.2.取出target
         guard let target = targetObjc.value(forKey: "target") else { return }
         
         // 3.3.取出Action
         let action = Selector(("handleNavigationTransition:"))
         */
        let targets = sysGesture.value(forKey: "_targets") as? [NSObject]
        
        guard let targetObjc = targets?.first else { return }
        
        guard let target = targetObjc.value(forKey: "target") else { return }
        
        let action = Selector(("handleNavigationTransition:"))
        
        // 4.创建自己的Pan手势
        let panGes = UIPanGestureRecognizer()
        gestureView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)

        
        
        
        

    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
         viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
}
