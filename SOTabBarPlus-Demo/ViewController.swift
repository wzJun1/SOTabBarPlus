//
//  ViewController.swift
//  SOTabBarPlus-Demo
//
//  Created by wzjun on 2022/4/17.
//

import UIKit

class ViewController: SOTabBarPlusController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        let pageOne = PageOneViewController()
        pageOne.tabbarTitle = "页面1"
        pageOne.tabbarUnSelected = "home"
        pageOne.tabbarSelected = "home_selected"
        let pageOneNav = BaseNavigationController(rootViewController: pageOne)
        addChild(pageOneNav)
        
        let pageTwo = PageTwoViewController()
        pageTwo.tabbarTitle = "页面2"
        pageTwo.tabbarUnSelected = "diamond"
        pageTwo.tabbarSelected = "diamond_selected"
        let pageTwoNav = BaseNavigationController(rootViewController: pageTwo)
        addChild(pageTwoNav)
        
        let pageThree = PageThreeViewController()
        pageThree.tabbarTitle = "页面3"
        pageThree.tabbarUnSelected = "user"
        pageThree.tabbarSelected = "user_selected"
        let pageThreeNav = BaseNavigationController(rootViewController: pageThree)
        addChild(pageThreeNav)
        
        let pageFour = PageFourViewController()
        pageFour.tabbarTitle = "页面4"
        pageFour.tabbarUnSelected = "home"
        pageFour.tabbarSelected = "home_selected"
        let pageFourNav = BaseNavigationController(rootViewController: pageFour)
        addChild(pageFourNav)
        
        soTabBarPlus.initTabbar(0, viewControllers: [pageOne, pageTwo, pageThree, pageFour])
        soTabBarPlus.setSelectedCircleColor(UIColor(red: 252.0/255.0, green: 129.0/255.0, blue: 171.0/255.0, alpha: 1))
    }
    


}

