//
//  MessageViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class MessageViewController: BaseViewController, NavigationProtocol {

    private var scrollView: UIScrollView?

    private var messageView: MessageView?

    private var friendView: FriendView?

    private var segCtrl: UISegmentedControl?

    private var segmentTitles = ["消息","好友"]

    override func viewDidLoad() {
        super.viewDidLoad()

        createHomePage()
        addSegment(segmentTitles)
        addBackgroundImage()

        // Do any additional setup after loading the view.
    }

    func createHomePage() {

        scrollView = UIScrollView()
        scrollView!.pagingEnabled = true
        scrollView?.delegate = self
        view.addSubview(scrollView!)

        scrollView!.snp_makeConstraints { (make) in
            make.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 49, 0))
        }

        //容器视图
        let containerView = UIView.createView()
        scrollView!.addSubview(containerView)
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView!)
            make.height.equalTo(scrollView!)
        }

        //上一次的子视图
        //        let lastView: UIView? = nil

        //添加子视图
        //1.消息视图
        messageView = MessageView()
//        messageView?.backgroundColor = UIColor.yellowColor()
        containerView.addSubview(messageView!)
        messageView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.left.equalTo(containerView)
            make.width.equalTo(kScreenW)
        })

        //2.好友视图
        friendView = FriendView()
//        friendView?.backgroundColor = UIColor.blueColor()
        containerView.addSubview(friendView!)
        friendView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(kScreenW)
            make.left.equalTo((messageView?.snp_right)!)
        })

        //修改容器视图的大小
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(friendView!)
        }
        
    }

    func addSegment(titles:[String]){
        segCtrl = UISegmentedControl(items: titles)
        segCtrl!.frame = CGRect(x: 0, y: 0, width: 120, height: 30)
        navigationItem.titleView = segCtrl
        segCtrl!.selectedSegmentIndex = 0
        segCtrl!.tintColor = UIColor.whiteColor()
        segCtrl!.addTarget(self, action: #selector(segmentClick(_:)), forControlEvents: .ValueChanged)
    }

    func segmentClick(sgc:UISegmentedControl){
        switch sgc.selectedSegmentIndex {
        case 0:
            UIView.animateWithDuration(0.25, animations: {
                self.scrollView?.contentOffset = CGPointMake(0, 0)
            })

        case 1:
            UIView.animateWithDuration(0.25, animations: {
                self.scrollView?.contentOffset = CGPointMake(kScreenW, 0)
            })

        default:
            return
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

//MARK:UIScrollView的代理
extension MessageViewController:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/scrollView.bounds.width
        segCtrl?.selectedSegmentIndex = Int(index)
    }


}




