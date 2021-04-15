//
//  NetworkReachability.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import Alamofire
import UIKit

/**
 网络状态
 */
class NetworkReachability: NSObject {

    static let reachAbility = NetworkReachability()
    
    var reachAble:Bool = {
        var reach = true
        
        let manager = NetworkReachabilityManager(host: "www.baidu.com")
        
        manager?.startListening(onUpdatePerforming: { status in
            switch status {
            case .notReachable:
                reach = false
//                SVProgressHUD.showError(withStatus: "网络出错")
            case .reachable(.ethernetOrWiFi):
                reach = true
            case .reachable(.cellular):
                reach = true
            case .unknown:
                reach = false
//                SVProgressHUD.showError(withStatus: "网络出错")
            }
        })
        
        return reach
    }()
    
}
