//
//  RecommendViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/27.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

let screenWidth = UIScreen.mainScreen().bounds.width
let screenHeight = UIScreen.mainScreen().bounds.height


class RecommendViewController: UIViewController, PageTitleViewDelegate, PageContentViewDelegate, NavigationProtocol {

    lazy var titleView: PageTitleView = {
        let titleView = PageTitleView(frame: CGRect(x: 0, y: 0, width: UIScreen.mainScreen().bounds.width, height: 44), titiles: ["最新", "资讯", "娱乐", "活动", "攻略", "视频"])
        return titleView
    }()

    lazy var contentPageView: PageContentView = {
        // 确定所有子视图控制器
        var vc1 = RecommendNewestViewController()
        var vc2 = RecommendActivityViewController()
        var vc3 = RecommendEntertainViewController()
        var vc4 = RecommendInfomationViewController()
        var vc5 = RecommendStrategyViewController()
        var vc6 = RecommendVideoViewController()

        var childVcs: [UIViewController] = [vc1,vc2,vc3,vc4,vc5,vc6]

        let contentView = PageContentView(frame: CGRect(x: 0, y: 44, width: kScreenW, height: kScreenH-44-49), childVcS: childVcs, parentVc: self)

        return contentView
    }()

    var imageView: UIImageView!
    var smallImageView: UIImageView!
    var currentBtn: UIButton!
    var childVcs: [UIViewController] = []



    override func viewDidLoad() {
        super.viewDidLoad()

        self.automaticallyAdjustsScrollViewInsets = false

        configUI()
    }

    func configUI() {
        titleView.delegate = self
        self.view.addSubview(titleView)
        contentPageView.delegate = self
        self.view.addSubview(contentPageView)

        automaticallyAdjustsScrollViewInsets = false

        addTitle("DNF掌游宝")
        addBackgroundImage()
    }
}



extension RecommendViewController {
    func pageContentView(contentView: PageContentView, progress: CGFloat, sourceIndex: Int, targetIndex: Int) {
        titleView.setContentWith(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    func pageTitleView(titleView: PageTitleView, selectedIndex: Int) {
        contentPageView.setCurrentIndex(selectedIndex)
    }
}