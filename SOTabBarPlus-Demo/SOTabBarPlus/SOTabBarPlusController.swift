//
//  Created by wzJun on 2/18/22.
//


import UIKit

protocol SOTabBarPlusControllerDelegate : NSObjectProtocol {
    func soTabBarPlusController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController)
    func animateTabBarItem(_ index: Int)
    func setSelectedCircleColor(_ color: UIColor)
}

class SOTabBarPlusController: UITabBarController,UITabBarControllerDelegate {
    
    
    var soTabBarPlus = SOTabBarPlus(frame: CGRect.zero)
    weak var soTabBarPlusControllerDelegate : SOTabBarPlusControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setValue(soTabBarPlus, forKeyPath: "tabBar")
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        soTabBarPlus.didSelectTab(tabBarController.selectedIndex)
        UIView.animate(withDuration: 0.15,animations: { [self] in
            soTabBarPlus.layoutIfNeeded()
        })
        self.soTabBarPlusControllerDelegate?.soTabBarPlusController(tabBarController, didSelect: viewController)
    }
}
