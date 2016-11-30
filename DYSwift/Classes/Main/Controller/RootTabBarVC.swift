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
        addChirldVC(nibName: "Home")
        addChirldVC(nibName: "Live")
        addChirldVC(nibName: "Cared")
        addChirldVC(nibName: "Own")
        
    }
    
    func addChirldVC(nibName:String) {
        let chirldVC = UIStoryboard(name: nibName, bundle: nil).instantiateInitialViewController()!
        addChildViewController(chirldVC)
    }
}













