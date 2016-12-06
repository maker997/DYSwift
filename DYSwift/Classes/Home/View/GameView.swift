//
//  GameView.swift
//  DYSwift
//
//  Created by maker on 2016/12/6.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

let gameCellId = "gameCellId"

class GameView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!
    var anchorGroup : [AnchorGroup]? {
        didSet{
            anchorGroup?.removeFirst()
            anchorGroup?.removeFirst()
            
            let groups = AnchorGroup()
            groups.tag_name = "更多"
            anchorGroup?.append(groups)
            collectionView.reloadData()
        }
    }
    
    
    override func awakeFromNib() {
        autoresizingMask = UIViewAutoresizing()
        
        collectionView.register(UINib(nibName: "GameCell", bundle: nil), forCellWithReuseIdentifier: gameCellId)
    }

    //从 nib 中加载 view
    class func getGameView() -> GameView{
       return Bundle.main.loadNibNamed("GameView", owner: nil, options: nil)?.first as! GameView
        
    }

}

//MARK:==========集合视图代理==========
extension GameView : UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return anchorGroup?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: gameCellId, for: indexPath) as! GameCell
        cell.gameModel = anchorGroup![indexPath.item]
        return cell
    }
}
