//
//  HomeTabbarViewController.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import UIKit
import XHTabBarSwift

/**
 tabbar 不太好使
 */
class HomeTabbarViewController: XHTabBar {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.backgroundColor = UIColor.white
        self.tabBarController?.navigationController?.navigationBar.isHidden = true
        
        showBadgeMark(99, index: 0)
        
        self.hidesBottomBarWhenPushed = true
    }
}
