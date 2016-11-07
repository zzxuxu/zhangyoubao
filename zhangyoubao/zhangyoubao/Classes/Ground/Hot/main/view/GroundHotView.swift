//
//  GroundhotView.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/3.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class GroundHotView: UIView {

    private var tbView:UITableView?


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
        addSubview(tbView!)

        //约束
        tbView?.snp_makeConstraints(closure: { (make) in
            make.edges.equalTo(self)
        })

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        cell.SendTime.text = "\(model1!.publish_time!)"

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
            cell.SendPicture.kf_setImageWithURL(NSURL(string: (model1!.images?[0].url!)!), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)

//            let picW = (model1!.images?[0].width!)!
//            let picH = (model1!.images?[0].height!)!
//            cell.picView.frame.size = CGSize(width: CGFloat(picW)/2, height: CGFloat(picH)/2)
        }


        cell.selectionStyle = .None


        return cell
    }
}




