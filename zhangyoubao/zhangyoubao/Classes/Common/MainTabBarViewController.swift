//
//  MainTabBarViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    //tabbar的背景
//    private var imageView:UIImageView?
    private var bgView:UIView?

    override func viewDidLoad() {
        super.viewDidLoad()

        createViewControllers()

//        tabBar.hidden = true
//
//        createMyTabBar()
        

    }

    func createMyTabBar(imageNames: Array<String>, titles: Array<String>) {
        bgView = UIView.createView()

        let image = UIImage(named: "底部.png")

        //图片做tabbar背景
        bgView?.layer.contents = image?.CGImage
        view.addSubview(bgView!)

        bgView?.snp_makeConstraints(closure: {[weak self] (make) in
            make.left.right.bottom.equalTo(self!.view)
            make.height.equalTo(49)
            })

//        imageView!.image = UIImage(named: "底部.png")

//        imageView!.snp_makeConstraints {[weak self] (make) in
//            make.left.right.bottom.equalTo(self!.view)
//            make.height.equalTo(49)
//        }

//        imageView!.userInteractionEnabled = true
//        view?.addSubview(imageView!)


        let width = kScreenW/CGFloat(imageNames.count)
        for i in 0..<imageNames.count {
            let selectImage = imageNames[i]+"点击"

            let btn = UIButton.createBtn(nil, bgImageName: imageNames[i], highlightImageName: nil, selectImageName: selectImage, target: self, action: #selector(clickBtn(_:)))
            btn.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 12, right: 0)

            btn.tag = 300+i

            bgView!.addSubview(btn)

            btn.snp_makeConstraints(closure: {[weak self] (make) in
                make.bottom.equalTo(self!.bgView!)
                make.top.equalTo(self!.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
            })

            let titleLabel = UILabel.createLable(titles[i], textAlignment: .Center, font: UIFont.systemFontOfSize(10))
            titleLabel.textColor = UIColor(red: 250/255.0, green: 230/255.0, blue: 210/255.0, alpha: 1.0)
            titleLabel.tag = 400

            btn.addSubview(titleLabel)

            titleLabel.snp_makeConstraints(closure: { (make) in
                make.left.right.bottom.equalTo(btn)
                make.height.equalTo(15)
            })

            //默认选中第一个按钮
            if i == 0 {
                btn.selected = true
                titleLabel.textColor = UIColor(red: 245/255.0, green: 185/255.0, blue: 46/255.0, alpha: 1.0)
            }

        }

    }

    func clickBtn(curBtn: UIButton){
        let index = curBtn.tag - 300

        if selectedIndex != index {
            let lastBtn = bgView?.viewWithTag(300+selectedIndex) as! UIButton

            lastBtn.selected = false
            lastBtn.userInteractionEnabled = true

            let lastLabel = lastBtn.viewWithTag(400)as! UILabel
            lastLabel.textColor = UIColor(red: 250/255.0, green: 230/255.0, blue: 210/255.0, alpha: 1.0)

            curBtn.selected = true
            curBtn.userInteractionEnabled = false

            let curLabel = curBtn.viewWithTag(400) as! UILabel
            curLabel.textColor = UIColor(red: 245/255.0, green: 185/255.0, blue: 46/255.0, alpha: 1.0)

            selectedIndex = index

        }

    }

    //创建视图控制器
    func createViewControllers() {

        //1.从controller.json文件里面读取数据
        let path = NSBundle.mainBundle().pathForResource("Controllers", ofType: "json")

        let data = NSData(contentsOfFile: path!)

        var nameArray = [String]()

        var images = [String]()

        var titles = [String]()

        do {

            let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers)
            if json.isKindOfClass(NSArray) {
                let tmpArray = json as! Array<Dictionary<String,String>>

                for tmpDict in tmpArray {
                    let name = tmpDict["ctrlname"]
                    nameArray.append(name!)
                    let imageName = tmpDict["image"]
                    images.append(imageName!)
                    let titleName = tmpDict["title"]
                    titles.append(titleName!)
                }
            }

        }catch (let error) {
            //捕捉错误信息
            print(error)
        }

        if nameArray.count == 0 {
            nameArray = ["RecommendViewController","DiscoveryViewController","GroundViewController","MessageViewController","ProfileViewController"]
            images = ["首页-推荐","首页-发现","首页-广场","首页-消息","首页-个人"]
            titles = ["推荐","发现","广场","消息","个人"]
        }

        //2.创建视图控制器
        var ctrlArray = Array<UINavigationController>()
        for i in 0..<nameArray.count {
            let name = "zhangyoubao."+nameArray[i]

            let ctrl = NSClassFromString(name) as! UIViewController.Type

            let vc = ctrl.init()
//            vc.title = titles[i]
            let navCtrl = UINavigationController(rootViewController: vc)
            ctrlArray.append(navCtrl)
        }

        viewControllers = ctrlArray

        //3.设置图片和文字
        tabBar.hidden = true

        createMyTabBar(images, titles: titles)


    }

    //显示tabbar
    func showTabBar() {
        UIView.animateWithDuration(0.25) {
            self.bgView?.hidden = false
        }

    }

    //隐藏tabbar
    func hideTabBar() {
        UIView.animateWithDuration(0.25) {
            self.bgView?.hidden = true
        }
    }

    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
