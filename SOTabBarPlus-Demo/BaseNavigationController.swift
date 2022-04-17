//
//  BaseNavigationController.swift
//  SOTabBarPlus-Demo
//
//  Created by wzjun on 2022/4/17.
//
import UIKit

class BaseNavigationController: UINavigationController {
    
    var tabbarTitle = ""
    var tabbarUnSelected = ""
    var tabbarSelected = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        // 不是第一级vc
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            // 可以在这里设置返回按钮等,重写后侧滑返回失效需要自己单独处理
            //backBarButtonItem 是带有字和返回箭头的样式
            /*
             viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "nav_back_13x21"), style: .plain, target: self, action: #selector(navBackAction))
             */
            //updateUIStatusBarStyle(viewController)
        }
        //一定要写在最后，要不然无效
        super.pushViewController(viewController, animated: true)
    }
    
}
