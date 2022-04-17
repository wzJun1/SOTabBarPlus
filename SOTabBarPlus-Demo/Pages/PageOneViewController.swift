//
//  PageOneViewController.swift
//  SOTabBarPlus-Demo
//
//  Created by wzjun on 2022/4/17.
//

import UIKit
import SnapKit

class PageOneViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let button = UIButton()
        button.setTitle("跳转新页面", for: .normal)
        button.titleLabel?.textColor = UIColor.white
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.backgroundColor = UIColor.black
        button.addTarget(self, action: #selector(navigate), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(100)
        }
        // Do any additional setup after loading the view.
    }
    
    @objc func navigate(){
        let vc = OtherViewController()
        self.navigationController?.pushViewController(vc, animated: true);
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
