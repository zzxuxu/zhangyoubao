//
//  RecommendScrollViewModel.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/27.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

//class RecommendScrollViewModel: NSObject {
//    var code:NSNumber?
//    var data:RecommendDataDataModel?
//    var list_size:NSNumber?
//    var message:String?
//
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//
//    }
//}
//
//class RecommendDataDataModel:NSObject {
//    var is_closable:String?
//    var is_closed:String?
//    var list:[RecommendScrollListViewModel]=[]
//
//    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
//
//    }
//}

class RecommendScrollViewModel:NSObject {
    var scrId:String?
    var image_url:String?
    var redirect_data:String?
    var redirect_type:String?

    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "id"{
            scrId = value as? String
        }
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }

}