//
//  RecommendViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/27.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

var lastId:String!

class RecommendNewestViewController: BaseViewController,UITableViewDelegate, UITableViewDataSource,ScrollViewProtocol,RefreshProtocol {
    var dataArray:[RecommendModel] = []
    var currentPage = 1
    var scrollArray:[RecommendScrollViewModel] = []
    var tableView:UITableView!
    var scrollView:UIScrollView!


    let params = ["api":"recommend.list","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"442947","os":"ios","osVersion":"8.1.2","params%5BlastId%5D":"0","params%5BtagId%5D":"0","platform":"DNF","platformVersion":"40020001","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"T2whfm4y3Pksw2Jg1YCi5vKgpa0%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477293257","userId":"","userToken":""]

    let RefreshParams = ["api":"recommend.list","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"653513","os":"ios","osVersion":"8.1.2","params%5BlastId%5D":"3099714329429651295","params%5BtagId%5D":"0","platform":"DNF","platformVersion":"40020001","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"2wy9mVqlKqPHqYj7qRYjD10xeKQ%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477293257","userId":"","userToken":""]

    //=&=&=&=&=&=&=&=&=&=&=&=&=&secretVersion=v1.0&sign=sfsfsfsfs&time=1478089128&userId=&userToken=


    //"params%5BlastId%5D":"\(lastId)"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadScrollViewData()
        loadData(params)
        configUI()

        scrollView=UIScrollView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 150))
//        scrollView.backgroundColor=UIColor.yellowColor()

        addScrollView(scrollView)
        scrollAddImage(scrollView)

        tableView.tableHeaderView?.addSubview(scrollView)

        
    }

    func loadScrollViewData() {
        let jsonString = NSBundle.mainBundle().pathForResource("ScrollView", ofType: "json")

        let data = NSData(contentsOfFile: jsonString!)

        let dic = (try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers)) as! [String:AnyObject]
        let array = dic["data"]!["list"] as! [AnyObject]
        let model = RecommendScrollViewModel()
        for dic in array {
            model.image_url = dic["image_url"] as? String

            self.scrollArray.append(model)
        }
        //        print(self.scrollArray[0].image_url)
        //        self.tableView.reloadData()
    }

    func loadData(parameters: [String:AnyObject]) {

        //3099529079044942259
        //3099549125377379817
        //3099549125377379817
        //params%5BlastId%5D=3099691652703177058


        Alamofire.request(.POST, RecUrl, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            self.tableView.mj_header.endRefreshing()
            self.tableView.mj_footer.endRefreshing()
            if self.currentPage == 1{
                self.dataArray.removeAll()
            }
            if response.result.error == nil {
//                print(response.result.value)
                let dic = response.result.value as! [String:AnyObject]
                    let model = RecommendModel()
                    model.code = dic["code"] as? NSNumber
                    model.list_size = dic["model.list_size"] as? NSNumber
                    let data1 = dic["data"] as! [AnyObject]
                    for data in data1 {
                        let model1 = DataModel()
                        model1.setValuesForKeysWithDictionary(data as! [String:AnyObject])
                        model.data.append(model1)

                    self.dataArray.append(model)

                }
//                print(self.dataArray[0].data[0].newsId)
                self.tableView.reloadData()
                lastId = String((self.dataArray.last?.data.last?.newsId)!)
                print(lastId)
            }
        }

    }


    func configUI() {
        view.backgroundColor = UIColor(red: 226/255.0, green: 223/255.0, blue: 218/255.0, alpha: 1.0)
        tableView=UITableView(frame: CGRectMake(0, 0, kScreenW, kScreenH-64-44-49), style: .Plain)
        view.addSubview(tableView)
        addheaderView(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        tableView.registerNib(UINib(nibName: "RecommendCell", bundle: nil), forCellReuseIdentifier: "recommendCellId")

//        print(lastId)
        addRefresh({[unowned self] in
//            self.currentPage = 1
            self.loadData(self.params)
            }, footer: {[unowned self] in

//                self.currentPage += 1
                self.loadData(self.params)
            }, tableView: tableView)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

//    override func viewWillAppear(animated: Bool) {
//        tabBarController?.tabBar.hidden = false
//    }

    // MARK: - Table view data source

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dataArray.count
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("recommendCellId", forIndexPath: indexPath) as! RecommendCell
        let model = dataArray[indexPath.row]
        cell.appTitle.text = model.data[indexPath.row].title
        cell.appTime.text = "\((model.data[indexPath.row].create_time)!)"
        cell.appComment.text = "\((model.data[indexPath.row].comment_count)!)评"
        cell.appVideoPic.image = UIImage(named: "推荐-视频图标")
        let url = model.data[indexPath.row].recommend_covers![0]
        cell.appImage.kf_setImageWithURL(NSURL(string: url as! String), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        if model.data[indexPath.row].has_video == 1 {
            cell.appVideoPic.hidden = false
            cell.appVideo.hidden = false
        }else if model.data[indexPath.row].has_video == 0 {
            cell.appVideoPic.hidden = true
            cell.appVideo.hidden = true
        }


        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        let model = dataArray[indexPath.row]
        let vc = SubRecommendViewController()
        vc.newsId = model.data[indexPath.row].newsId!
//        print(model.data[indexPath.row].newsId!)
//        print("=======")
//        print(Int(model.data[indexPath.row].newsId!))
//        print("-------")
//        print(vc.newsId)
        navigationController?.pushViewController(vc, animated: true)
    }

    func addheaderView(tabelView:UITableView){
        let headerView=UIView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 150))
        headerView.backgroundColor=UIColor.purpleColor()
        tabelView.tableHeaderView=headerView
        let label=UILabel()
        label.backgroundColor=UIColor.grayColor()
        headerView.addSubview(label)
//        label.text="  编辑精选"
        label.textColor=UIColor(red: 132/255, green: 198/255, blue: 232/255, alpha: 1.0)
        label.snp_makeConstraints { (make) in
            make.bottom.width.left.equalTo(headerView)
            make.top.equalTo(headerView).offset(20)
        }
    }

    func scrollAddImage(scrollView:UIScrollView){

        for i in 0..<scrollArray.count{
            let imageView=UIImageView(frame: CGRect(x: 0+CGFloat(i)*kScreenW, y: 0, width: kScreenW, height: 150))
            imageView.kf_setImageWithURL(NSURL(string: scrollArray[i].image_url!)!)
            scrollView.addSubview(imageView)
        }
        scrollView.contentSize=CGSize(width: (kScreenW)*CGFloat((scrollArray.count)), height: 150)
        scrollView.bounces = false
    }
}




