//
//  GroundModel.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/1.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class GroundModel: NSObject {
    var code:NSNumber?
    var data:[GroundDataModel]=[]
    var list_size:NSNumber?
    var message:String?

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }
    
}

class GroundDataModel:NSObject {
    var avatar_url:String?
    var certification_describes:String?
    var certification_title:NSNumber?
    var comment_count:NSNumber?
    var content:String?
    var dynamic_topic_relations:NSArray?
    var fans:NSNumber?
    var gameBindInfo:GameBindInfoModel?
    var gender:NSNumber?
    var good_count:NSNumber?
    var newsId:NSNumber?
    var image_count:NSNumber?
    var images:[GroundImagesModel]?
    var in_the_square:NSNumber?
    var is_fav:NSNumber?
    var is_recommend:NSNumber?
    var is_up:NSNumber?
    var publish_time:NSNumber?
    var recommend_reason:NSNumber?
    var service_area_id:NSNumber?
    var service_area_name:String?
    var service_area_type:NSNumber?
    var sort:NSNumber?
    var sticky_type:NSNumber?
    var userLogoFrameId:NSNumber?
    var user_id:NSNumber?
    var user_name:String?
    var videos:NSArray?

    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "id"{
            newsId = value as? NSNumber
        }
        if key == "gameBindInfo" {
            gameBindInfo = GameBindInfoModel()
            gameBindInfo?.setValuesForKeysWithDictionary(value as! [String:AnyObject])
        }
        if key == "images" {
            images = [GroundImagesModel]()
            for image in images! {
                let dic = value as! [String:AnyObject]
                image.height = dic["height"]! as? NSNumber
                image.width = dic["width"]! as? NSNumber
                image.ImageId = dic["id"]! as? NSNumber
                image.small_url = dic["small_url"] as? String
                image.url = dic["url"] as? String
                images?.append(image)
            }

//              let dic = value as! [String:AnyObject]
//              image.height = dic["height"]! as? NSNumber



//            for dic in images! {
//                dic.setValuesForKeysWithDictionary(value!["images"] as! [String:AnyObject])
//                images?.append(dic)
//            }


//            let images = data["images"] as! [AnyObject]
//            for image in images {
//                let model2 = GroundImagesModel()
//                model2.setValuesForKeysWithDictionary(image as! [String : AnyObject])
//                model1.images?.append(model2)
        }
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }

}

class GameBindInfoModel:NSObject {
    var career: String?

    
    
    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }
}

class GroundImagesModel: NSObject {
    var height:NSNumber?
    var ImageId:NSNumber?
    var small_url:String?
    var url:String?
    var width:NSNumber?

    override func setValue(value: AnyObject?, forKey key: String) {
        super.setValue(value, forKey: key)
        if key == "id"{
            ImageId = value as? NSNumber
        }
    }

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }
}


