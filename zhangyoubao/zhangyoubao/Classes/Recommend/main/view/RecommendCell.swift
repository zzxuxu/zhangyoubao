//
//  RecommendCell.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/25.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class RecommendCell: UITableViewCell {


    @IBOutlet weak var appImage: UIImageView!

    @IBOutlet weak var appVideoPic: UIImageView!
    
    @IBOutlet weak var appTitle: UILabel!

    @IBOutlet weak var appVideo: UILabel!

    @IBOutlet weak var appTime: UILabel!

    @IBOutlet weak var appComment: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }



    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
