//
//  DiscoveryViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class DiscoveryViewController: BaseViewController,NavigationProtocol {

//    var collectionView:UICollectionView!
    var disImageNames = ["职业攻略","游戏视频","时装模拟","装备词典","查询助手","商城物品","大神直播","游戏剧情","周边娱乐","副本介绍","折扣商城","精品手游"]

    override func viewDidLoad() {
        super.viewDidLoad()
//        loadData()
        configUI()

    }

    func configUI() {
        addTitle("发现")
        addBackgroundImage()
//        automaticallyAdjustsScrollViewInsets = false
        for j in 0..<4 {
            for i in 0..<3 {
                let discoveryView = UIView()
                discoveryView.frame = CGRectMake(CGFloat(i)*(kScreenW/3), CGFloat(j)*((kScreenH-64-49)/4), kScreenW/3, (kScreenH-64-49)/4)
                discoveryView.layer.borderColor = UIColor(red: 188/255.0, green: 187/255.0, blue: 192/255.0, alpha: 1.0).CGColor
                discoveryView.layer.borderWidth = 0.5
                discoveryView.backgroundColor = UIColor(red: 236/255.0, green: 228/255.0, blue: 218/255.0, alpha: 1.0)
                let someImage = UIImageView()
                someImage.frame = CGRectMake(kScreenW/3/3, (kScreenH-64-49)/4/4, kScreenW/3/3, kScreenW/3/3)
//              someImage.snp_makeConstraints(closure: { (make) in
//                  make.top.left.right.equalTo(20)
//                  make.height.equalTo(50)
//              })
                someImage.image = UIImage(named: disImageNames[3*j+i])
                let someLabel = UILabel()
                someLabel.frame = CGRectMake(0, (kScreenH-64-49)/4/4+kScreenW/3/3+7, kScreenW/3, 20)
                someLabel.textAlignment = .Center
                someLabel.text = disImageNames[3*j+i]
                someLabel.font = UIFont.systemFontOfSize(15)
                discoveryView.addSubview(someLabel)
                discoveryView.addSubview(someImage)
                discoveryView.userInteractionEnabled = true
                discoveryView.tag = 3*j+i+100
                let g = UITapGestureRecognizer(target: self, action: #selector(tapImage(_:)))
                discoveryView.addGestureRecognizer(g)
                view.addSubview(discoveryView)

            }
        }

    }

    func tapImage(g:UIGestureRecognizer) {
        let vc1 = RoleStrategyViewController()
        let vc2 = GameVideoController()
        let vc3 = DressingViewController()
        let vc4 = EquipmentViewController()
        let vc5 = SearchViewController()
        let vc6 = ShopViewController()
        let vc7 = LiveViewController()
        let vc8 = StoryViewController()
        let vc9 = EntertainViewController()
        let vc10 = IntroductionViewController()
        let vc11 = DiscountViewController()
        let vc12 = MobileGameViewController()

        var childVcs: [UIViewController] = [vc1,vc2,vc3,vc4,vc5,vc6,vc7,vc8,vc9,vc10,vc11,vc12]
        let num = (g.view?.tag)!-100
        print(num)
        navigationController?.pushViewController(childVcs[num], animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
