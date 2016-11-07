//
//  Const.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

//定义一些常量和接口

//屏幕的宽度和高度
let kScreenW = UIScreen.mainScreen().bounds.size.width

let kScreenH = UIScreen.mainScreen().bounds.size.height


//接口 


//推荐——所有滚动广告

public let ScrUrl = "http://dnf.service.zhangyoubao.com/service/rest?api=ad.list&game=dnf&platformVersion=40020101&userid="

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=ad.list&game=dnf&platformVersion=40020101&userid=

//请求头

/*
 api=ad.list&apiVersion=v1&deviceId=e1BQ%252BYSBw%252BLg%252BHBUe7lyIsQDSYUigpwm3%252BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%252BdPIH0SUIagSjRz1bUg%253D%253D&game=dnf&nonce=528461&os=ios&osVersion=8.1.2&params%255Bposition%255D=topic_top&platform=DNF&platformVersion=40020101&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=%252F4fHZ%252BghQpcboDc7TtG26JCnC6U%253D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477386925&userId=&userToken=
 
 api=ad.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=528461&os=ios&osVersion=8.1.2&params%5Bposition%5D=topic_top&platform=DNF&platformVersion=40020101&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=%2F4fHZ%2BghQpcboDc7TtG26JCnC6U%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477386925&userId=&userToken=
 
 */


//api=ad.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=528461&os=ios&osVersion=8.1.2&params%5Bposition%5D=topic_top&platform=DNF&platformVersion=40020101&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=%2F4fHZ%2BghQpcboDc7TtG26JCnC6U%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477386925&userId=&userToken=

//["api":"ad.list","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"561315","os":"ios","osVersion":"8.1.2","params%5Bposition%5D":"topic_top","platform":"DNF","platformVersion":"40020001","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"GrVO6fPg%2Fpd2dQIUyTEXHX02GMw%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477293257","userId":"","userToken":""]


//推荐——最新

public let RecUrl = "http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid="

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid=

//请求头
//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=442947&os=ios&osVersion=8.1.2&params%5BlastId%5D=0&params%5BtagId%5D=0&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=T2whfm4y3Pksw2Jg1YCi5vKgpa0%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477293257&userId=&userToken=

//["api":"recommend.list","apiVersion":"v1","deviceId":"e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D","game":"dnf","nonce":"442947","os":"ios","osVersion":"8.1.2","params%5BlastId%5D":"0","params%5BtagId%5D":"0","platform":"DNF","platformVersion":"40020001","secretId":"AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA","secretSignature":"T2whfm4y3Pksw2Jg1YCi5vKgpa0%3D","secretVersion":"v1.0","sign":"sfsfsfsfs","time":"1477293257","userId":"","userToken":""]

//推荐——资讯

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid=

//请求头
//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=692903&os=ios&osVersion=8.1.2&params%5BlastId%5D=0&params%5BtagId%5D=51&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=7MpjkJ4P%2FcBsgxWeMOv0m0uw%2Bq4%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477293739&userId=&userToken=

//推荐——娱乐

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid=

//请求头
//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=190776&os=ios&osVersion=8.1.2&params%5BlastId%5D=0&params%5BtagId%5D=215&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=31w6vYuVIoVnNjiF91tYM5P1zfs%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477293985&userId=&userToken=

//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=260891&os=ios&osVersion=8.1.2&params%5BlastId%5D=3097724802884815259&params%5BtagId%5D=215&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=jj7ScHDHCJ7mnijM5GyMXAWxpAY%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477294446&userId=&userToken=

//推荐——活动

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid=

//请求头
//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=979085&os=ios&osVersion=8.1.2&params%5BlastId%5D=0&params%5BtagId%5D=49&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=BVCv0wmMnVPT5CsF7g%2B%2F7er6Aew%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477294095&userId=&userToken=

//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=576430&os=ios&osVersion=8.1.2&params%5BlastId%5D=3093070150448425079&params%5BtagId%5D=49&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=zWA2rjPiz3sD6rX6RJNJ5I6vxOk%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477294167&userId=&userToken=


