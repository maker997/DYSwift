//
//  RootTabBarVC.swift
//  DYSwift
//
//  Created by maker on 2016/11/30.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class RootTabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addChirldVC("Home")
        addChirldVC("Live")
        addChirldVC("Cared")
        addChirldVC("Own")
        
    }
    
    func addChirldVC(_ nibName:String) {
        let chirldVC = UIStoryboard(name: nibName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(chirldVC)
    }
}













