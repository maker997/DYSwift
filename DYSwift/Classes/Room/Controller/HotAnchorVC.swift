//
//  HotAnchorVC.swift
//  DYSwift
//
//  Created by 刘甲奇 on 2016/12/27.
//  Copyright © 2016年 maker. All rights reserved.
//

import UIKit
var count: Int = 0
let inkeHotAnchorCell = "InkeHotAnchorCell"
class HotAnchorVC: UITableViewController {
   fileprivate lazy var anchorModel: InkeHotViewModel = InkeHotViewModel()
    var dataSource: [Live]!

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
    }

}

//MARK: ====== 设置 UI ======
extension HotAnchorVC{
    func setupUI()  {
        
        tableView.register(UINib(nibName: "InkeHotAnchorCell", bundle: nil), forCellReuseIdentifier: inkeHotAnchorCell)
        tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 450
        tableView.rowHeight = UITableViewAutomaticDimension
    }
}

//MARK: ====== 请求数据 ======
extension HotAnchorVC{
    //加载数据
    func loadData() {
        let url = "http://service.inke.com/api/live/aggregation?uid=47702860&interest=1"
        
        anchorModel.loadInkeAnchors(url: url) { [weak self] in
            self?.dataSource = self?.anchorModel.InkeAnchors
            self?.tableView.reloadData()
        }
    }
}

//MARK: ====== tablew 代理 ======
extension HotAnchorVC{
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: inkeHotAnchorCell) as! InkeHotAnchorCell
        cell.anchorModel = dataSource?[indexPath.row];
        count += 1
        mprint(message: "---\(count)---")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let room = LivingCollection()
        room.dataSource = dataSource
        room.indexPath = indexPath 
        navigationController?.pushViewController(room, animated: true)
    }
    
}











