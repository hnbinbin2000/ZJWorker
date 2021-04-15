//
//  OfficeNet.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import Moya
import MoyaMapper

/**
 考勤相关
 */

/**
 TODO ---
 request参数列表 改成model
 */

let officeNet = MoyaProvider<OfficeNet>(plugins: [MoyaMapperPlugin(NetParameter())])

public enum OfficeNet {
    static private let publicKey = "PUB key"
    
    ///考勤组人员打卡状态
    case worker_status(groupId:String, date:String, type:String)
    
    case attendances
    
}

extension OfficeNet: TargetType {
    
    public var baseURL: URL {
        return URL(string: ApiHost)!
    }
    
    public var path: String {
        switch self {
        case .worker_status(_,_,_):
            return "/api/groups/worker_status"
        case .attendances:
            return "/api/attendances"
        }
    }

//    public var parameters: [String: Any]? {
//        switch self {
//        case .wo:
//            <#code#>
//        default:
//            <#code#>
//        }
//    }
    
    public var task: Task {
        switch self {
        /**
         group_id    是    12    考勤组id
         date    是    2021-04-14    日期
         type    是        类型1已打卡2未打卡
         */
        case .worker_status(groupId: let groupId, date: let date, type: let type):
            return .requestParameters(parameters: ["group_id":groupId,"date":date,"type":type],
                                      encoding: URLEncoding.default)
            
        case .attendances:
            return .requestPlain
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .worker_status:
            return .get
        default:
            return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var headers: [String : String]? {
        return ReqHeaders
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}

