//
//  ZYBDownload.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/24.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit
import Alamofire

protocol ZYBDownloadDelegate:NSObjectProtocol {
    //失败
    func downloader(downloader:ZYBDownload,didFailWithError error:NSError)

    //成功
    func downloader(downloader:ZYBDownload,didFinishWithData data:NSData?)
}

class ZYBDownload: NSObject {

    weak var delegate:ZYBDownloadDelegate?

    //post请求数据
    func postWithUrl(urlString:String, params: Dictionary<String,AnyObject>) {
        Alamofire.request(.POST, urlString, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            switch response.result {
            case .Failure(let error):
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                self.delegate?.downloader(self, didFinishWithData: response.data)
            }
        }
    }

}
