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

let templateNet = MoyaProvider<TemplateNet>(plugins: [MoyaMapperPlugin(NetParameter())])
//let templateNet = MoyaProvider<TemplateNet>()


public enum TemplateNet {
    case poiList(pageNum:NSInteger, keyWord:String)
}

extension TemplateNet: TargetType {
    public var baseURL: URL {
        return URL(string: "http://192.168.200.10:3000/mock/15/faceshow/tokens")!
    }
    
    public var path: String {
        return "/friend/getLocalPoiList"
    }
    
    public var method:Moya.Method {
        return .post
    }
    
    public var sampleData: Data {
        let json = "{\"code\":1,\"result\":{\"msg\":\"minim eiusmod ipsum voluptate cupidatat\",\"pageNum\":-34739075.15335113,\"hasNextPage\":false,\"list\":[{\"isCity\":0,\"name\":\"兴业银行24小时自助银行(商务外环路支行)\",\"icon\":null,\"vicinity\":\"郑东新区商务外环路6号\",\"lat\":\"id sint aute\",\"lng\":\"dolore mollit\"},{\"isCity\":0,\"name\":\"兴业银行24小时自助银行(商务外环路支行)\",\"icon\":null,\"vicinity\":\"郑东新区商务外环路6号\",\"lat\":\"mollit velit Ut laboris et\",\"lng\":\"ut cillum amet anim adipisicing\"},{\"isCity\":0,\"name\":\"兴业银行24小时自助银行(商务外环路支行)\",\"icon\":null,\"vicinity\":\"郑东新区商务外环路6号\",\"lat\":\"est pariatur fugiat sint\",\"lng\":\"officia do\"}],\"pageToken\":null,\"code\":-63501939.589104325},\"msg\":\"ok\"}"
        return json.data(using: .utf8)!
    }
    
    public var task: Task {
        switch self {
        case .poiList(pageNum: let p, keyWord: let k):
            return .requestParameters(parameters: ["pageNum":p,
                                                   "keyWord":k], encoding: JSONEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-Type": "application/json",
                "latitude": "31.0449",
                "longitude": "121.4012",
                "systoken":"d1dc7c5e62354dfdc798c97519604cd6"]
    }

    
}
