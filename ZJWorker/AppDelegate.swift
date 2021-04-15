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

        ///tabbar
        let tabbar = HomeTabbarViewController()
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

