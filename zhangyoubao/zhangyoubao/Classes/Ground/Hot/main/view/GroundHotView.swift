//
//  GroundhotView.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/3.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import MJRefresh

class GroundHotView: UIView {

    let refreshParamHot = ["api":"dynamic.getsquarehotlist","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"115350","os":"ios","osVersion":"8.1.2","params%5BpageSize%5D":"20","params%5Bsort%5D":"0","params%5BtagsFilter%5D":"0","platform":"DNF","platformVersion":"40020101","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"SaAhu/DjPoiTXN3Jofoyfc4dFOE%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477998872","userId":"","userToken":""]

    let refreshParamMoment = ["api":"dynamic.getcurrentlist","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"494183","os":"ios","osVersion":"8.1.2","params%5BpageSize%5D":"20","params%5Bsort%5D":"0","params%5BtagsFilter%5D":"0","platform":"DNF","platformVersion":"40020101","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"SaAhu/DjPoiTXN3Jofoyfc4dFOE%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477998872","userId":"","userToken":""]

    private var tbView:UITableView?
    // 顶部刷新
    let header = MJRefreshNormalHeader()
    // 底部刷新
    let footer = MJRefreshAutoNormalFooter()

    var model: GroundModel? {
        didSet {
            if model != nil {
                tbView?.reloadData()
            }
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        //创建表格
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView!.delegate = self
        tbView!.dataSource = self
        tbView!.registerNib(UINib(nibName: "GroundCell", bundle: nil), forCellReuseIdentifier: "groundCellId")
        tbView!.rowHeight = UITableViewAutomaticDimension
        tbView!.estimatedRowHeight = 200
        // 下拉刷新
        header.setRefreshingTarget(self, refreshingAction: #selector(headerRefresh))
        // 现在的版本要用mj_header
        tbView!.mj_header = header

        // 上拉刷新
        footer.setRefreshingTarget(self, refreshingAction: #selector(footerRefresh))
        tbView!.mj_footer = footer
        addSubview(tbView!)

        //约束
        tbView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // 顶部刷新
    func headerRefresh(){
        tbView?.reloadData()
        // 结束刷新
        tbView!.mj_header.endRefreshing()
    }

    // 底部刷新
    var index = 0
    func footerRefresh(){
        let groundViewController = GroundViewController()
        groundViewController.loadMomentData(groundMomentUrl, params: refreshParamMoment)
        tbView!.mj_footer.endRefreshing()
    }

}

extension GroundHotView: UITableViewDelegate,UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var row = 0
        if model?.data.count>0 {
            row = (model?.data.count)!
        }
        return row
    }


    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("groundCellId", forIndexPath: indexPath) as! GroundCell
        let model1 = model?.data[indexPath.row]
        cell.UserName.text = model1!.user_name

        let dateNow = NSDate()
        let curTime = dateNow.timeIntervalSince1970
        let timePass = curTime - Double(model1!.publish_time!)

        if timePass/3600 >= 24 {
            cell.SendTime.text = "\(Int(timePass)/3600/24)天前"
        }else if timePass/3600 < 24 && timePass/3600 > 1 {
            cell.SendTime.text = "\(Int(timePass)/3600)小时前"
        }else if timePass/3600 < 1 {
            cell.SendTime.text = "\(Int(timePass)/60)分钟前"
        }

        if model1!.service_area_name == nil || model1!.gameBindInfo!.career == nil {
            cell.UserRole.text = ""
        }else if model1!.service_area_name != nil || model1!.gameBindInfo!.career != nil {
            cell.UserRole.text = "\(model1!.service_area_name!)-\((model1!.gameBindInfo!.career!))"
        }
//        cell.UserRole.text = "\(model1!.service_area_name!)-\((model1!.gameBindInfo!.career))"
//        cell.UserRole.text = model1!.gameBindInfo!.career
        cell.Content.text = model1!.content
        cell.NumOfLike.text = "\(model1!.good_count!)"
        cell.NumOfComment.text = "\(model1!.comment_count!)"
        cell.UserImage.kf_setImageWithURL(NSURL(string: model1!.avatar_url!), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        if model1!.gender == 1 {
            cell.UserSex.image = UIImage(named: "动态-头像-性别-男")
        }else if model1!.gender == 2 {
            cell.UserSex.image = UIImage(named: "动态-头像-性别-女")
        }

        if model1?.image_count != 0 {
            cell.SendPicture.kf_setImageWithURL(NSURL(string: (model1!.images?[0].small_url!)!), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            cell.picUrl = model1!.images?[0].url!
//            cell.picture!.kf_setImageWithURL(NSURL(string: (model1!.images?[0].url!)!), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)

//            let picW = (model1!.images?[0].width!)!
//            let picH = (model1!.images?[0].height!)!
//            cell.picView.frame.size = CGSize(width: CGFloat(picW)/2, height: CGFloat(picH)/2)
        }else {
            cell.SendPicture.image = UIImage(named: "albums_default")
            cell.picUrl = "albums_default"
        }


        cell.selectionStyle = .None


        return cell
    }
}




