//
//  RoleStrategyViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/31.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

class RoleStrategyViewController: BaseBarViewController, NavigationProtocol {

    var currentBtn:UIButton!//记录当前按钮

    private var topView: UIView!
    private var roleImage: UIImageView!

    private var nameLable: UILabel!
    private var attackLabel: UILabel!
    private var clothesLabel: UILabel!
    private var weaponLabel: UILabel!

    private let titles = ["攻略","技能","装备","介绍"]

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        loadData()

    }

    func loadData() {

    }

    func configUI() {
        addTitle("职业攻略")
        addBackgroundImage()
        addLeftBtn()
        addRightBtn()

        topView = UIView.createView()
        let image = UIImage(named: "750x220bg.png")
        topView.layer.contents = image?.CGImage

        view.addSubview(topView)

        topView.snp_makeConstraints { (make) in
            make.left.top.right.equalTo(self.view)
            make.height.equalTo(110)
        }

        roleImage = UIImageView(image: UIImage(named: "kzsn_intro"))
        topView.addSubview(roleImage)
        roleImage.snp_makeConstraints { (make) in
            make.left.top.equalTo(20)
            make.height.width.equalTo(70)
        }

        nameLable = UILabel(frame: CGRectZero)
        nameLable.text = "狂战士"
        nameLable.textColor = UIColor.orangeColor()
        nameLable.font = UIFont.systemFontOfSize(17)
        topView.addSubview(nameLable)
        nameLable.snp_makeConstraints { (make) in
            make.top.equalTo(20)
            make.left.equalTo(roleImage.snp_right).offset(20)
            make.height.equalTo(17)
        }

        attackLabel = UILabel(frame: CGRectZero)
        attackLabel.text = "攻击类型:物理型"
        attackLabel.textColor = UIColor.whiteColor()
        attackLabel.font = UIFont.systemFontOfSize(13)
        topView.addSubview(attackLabel)
        attackLabel.snp_makeConstraints { (make) in
            make.top.equalTo(nameLable.snp_bottom).offset(3)
            make.left.equalTo(roleImage.snp_right).offset(20)
            make.height.equalTo(15)
        }

        clothesLabel = UILabel(frame: CGRectZero)
        clothesLabel.text = "防具精通: 重甲"
        clothesLabel.textColor = UIColor.whiteColor()
        clothesLabel.font = UIFont.systemFontOfSize(13)
        topView.addSubview(clothesLabel)
        clothesLabel.snp_makeConstraints { (make) in
            make.top.equalTo(attackLabel.snp_bottom).offset(3)
            make.left.equalTo(roleImage.snp_right).offset(20)
            make.height.equalTo(15)
        }

        weaponLabel = UILabel(frame: CGRectZero)
        weaponLabel.text = "精通武器: 巨剑/太刀"
        weaponLabel.textColor = UIColor.whiteColor()
        weaponLabel.font = UIFont.systemFontOfSize(13)
        topView.addSubview(weaponLabel)
        weaponLabel.snp_makeConstraints { (make) in
            make.top.equalTo(clothesLabel.snp_bottom).offset(3)
            make.left.equalTo(roleImage.snp_right).offset(20)
            make.height.equalTo(15)
        }

        let titleView: UIView!
        titleView = UIView(frame: CGRectMake(0, 110, kScreenW, 40))
//        titleView.backgroundColor = UIColor(patternImage: UIImage(named: "titleBg")!)
        let imageView = UIImageView(frame: CGRectMake(0, 0, kScreenW, 40))
        imageView.image = UIImage(named: "titleBg")
        titleView.addSubview(imageView)
        view.addSubview(titleView)

        for i in 0..<4 {
            let btn = UIButton(frame: CGRectMake(kScreenW/4*CGFloat(i), 0, kScreenW/4, 40))
            btn.setTitle(titles[i], forState: .Normal)
            btn.titleLabel?.font = UIFont.systemFontOfSize(15)
            btn.setTitleColor(UIColor.grayColor(), forState: .Normal)
            btn.tag = 100 + i
            btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
            titleView.addSubview(btn)

            if i == 0 {
                btn.selected = true
                btn.userInteractionEnabled = false
                currentBtn = btn
                btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
                btn.titleLabel!.font = UIFont.systemFontOfSize(16)
            }

        }

    }

    func clickBtn(btn: UIButton) {
        btn.setTitleColor(UIColor.orangeColor(), forState: .Normal)
        btn.titleLabel!.font = UIFont.systemFontOfSize(16)
        let index = btn.tag-100
        currentBtn.selected = false
        currentBtn.userInteractionEnabled = true
        currentBtn.titleLabel?.font = UIFont.systemFontOfSize(15)
        currentBtn.setTitleColor(UIColor.grayColor(), forState: .Normal)
        btn.selected = true
        btn.userInteractionEnabled = false
        currentBtn = btn
        print(index)
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

    func addRightBtn(){
        let btn = UIButton(frame: CGRectMake(0,0,100,31))
        btn.setTitle("       切换职业", forState: .Normal)
        btn.titleLabel?.font = UIFont.systemFontOfSize(16)
        let rightbtn = UIBarButtonItem(customView: btn)
        navigationItem.rightBarButtonItem = rightbtn
        btn.addTarget(self, action: #selector(btnClickRight), forControlEvents: .TouchUpInside)
    }

    func btnClickRight() {
        navigationController?.pushViewController(RoleSelectViewController(), animated: true)
    }

    func btnClickLeft() {
        navigationController?.popViewControllerAnimated(true)
    }

}
