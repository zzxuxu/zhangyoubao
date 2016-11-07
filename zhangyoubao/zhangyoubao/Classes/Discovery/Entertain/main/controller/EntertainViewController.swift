//
//  EntertainViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/11/1.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class EntertainViewController: BaseBarViewController, NavigationProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        loadData()

    }

    func loadData() {

    }

    func configUI() {
        addTitle("周边娱乐")
        addBackgroundImage()
        addLeftBtn()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
}
