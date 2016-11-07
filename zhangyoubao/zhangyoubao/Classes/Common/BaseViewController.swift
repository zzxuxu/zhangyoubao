//
//  BaseViewController.swift
//  zhangyoubao
//
//  Created by 王健旭 on 2016/10/21.
//  Copyright © 2016年 王健旭. All rights reserved.
//

import UIKit

/*视图控制器的公共父类
 
 */

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 226/255.0, green: 223/255.0, blue: 218/255.0, alpha: 1.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