//推荐——攻略

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid=

//请求头
//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=851757&os=ios&osVersion=8.1.2&params%5BlastId%5D=0&params%5BtagId%5D=48&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=RMY7Rg4q1NqUaqkaDk%2BV4j4lSO0%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477294625&userId=&userToken=

//推荐——视频

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=recommend.list&game=dnf&platformVersion=40020001&userid=

//请求头
//api=recommend.list&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=735605&os=ios&osVersion=8.1.2&params%5BlastId%5D=0&params%5BtagId%5D=495&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=AbBJvcSF8rglBu8Q2x8rPGCXwQc%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477294802&userId=&userToken=


//推荐——subView

//URL	http://dnf.service.zhangyoubao.com/service/rest?api=news.getbyid&game=dnf&platformVersion=40020101&userid=

public let SubUrl = "http://dnf.service.zhangyoubao.com/service/rest?api=news.getbyid&game=dnf&platformVersion=40020101&userid="


//发现——职业攻略

//职业攻略——阿修罗

//攻略
//URL	http://dnf.service.zhangyoubao.com/service/rest?api=topic.playlistwithimage&game=dnf&platformVersion=40020001&userid=

//请求头
//api=topic.playlistwithimage&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=636724&os=ios&osVersion=8.1.2&params%5Bid%5D=10019&params%5BlastSort%5D=0&params%5Btype%5D=10&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=36igBlv%2BtTqb0s2DTMXJH5Gd82c%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477294941&userId=&userToken=

//职业攻略——红狗

//攻略
//URL	http://dnf.service.zhangyoubao.com/service/rest?api=topic.playlistwithimage&game=dnf&platformVersion=40020001&userid=

//请求头
//api=topic.playlistwithimage&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=910732&os=ios&osVersion=8.1.2&params%5Bid%5D=10017&params%5BlastSort%5D=0&params%5Btype%5D=10&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=dkr0PVWuA7KC2PtJql8wB3GGm5c%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477295059&userId=&userToken=


//广场

//广场——热门 上面
//URL	http://dnf.service.zhangyoubao.com/service/rest?api=dynamic.getfrontdynamictopic&game=dnf&platformVersion=40020001&userid=

//请求头
//api=dynamic.getfrontdynamictopic&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=278143&os=ios&osVersion=8.1.2&params%5BdynamicTopicId%5D=&params%5Bsort%5D=&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=zAMIpfglDC%2B1WrdDTwhlexls1ek%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477300166&userId=&userToken=

//广场——热门 内容
public let groundHotUrl = "http://dnf.service.zhangyoubao.com/service/rest?api=dynamic.getsquarehotlist&game=dnf&platformVersion=40020101&userid="


public let groundMomentUrl = "http://dnf.service.zhangyoubao.com/service/rest?api=dynamic.getcurrentlist&game=dnf&platformVersion=40020101&userid="

public let groundFocusUrl = "http://dnf.service.zhangyoubao.com/service/rest?api=dynamic.getsquarerecommendlist&game=dnf&platformVersion=40020101&userid="

//请求头
//api=dynamic.getsquarehotlist&apiVersion=v1&deviceId=e1BQ%2BYSBw%2BLg%2BHBUe7lyIsQDSYUigpwm3%2BpBPw5ETHGSvCF4KLfAGMd1esFsKbLHA3x%2BdPIH0SUIagSjRz1bUg%3D%3D&game=dnf&nonce=709095&os=ios&osVersion=8.1.2&params%5BpageSize%5D=20&params%5Bsort%5D=0&params%5BtagsFilter%5D=0&platform=DNF&platformVersion=40020001&secretId=AKIDz8krbsJ5yKBZQpn74WFkmLPx3gnPhESA&secretSignature=JQsOzJE5qNfOH6SetyrhromHThY%3D&secretVersion=v1.0&sign=sfsfsfsfs&time=1477300167&userId=&userToken=







