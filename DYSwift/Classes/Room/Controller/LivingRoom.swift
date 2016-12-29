//
//  LivingRoom.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/28.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit




class LivingRoom: UICollectionViewCell {
    
    @IBOutlet weak var bgView: UIImageView!
    
    
    
    static let BlurEffect: UIBlurEffect = UIBlurEffect()
    
    var anchorModel: Live?{
        didSet{
            setData()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    



}

//MARK: ====== 设置 UI ======
extension LivingRoom{
    func setupUI() {
        //设置模糊效果
        let effectView = UIVisualEffectView(effect: LivingRoom.BlurEffect)
        effectView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight + 64.0)
        bgView.addSubview(effectView)
        //创建播放器
    }
    
}

//MARK: ====== 填充数据 ======
extension LivingRoom{
    func setData() {
        let url = URL(string: (anchorModel?.creator.portrait)!)
        bgView.kf.setImage(with: url)
    }
}









