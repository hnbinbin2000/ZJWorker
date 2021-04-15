//
//  Metas.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import Moya
import MoyaMapper

/**
 首页
 */

let homeMetasNet = MoyaProvider<HomeMetasNet>(plugins: [MoyaMapperPlugin(NetParameter())])


public enum HomeMetasNet {
    case metas
}

extension HomeMetasNet: TargetType {
    public var baseURL: URL {
        return URL(string: ApiHost)!
    }
    
    public var path: String {
        return "/api/metas"
    }
    
    public var method:Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        return .requestPlain
    }
    
    public var headers: [String : String]? {
        return ReqHeaders
    }

    
}
