//
//  RoleSelectCell.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/9.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class RoleSelectCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var roleImage1: UIImageView!

    @IBOutlet weak var roleImage2: UIImageView!

    @IBOutlet weak var roleImage3: UIImageView!

    @IBOutlet weak var roleImage4: UIImageView!

    @IBOutlet weak var roleName1: UILabel!

    @IBOutlet weak var roleName2: UILabel!

    @IBOutlet weak var roleName3: UILabel!

    @IBOutlet weak var roleName4: UILabel!

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
