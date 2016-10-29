//
//  ScrollViewProtocol.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/27.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

protocol ScrollViewProtocol: NSObjectProtocol,UIScrollViewDelegate {
    func addScrollView(scrollView:UIScrollView)
}

extension ScrollViewProtocol where Self:UIViewController{
    func addScrollView(scrollView:UIScrollView){
        scrollView.showsVerticalScrollIndicator=false
        scrollView.showsHorizontalScrollIndicator=false
        self.automaticallyAdjustsScrollViewInsets=false
        //    scrollView.backgroundColor=UIColor(patternImage: UIImage(named: "Default")!)
        scrollView.contentMode = .ScaleAspectFill
        scrollView.pagingEnabled = true
        scrollView.clipsToBounds=true
        scrollView.delegate=self
    }
}