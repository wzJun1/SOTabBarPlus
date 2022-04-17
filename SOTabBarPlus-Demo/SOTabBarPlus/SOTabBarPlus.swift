//
//  Created by wzJun on 2/18/22.
//

import UIKit
import SnapKit

class SOTabBarPlus: UITabBar {
    
    //当前选中索引
    var selectedIndex: Int?
    
    //上一个选中索引
    var previousSelectedIndex: Int?
    
    //圆宽
    var selectedCycleWidth: CGFloat = 60
    
    //控制器列表
    var viewControllerList: Array<BaseViewController>?
    
    //Item 视图临时存放
    var gridViewList: Array<UIView>!
    
    //自定义Tabbar容器
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
 
    private let innerCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        return view
    }()
    
    public let outerCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //圆内图片,即选中时使用的图片
    private let tabSelectedImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = UIColor.white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //初始化容器
    func initialization() {
        
        innerCircleView.addSubview(outerCircleView)
        outerCircleView.addSubview(tabSelectedImageView)
        innerCircleView.layer.cornerRadius = selectedCycleWidth / 2
        outerCircleView.layer.cornerRadius = (selectedCycleWidth - 10) / 2
        
        containerView.addSubview(innerCircleView)
        containerView.backgroundColor = UIColor.white
        self.addSubview(containerView)
        containerView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(60)
            make.top.equalTo(0)
        }
        
        let safeAreaView = UIView()
        safeAreaView.translatesAutoresizingMaskIntoConstraints = false
        safeAreaView.backgroundColor = UIColor.white
        self.addSubview(safeAreaView)
        self.bringSubviewToFront(safeAreaView)
        safeAreaView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalTo(containerView.snp.bottom)
            make.bottom.equalTo(0)
        }
        
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOpacity = 0.6
        layer.shadowOffset = CGSize(width: 0, height: -2)
        layer.shadowRadius = 3
    }
    
    
    public func initTabbar(_ index: Int, viewControllers: Array<BaseViewController>){
        let IphoneX = (UIScreen.main.bounds.width >= 375 && UIScreen.main.bounds.height >= 812)
        selectedIndex = index
        previousSelectedIndex = index
        viewControllerList = viewControllers
        var gridWidth = UIScreen.main.bounds.size.width / (CGFloat)(viewControllerList!.count)
        var x = (gridWidth  - selectedCycleWidth) / 2 + gridWidth * CGFloat(index)
        var y = -selectedCycleWidth/2.0
        innerCircleView.snp.makeConstraints { make in
            make.left.equalTo(x)
            make.top.equalTo(y)
            make.width.equalTo(selectedCycleWidth)
            make.height.equalTo(selectedCycleWidth)
        }
        outerCircleView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(selectedCycleWidth - 10)
            make.height.equalTo(selectedCycleWidth - 10)
        }
        tabSelectedImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        gridViewList = []
        var selected = viewControllerList![index].tabbarSelected
        tabSelectedImageView.image = UIImage.init(named: selected)
        var gridView = UIView()
        containerView.addSubview(gridView)
        gridView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalTo(0)
        }
        for i in 0...viewControllerList!.count-1 {
            var x = (gridWidth  - selectedCycleWidth) / 2 + gridWidth * CGFloat(i)
            var gridItemView = UIView()
            containerView.addSubview(gridItemView)
            containerView.sendSubviewToBack(gridItemView)
            gridItemView.snp.makeConstraints { make in
                make.width.equalTo(selectedCycleWidth)
                make.height.equalToSuperview()
                make.top.equalTo(0)
                make.left.equalTo(x)
            }
            gridViewList.append(gridItemView)
            gridItemView.clipsToBounds = true
            var title = viewControllerList![i].tabbarTitle
            var unselected = viewControllerList![i].tabbarUnSelected
            var unselectedImageView = UIImageView()
            unselectedImageView.image = UIImage.init(named: unselected)
            gridItemView.addSubview(unselectedImageView)
            unselectedImageView.snp.makeConstraints { make in
                make.width.equalTo(25)
                make.height.equalTo(25)
                if i == 0{
                    make.top.equalTo(0)
                }else{
                    make.top.equalTo(12.5)
                }
                make.centerX.equalToSuperview()
            }
            
            var tabBarTitleLabel = UILabel()
            tabBarTitleLabel.text = title
            tabBarTitleLabel.font = UIFont.boldSystemFont(ofSize: 16)
            tabBarTitleLabel.textAlignment = .center
            tabBarTitleLabel.textColor = .black
            gridItemView.addSubview(tabBarTitleLabel)
            tabBarTitleLabel.snp.makeConstraints { make in
                make.width.equalToSuperview()
                make.height.equalTo(20)
                if i == 0{
                    //make.top.equalTo(30)
                    make.bottom.equalToSuperview().offset(IphoneX ? -10 : 0)
                }else{
                    //make.top.equalTo(70)
                    make.bottom.equalToSuperview().offset(50)
                }
            }
        }
    }
    
    public func didSelectTab(_ index: Int){
        
        let IphoneX = (UIScreen.main.bounds.width >= 375 && UIScreen.main.bounds.height >= 812)

        if index == selectedIndex {
            return
        }
        
        var tabbarwidth = UIScreen.main.bounds.size.width / (CGFloat)(viewControllerList!.count)
        var x = (tabbarwidth  - selectedCycleWidth) / 2 + tabbarwidth * CGFloat(index)
        innerCircleView.snp.updateConstraints { make in
            make.left.equalTo(x)
        }
        var selected = viewControllerList![index].tabbarSelected
        tabSelectedImageView.image = UIImage.init(named: selected)
        previousSelectedIndex = selectedIndex
        selectedIndex = index
        var gridItemView = gridViewList?[index] as! UIView
        for sub in gridItemView.subviews{
            if(sub.isKind(of: UIImageView.self)){
                var imageView = sub as! UIImageView
                imageView.snp.updateConstraints { make in
                    make.top.equalTo(0)
                }
            }
            if(sub.isKind(of: UILabel.self)){
                var label = sub as! UILabel
                label.snp.updateConstraints { make in
                    //make.top.equalTo(30)
                    make.bottom.equalToSuperview().offset(IphoneX ? -10 : 0)
                }
            }
        }
        gridItemView = gridViewList?[previousSelectedIndex!] as! UIView
        for sub in gridItemView.subviews{
            if(sub.isKind(of: UIImageView.self)){
                var imageView = sub as! UIImageView
                imageView.snp.updateConstraints { make in
                    make.top.equalTo(12.5)
                }
            }
            if(sub.isKind(of: UILabel.self)){
                var label = sub as! UILabel
                label.snp.updateConstraints { make in
                    //make.top.equalTo(70)
                    make.bottom.equalToSuperview().offset(50)
                }
            }
        }
    }
    
    public func setSelectedCircleColor(_ color: UIColor){
        outerCircleView.backgroundColor = color
    }
    
    
    
}
