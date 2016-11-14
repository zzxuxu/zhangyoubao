//
//  ProfileViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class ProfileViewController: BaseViewController, NavigationProtocol {

    private var tbView: UITableView?
    private let titles = ["我的评论","我的收藏","离线视频","我的主播","我的任务"]
    private let images = ["个人中心_评论","个人中心_收藏","个人中心_离线视频","个人中心_我的直播","个人中心_我的任务"]

    private let titles2 = ["我的话题","我的竞猜"]
    private let images2 = ["个人中心_话题","个人中心_我的竞猜"]

    override func viewDidLoad() {
        super.viewDidLoad()

        addBackgroundImage()
        addTitle("我的")

        tbView = UITableView(frame: CGRectMake(0, 0, kScreenW, kScreenH-64), style: .Grouped)
        tbView!.delegate = self
        tbView!.dataSource = self

        view.addSubview(tbView!)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

//MARK UITableView代理
extension ProfileViewController: UITableViewDelegate,UITableViewDataSource {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var cnt = 0
        if section == 0{
            cnt = titles.count
        }else if section == 1{
            cnt = titles2.count
        }
        return cnt
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 60
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("profileCell")

        if nil == cell {
            cell = UITableViewCell(style: .Default, reuseIdentifier: "profileCell")
        }

        if indexPath.section == 0 {
            cell?.imageView?.image = UIImage(named: images[indexPath.row])
            cell?.textLabel?.text = titles[indexPath.row]
        }else if indexPath.section == 1 {
            cell?.imageView?.image = UIImage(named: images2[indexPath.row])
            cell?.textLabel?.text = titles2[indexPath.row]
        }
        


//        cell?.accessoryView = UIImageView(image: UIImage(image: UIImage(named: "个人中心_右箭头"))
        cell?.accessoryType = .DisclosureIndicator

        return cell!

    }


}











