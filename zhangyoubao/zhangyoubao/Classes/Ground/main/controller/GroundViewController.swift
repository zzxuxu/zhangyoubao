//
//  GroundViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import Alamofire

class GroundViewController: BaseViewController, NavigationProtocol {

    //滚动视图
    private var scrollView: UIScrollView?
    //热门视图
    private var groundHotView: GroundHotView?
    //此刻视图
    private var groundMomentView: GroundHotView?
    //关注视图
    private var groundFocusView: GroundFocusView?
    //导航上面的选择控件
    private var segCtrl:UISegmentedControl?

    let paramHot = ["api":"dynamic.getsquarehotlist","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"115350","os":"ios","osVersion":"8.1.2","params%5BpageSize%5D":"20","params%5Bsort%5D":"0","params%5BtagsFilter%5D":"0","platform":"DNF","platformVersion":"40020101","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"SaAhu/DjPoiTXN3Jofoyfc4dFOE%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477998872","userId":"","userToken":""]

    let paramMoment = ["api":"dynamic.getcurrentlist","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"494183","os":"ios","osVersion":"8.1.2","params%5BpageSize%5D":"20","params%5Bsort%5D":"0","params%5BtagsFilter%5D":"0","platform":"DNF","platformVersion":"40020101","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"SaAhu/DjPoiTXN3Jofoyfc4dFOE%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477998872","userId":"","userToken":""]

    /*
     api=dynamic.getcurrentlist&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=494183&os=ios&osVersion=8.1.2&params%5BpageSize%5D=20&params%5Bsort%5D=0&params%5BtagsFilter%5D=0&platform=DNF&platformVersion=40020101&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=5%2BjSj14uoTb9lLts1SZmH12hwhM%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1478262387&userId=&userToken=
     */

    let paramFocus = ["api":"dynamic.getsquarerecommendlist","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"115350","os":"ios","osVersion":"8.1.2","params%5BpageSize%5D":"20","params%5Bsort%5D":"0","params%5BtagsFilter%5D":"0","platform":"DNF","platformVersion":"40020101","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"SaAhu/DjPoiTXN3Jofoyfc4dFOE%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477998872","userId":"","userToken":""]

    var hotModel = GroundModel()
    var momentModel = GroundModel()
    var focusModel = GroundModel()

    var segmentTitles = ["热门","此刻","关注"]

    override func viewDidLoad() {
        loadHotData(groundHotUrl, params: paramHot)
        loadMomentData(groundMomentUrl, params: paramMoment)
        loadFocusData(groundFocusUrl, params: paramFocus)

        super.viewDidLoad()
        automaticallyAdjustsScrollViewInsets = false
        createHomePage()
        addSegment(segmentTitles)
        addBackgroundImage()
        view.backgroundColor = UIColor.whiteColor()


    }

