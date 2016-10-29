//
//  NavigationProtocol.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/27.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

protocol NavigationProtocol: NSObjectProtocol {
    func addTitle(title:String)
    func addBackgroundImage()
}

extension NavigationProtocol where Self:UIViewController{
    func addTitle(title:String){
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 64))
        label.text = title
        label.font = UIFont.boldSystemFontOfSize(20)
        label.textColor = UIColor.whiteColor()
        label.textAlignment = .Center
        navigationItem.titleView = label
    }

    func addBackgroundImage(){
        let img = UIImage(named: "顶部")
        let cgImg = CGImageCreateWithImageInRect(img!.CGImage, CGRect(x: 0, y: 0, width: kScreenW, height: 64))
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 64))
        imageView.image = UIImage(CGImage: cgImg!)
        navigationController?.navigationBar.setBackgroundImage(imageView.image, forBarMetrics: .Default)
    }
    
}
