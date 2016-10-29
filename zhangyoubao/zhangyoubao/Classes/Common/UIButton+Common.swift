//
//  UIButton+Common.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {

    class func createBtn(title: String?, bgImageName: String?, highlightImageName:String?, selectImageName:String?, target:AnyObject?, action:Selector) -> UIButton {

        let btn = UIButton(type: .Custom)

        if let tmpTitle = title {
            btn.setTitle(tmpTitle, forState: .Normal)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            btn.setTitleColor(UIColor.yellowColor(), forState: .Selected)
            btn.titleLabel?.font = UIFont.systemFontOfSize(10)
        }

        if let tmpBgimageName = bgImageName {
            btn.setImage(UIImage(named: tmpBgimageName), forState: .Normal)
        }

        if let tmpHighlightName = highlightImageName {
            btn.setImage(UIImage(named: tmpHighlightName), forState: .Highlighted)
        }

        if let tmpSelectName = selectImageName {
            btn.setImage(UIImage(named: tmpSelectName), forState: .Selected)
        }

        if target != nil && action != nil {
            btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        }
        
        return btn
        
    }
    
}