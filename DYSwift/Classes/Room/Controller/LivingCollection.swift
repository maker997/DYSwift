//
//  LivingCollection.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/29.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
import IJKMediaFramework

fileprivate let InkeLingRoomCell = "InkeLingRoomCell"
class LivingCollection: UIViewController {

    var collectinView: UICollectionView!
    var dataSource: [Live]!
    var indexPath: IndexPath!
    var player: IJKFFMoviePlayerController!
    var tooBar: RoomToolBar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        scrollToIndex(indexPath: indexPath)
        setData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        player.pause()
        player.stop()
        player.shutdown()
    }

}
//MARK: ====== 设置 UI ======
extension LivingCollection{
    //1.初始化界面
    func setupUI() {
        //创建 collectionView
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: screenWidth, height: screenHeight + 64.0)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectinView = collection
        collection.showsVerticalScrollIndicator = false
        collection.backgroundColor = UIColor.white
        
        collection.register(UINib(nibName: "LivingRoom", bundle: nil), forCellWithReuseIdentifier: InkeLingRoomCell)
        collection.isPagingEnabled = true
        collection.dataSource = self
        collection.delegate = self
        
        collection.reloadData()
        view.insertSubview(collection, at: 0)
        
        //创建工具条
        let bar = RoomToolBar.getToolView()
        bar.frame = CGRect(x: 0, y: screenHeight + 20.0, width: screenWidth, height: 40)
        bar.delegate = self
        tooBar = bar
        view.addSubview(bar)
        
    }
    
    //2.滚动到制定的位置
    func scrollToIndex(indexPath: IndexPath) {
        DispatchQueue.global().async {
            while true{
                if self.collectinView.window != nil{
                    break
                }
            }
            DispatchQueue.main.async {
                self.collectinView.scrollToItem(at: indexPath, at: .top, animated: false)
            }
        }
    }
}

//MARK: ====== 设置数据 ======
extension LivingCollection{
    func setData() {
        if player != nil{
            player.stop()
            player = nil
        }
        let anchorModel = dataSource[indexPath.row]
        
        
        let SteamUrl = URL(string: (anchorModel.stream_addr)!)
        
        player = IJKFFMoviePlayerController(contentURL: SteamUrl, with: nil)
        player.prepareToPlay()
        player.view.frame = view.bounds
        view.addSubview(player.view)
        view.bringSubview(toFront: tooBar)
    }
}

//MARK: ====== collectionView 代理 ======
extension LivingCollection:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InkeLingRoomCell, for: indexPath) as! LivingRoom
        let model = dataSource[indexPath.row]
        cell.anchorModel = model
        return cell
    }
}


//MARK: ====== toolBar代理 ======
extension LivingCollection: LivingCellDelegate{
    func closeLivingRoom() {
        navigationController?.popViewController(animated: true)
    }
}












