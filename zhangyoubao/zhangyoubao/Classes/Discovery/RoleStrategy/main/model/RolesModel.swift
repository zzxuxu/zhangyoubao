//
//  RolesModel.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/9.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class RolesModel: NSObject {

    var data: [RoleDataModel] = []
    var name: String?
    var pic: String?

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }

}

class RoleDataModel: NSObject {
    var image: String?
    var roleName: String?

    override func setValue(value: AnyObject?, forUndefinedKey key: String) {

    }
}
