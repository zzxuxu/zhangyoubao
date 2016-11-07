//
//  RefreshProtocol.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/2.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import MJRefresh

protocol RefreshProtocol: NSObjectProtocol {
    func addRefresh(header:(()->())?, footer:(()->())?, tableView:UITableView)
}

extension RefreshProtocol where Self:UIViewController{
    func addRefresh(header:(()->())?=nil,footer:(()->())?=nil, tableView:UITableView){
        if header != nil{
            tableView.mj_header = MJRefreshNormalHeader(refreshingBlock: header)
        }
        if footer != nil{
            tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: footer)
        }
    }
}