    func loadHotData(url:String, params:[String:AnyObject]) {

        Alamofire.request(.POST, url, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                let dic = response.result.value as! [String:AnyObject]
                self.hotModel.code = dic["code"] as? NSNumber
                self.hotModel.list_size = dic["model.list_size"] as? NSNumber
                let data1 = dic["data"] as! [AnyObject]
                for data in data1 {
                    let model1 = GroundDataModel()
                    model1.setValuesForKeysWithDictionary(data as! [String:AnyObject])
                    let images = data["images"] as! [AnyObject]
                    for image in images {
                        let model2 = GroundImagesModel()
                        model2.setValuesForKeysWithDictionary(image as! [String : AnyObject])
                        model1.images?.append(model2)
                    }
                    let model2 = GameBindInfoModel()
                    model2.career = dic["data"]!["gameBindInfo"] as? String
//                    model1.gameBindInfo?.career = dic["data"]!["gameBindInfo"] as? AnyObject


                    self.hotModel.data.append(model1)
                    self.groundHotView?.model = self.hotModel

                }
//                print(self.model.data[1].images![1].small_url)
//                tableView.reloadData()
            }
        }
        
    }

    func loadMomentData(url:String, params:[String:AnyObject]) {

        Alamofire.request(.POST, url, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                let dic = response.result.value as! [String:AnyObject]
                self.momentModel.code = dic["code"] as? NSNumber
                self.momentModel.list_size = dic["model.list_size"] as? NSNumber
                let data1 = dic["data"] as! [AnyObject]
                for data in data1 {
                    let model1 = GroundDataModel()
                    model1.setValuesForKeysWithDictionary(data as! [String:AnyObject])
                    let images = data["images"] as! [AnyObject]
                    for image in images {
                        let model2 = GroundImagesModel()
                        model2.setValuesForKeysWithDictionary(image as! [String : AnyObject])
                        model1.images?.append(model2)
                    }
                    let model2 = GameBindInfoModel()
                    model2.career = dic["data"]!["gameBindInfo"] as? String
                    //                    model1.gameBindInfo?.career = dic["data"]!["gameBindInfo"] as? AnyObject


                    self.momentModel.data.append(model1)
                    self.groundMomentView?.model = self.momentModel

                }
                //                print(self.model.data[1].images![1].small_url)
                //                tableView.reloadData()
            }
        }
        
    }

    func loadFocusData(url:String, params:[String:AnyObject]) {

        Alamofire.request(.POST, url, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseJSON { (response) in
            if response.result.error == nil {
                let dic = response.result.value as! [String:AnyObject]
                self.focusModel.code = dic["code"] as? NSNumber
                self.focusModel.list_size = dic["model.list_size"] as? NSNumber
                let data1 = dic["data"] as! [AnyObject]
                for data in data1 {
                    let model1 = GroundDataModel()
                    model1.setValuesForKeysWithDictionary(data as! [String:AnyObject])
                    let images = data["images"] as! [AnyObject]
                    for image in images {
                        let model2 = GroundImagesModel()
                        model2.setValuesForKeysWithDictionary(image as! [String : AnyObject])
                        model1.images?.append(model2)
                    }
                    let model2 = GameBindInfoModel()
                    model2.career = dic["data"]!["gameBindInfo"] as? String
                    //                    model1.gameBindInfo?.career = dic["data"]!["gameBindInfo"] as? AnyObject


                    self.focusModel.data.append(model1)
                    self.groundFocusView?.model = self.focusModel

                }
                //                print(self.model.data[1].images![1].small_url)
                //                tableView.reloadData()
            }
        }
        
    }



    //创建首页视图
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
        //1.热门视图
        groundHotView = GroundHotView()
        groundHotView?.backgroundColor = UIColor.yellowColor()
        containerView.addSubview(groundHotView!)
        groundHotView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.left.equalTo(containerView)
            make.width.equalTo(kScreenW)
        })

        //2.此刻视图
        groundMomentView = GroundHotView()
        groundMomentView?.backgroundColor = UIColor.blueColor()
        containerView.addSubview(groundMomentView!)
        groundMomentView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(kScreenW)
            make.left.equalTo((groundHotView?.snp_right)!)
        })

        //3.关注视图
        groundFocusView = GroundFocusView()
        groundFocusView?.backgroundColor = UIColor.redColor()
        containerView.addSubview(groundFocusView!)
        groundFocusView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(kScreenW)
            make.left.equalTo((groundMomentView?.snp_right)!)
        })

        //修改容器视图的大小
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(groundFocusView!)
        }
        
    }


    func configUI(tableView:UITableView){
        addSegment(segmentTitles)
        addBackgroundImage()
        view.backgroundColor = UIColor.whiteColor()

    }


//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataArray.count
//    }
//
//    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
//        return 400
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCellWithIdentifier("groundCellId", forIndexPath: indexPath) as! GroundCell
//        let model = dataArray[indexPath.row].data[indexPath.row]
//        cell.UserName.text = model.user_name
//        cell.SendTime.text = "\(model.publish_time!)"
////        cell.UserRole.text = "\(model.service_area_name!)-\((model.gameBindInfo?.career))"
//        cell.Content.text = model.content
//        cell.NumOfLike.text = "\(model.good_count!)"
//        cell.NumOfComment.text = "\(model.comment_count!)"
//        cell.UserImage.kf_setImageWithURL(NSURL(string: model.avatar_url!), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
//        if model.gender == 1 {
//            cell.UserSex.image = UIImage(named: "动态-头像-性别-男")
//        }else if model.gender == 2 {
//            cell.UserSex.image = UIImage(named: "动态-头像-性别-女")
//        }
//        cell.SendPicture.kf_setImageWithURL(NSURL(string: model.avatar_url!), placeholderImage: UIImage(named: "albums_default"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
//
//        return cell
//
//    }
//
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }


    func addSegment(titles:[String]){
        segCtrl = UISegmentedControl(items: titles)
        segCtrl!.frame = CGRect(x: 0, y: 0, width: 200, height: 30)
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

        case 2:
            UIView.animateWithDuration(0.25, animations: {
                self.scrollView?.contentOffset = CGPointMake(2*kScreenW, 0)
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
extension GroundViewController:UIScrollViewDelegate {
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = scrollView.contentOffset.x/scrollView.bounds.width
        segCtrl?.selectedSegmentIndex = Int(index)
    }
    
    
}




