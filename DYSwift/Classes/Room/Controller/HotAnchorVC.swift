//
//  HotAnchorVC.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/27.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit

class HotAnchorVC: UITableViewController {
   fileprivate lazy var anchorModel: InkeHotViewModel = InkeHotViewModel()
    var dataSource: [Live]?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }

}

//MARK: ====== 设置 UI ======
extension HotAnchorVC{
    func setupUI()  {
        
        tableView.register(UINib(nibName: "InkeHotAnchorCell", bundle: nil), forCellReuseIdentifier: inkeHotAnchorCell)
        tableView.rowHeight = 465
    }
}

//MARK: ====== 请求数据 ======
extension HotAnchorVC{
    //加载数据
    func loadData() {
        let url = "http://service.inke.com/api/live/simpleall?&uid=47702860"
        
        anchorModel.loadInkeAnchors(url: url) {
            self.dataSource = self.anchorModel.InkeAnchors
            self.tableView.reloadData()
        }
    }
}

//MARK: ====== tablew 代理 ======
extension HotAnchorVC{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: inkeHotAnchorCell, for: indexPath) as! InkeHotAnchorCell
        cell.anchorModel = dataSource?[indexPath.row];
        return cell
    }
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let model = dataSource?[indexPath.row];
//    
//        return model?.rowHeight ?? 0
//        
//    }
    
}











