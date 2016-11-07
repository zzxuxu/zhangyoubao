//
//  GroundCell.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/1.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import Kingfisher

class GroundCell: UITableViewCell {

    @IBOutlet weak var UserImage: UIImageView!

    @IBOutlet weak var UserName: UILabel!

    @IBOutlet weak var UserSex: UIImageView!

    @IBOutlet weak var SendTime: UILabel!

    @IBOutlet weak var UserRole: UILabel!

    @IBOutlet weak var Content: UILabel!

    @IBOutlet weak var picView: UIView!
    
    @IBOutlet weak var SendPicture: UIImageView!

    @IBOutlet weak var NumOfLike: UILabel!

    @IBOutlet weak var NumOfComment: UILabel!

    @IBAction func ClickBtn(sender: UIButton) {
    }

    var picUrl: String?

    var picture: UIImageView?

    var zoomView: YSZoomView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

        UserImage.layer.cornerRadius = 20
        UserImage.layer.masksToBounds = true
        SendPicture.userInteractionEnabled = true
        SendPicture.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapClick(_:))))

    }

    func tapClick(tap: UITapGestureRecognizer) {
        if zoomView == nil {
            let frame = UIScreen.mainScreen().bounds
            zoomView = YSZoomView(frame: frame)
        }
        if zoomView?.superview == nil {
            // 将windowLevel改成UIWindowLevelStatusBar
            UIApplication.sharedApplication().keyWindow?.windowLevel = UIWindowLevelStatusBar
            UIApplication.sharedApplication().keyWindow?.addSubview(zoomView!)
        }
        // 将坐标转化成keywindow坐标系下的坐标
        let imageViewFrame = SendPicture.convertRect(self.SendPicture.frame, toView: UIApplication.sharedApplication().keyWindow)
        zoomView?.originFrame = imageViewFrame
        if picUrl == "albums_default"{
            zoomView?.image = UIImage(named: picUrl!)
        }else {
            zoomView?.image = UIImage(data: NSData(contentsOfURL: NSURL(string: picUrl!)!)!)
        }
        print(picUrl)
        zoomView?.show()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
