//
//  SubRecommendViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/29.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import Alamofire

class SubRecommendViewController: BaseBarViewController, NavigationProtocol {

    var webView:UIWebView!
    var newsId: NSNumber?

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        loadData()

    }

    func loadData() {

//        print(newsId!)

        //创建一个url(网址)
        let url = NSURL(string: "http://m.zhangyoubao.com/dnf/detail/"+"\(newsId!)"+"?source=shareout")

//        let url = NSURL(string: "https://www.baidu.com")

//        print(url!)
        //创建请求
        let request = NSURLRequest(URL: url!)
//        print(request)
        //加载请求··················
        webView.loadRequest(request)

    }

    /*
     
     手机

     http://m.zhangyoubao.com/dnf/detail/1774045666?source=shareout
     <NSURLRequest: 0x155db070> { URL: http://m.zhangyoubao.com/dnf/detail/1774045666?source=shareout }
     
     模拟器

     http://m.zhangyoubao.com/dnf/detail/3098857259895998946?source=shareout
     <NSURLRequest: 0x7f9859767440> { URL: http://m.zhangyoubao.com/dnf/detail/3098857259895998946?source=shareout }

     */

    func configUI() {
        addTitle("DNF掌游宝")
        addBackgroundImage()
//        view.backgroundColor = UIColor(red: 226/255.0, green: 223/255.0, blue: 218/255.0, alpha: 1.0)
        addLeftBtn()
        self.automaticallyAdjustsScrollViewInsets = false
        webView = UIWebView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH-64))
        webView.backgroundColor = UIColor(red: 226/255.0, green: 223/255.0, blue: 218/255.0, alpha: 1.0)
        view.addSubview(webView)
        
    }

    func addLeftBtn(){
        let btn = UIButton(frame: CGRectMake(0,0,64,31))
        btn.setTitle("       ", forState: .Normal)
//        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
//        btn.setTitleColor(UIColor.grayColor(), forState: .Highlighted)
//        btn.backgroundColor = UIColor.blueColor()
        btn.setImage(UIImage(named: "返回"), forState: .Normal)
        let leftbtn = UIBarButtonItem(customView: btn)
        navigationItem.leftBarButtonItem = leftbtn
        btn.addTarget(self, action: #selector(btnClickLeft), forControlEvents: .TouchUpInside)
    }

    func btnClickLeft() {
        navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewWillAppear(animated: Bool) {
////        UIImageView *image = (UIImageView *)[self.tabBarController.view viewWithTag:100];
//
//        let imageView = tabBarController.
//        imageView?.hidden = true
//
//    }


}
