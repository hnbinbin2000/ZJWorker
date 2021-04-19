//
//  AppDelegate.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/14.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let  controllerArray = ["HomeMeunViewController","MessageViewController","ContactViewController","MineViewController"]
        let  titleArray = ["工作台","消息","联系人","我的"]
        let  imageArray = ["shouye_icon_gongzuotai_hei","shouye_icon_xiaoxi_hei","shouye_icon_lianxi_hei","shouye_icon_wode_hei"]
        let  selImageArray = ["shouye_icon_gongzuotai_blue","shouye_icon_xiaoxi_blue","shouye_icon_lianxi_blue","shouye_icon_wode_blue"]
        let height = CGFloat(70)
        let tabBarController = HomeTabbarViewController(controllerArray:controllerArray,titleArray: titleArray,imageArray: imageArray,selImageArray: selImageArray,height:height)
        self.window?.rootViewController = tabBarController

        ///tabbar
        let tabbar = CustomerDetailEidtViewController()
        self.window?.rootViewController = tabbar
        self.window?.backgroundColor = UIColor.white
        
        self.window?.makeKeyAndVisible()

        return true
    }


    func applicationWillResignActive(_ application: UIApplication) {

    }

    func applicationDidEnterBackground(_ application: UIApplication) {
  
    }

    func applicationWillEnterForeground(_ application: UIApplication) {

    }

    func applicationDidBecomeActive(_ application: UIApplication) {

    }

    func applicationWillTerminate(_ application: UIApplication) {

    }

}

