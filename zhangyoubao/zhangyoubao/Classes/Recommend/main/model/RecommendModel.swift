//
//  RecommendModel.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/27.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class RecommendModel: NSObject {

    var code:NSNumber?
    var data:[DataModel]=[]
    var list_size:NSNumber?
    var message:String?

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {
    }

}

class DataModel:NSObject {

    var avatar_url:String?
    var certification_describes:String?
    var certification_title:NSNumber?
    var comment_count:NSNumber?
    var content:String?
    var create_time:NSNumber?
    var down_count:NSNumber?
    var essence_type:NSNumber?
    var good_count:NSNumber?
    var has_video:NSNumber?
    var id:NSNumber?
    var image_count:NSNumber?
    var image_urls:NSArray?
    var is_down:NSNumber?
    var is_editor:NSNumber?
    var is_fav:NSNumber?
    var is_lock:NSNumber?
    var is_up:NSNumber?
    var post_id:NSNumber?
    var publish_platform:NSNumber?
    var publish_time:NSNumber?
    var recommend_banner_covers:NSArray?
    var recommend_covers:NSArray?
    var recommend_time:NSNumber?
    var status:NSNumber?
    var sticky_type:NSNumber?
    var title:String?
    var title_long:String?
    var type:NSNumber?
    var update_time:NSNumber?
    var user_id:NSNumber?
    var user_name:String?
    var videos:[VideoModel]=[]

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }
}

class VideoModel:NSObject {

    var __PHP_Incomplete_Class_Name:String?
    var height:NSNumber?
    var image_url:String?
    var source_site:String?
    var source_type:String?
    var video_length:NSNumber?
    var width:NSNumber?

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }
}



