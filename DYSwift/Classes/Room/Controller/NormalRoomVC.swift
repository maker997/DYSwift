//
//  NormalRoomVC.swift
//  DYSwift
//
//  Created by maker on 2016/12/9.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import IJKMediaFramework

class NormalRoomVC: UIViewController{
    
    var streamUrl : String!
    var player: IJKFFMoviePlayerController!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        setupUI()
    }

}

//MARK: ====== 设置 UI ======
extension NormalRoomVC{
    func setupUI() {
        let url = URL(string: streamUrl)
        
        player = IJKFFMoviePlayerController(contentURL: url, with: nil)
        player.prepareToPlay()
        player.view.frame = view.bounds
        view.insertSubview(player.view, at: 1)
    }
}










