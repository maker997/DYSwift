//
//  NormalRoomVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/9.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class NormalRoomVC: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.orange
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

}











