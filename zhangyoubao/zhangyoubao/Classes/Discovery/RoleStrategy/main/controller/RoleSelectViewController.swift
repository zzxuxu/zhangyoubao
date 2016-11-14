//
//  RoleSelectViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/9.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class RoleSelectViewController: BaseBarViewController,NavigationProtocol,UITableViewDelegate,UITableViewDataSource {

    var tableView:UITableView!
    var dataArray:[RolesModel]=[]
    var isCloseArray:[Bool]=[]//记录每一组是否合上了
    var titleImgs = ["l_dlzy","l_mqs","l_gjs_nan","l_gjs_nv","l_gdj_nan","l_gdj_nv","l_sqs_nan","l_sqs_nv","l_mfs_nan","l_mfs_nv","l_szz","l_aysz","l_shz_nv"]
    var lastTap = -1

    override func viewDidLoad() {
        super.viewDidLoad( )

        loadData()
        configUI()

    }

    func loadData() {

        let jsonString = NSBundle.mainBundle().pathForResource("Roles", ofType: "json")
        let data = NSData(contentsOfFile: jsonString!)
        let array = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! [AnyObject]

        for dic in array {
            let model = RolesModel()
            model.name = dic["name"] as? String
            model.pic = dic["pic"] as? String
            let data1 = dic["data"] as! [AnyObject]
            for dic in data1 {
                let model1 = RoleDataModel()
                model1.image = dic["image"] as? String
                model1.roleName = dic["roleName"] as? String
                
                model.data.append(model1)
            }
            isCloseArray.append(true)
            dataArray.append(model)

        }
//        print(dataArray)

//        tableView.reloadData()
    }

    func configUI() {
        addTitle("选择职业")
        addBackgroundImage()
        addLeftBtn()
        automaticallyAdjustsScrollViewInsets=false
        tableView=UITableView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: kScreenH-64), style: .Plain)
        tableView.delegate=self
        tableView.dataSource=self
        tableView.registerNib(UINib(nibName: "RoleSelectCell", bundle: nil), forCellReuseIdentifier: "roleSelectCellId")
        view.addSubview(tableView)
    }

    func addLeftBtn(){
        let btn = UIButton(frame: CGRectMake(0,0,64,31))
        btn.setTitle("       ", forState: .Normal)
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

}

//MARK: UITableView代理

extension RoleSelectViewController {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 13
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isCloseArray[section] {
            return 0
        }
        return 1
    }

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 59
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view=UIView(frame: CGRectZero)
        let image = UIImage(named: titleImgs[section])
        view.layer.contents = image?.CGImage
        view.tag=100+section

        let tap=UITapGestureRecognizer(target: self, action: #selector(tapGestureRecognizer(_:)))
        view.addGestureRecognizer(tap)
        return view
    }

    func tapGestureRecognizer(tap:UITapGestureRecognizer){


        if lastTap >= 0 {
            isCloseArray[lastTap] = !isCloseArray[lastTap]
            tableView.reloadSections(NSIndexSet(index: lastTap), withRowAnimation: .Fade)
        }

//        print(lastTap)
//        print(tap.view!.tag-100)
//        print("=========")

        isCloseArray[tap.view!.tag-100] = !isCloseArray[tap.view!.tag-100]

        tableView.reloadSections(NSIndexSet(index: tap.view!.tag-100), withRowAnimation: .Fade)

        lastTap = tap.view!.tag-100

//        print(lastTap)
//        print(tap.view!.tag-100)
//        print("=========")



    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("roleSelectCellId", forIndexPath: indexPath) as! RoleSelectCell
        let model = dataArray[indexPath.section]
        cell.roleImage1.image = UIImage(named: model.data[0].image!)
        cell.roleImage2.image = UIImage(named: model.data[1].image!)
        if model.data.count>2{
            cell.roleImage3.image = UIImage(named: model.data[2].image!)
            cell.roleImage4.image = UIImage(named: model.data[3].image!)
        }else {
            cell.roleImage3.image = UIImage(named: "whiteBg")
            cell.roleImage4.image = UIImage(named: "whiteBg")
        }

        cell.roleName1.text = model.data[0].roleName
        cell.roleName2.text = model.data[1].roleName
        if model.data.count>2{
            cell.roleName3.text = model.data[2].roleName
            cell.roleName4.text = model.data[3].roleName
        }else {
            cell.roleName3.text = ""
            cell.roleName4.text = ""
        }

        cell.selectionStyle = .None

        let tap=UITapGestureRecognizer(target: self, action: #selector(g(_:)))
        cell.roleImage1.addGestureRecognizer(tap)

        return cell
    }

    func g(cell: UITableViewCell) {
        print(cell.imageView)
    }

}





