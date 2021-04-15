//
//  Response.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import Moya
import MoyaMapper

struct NetParameter: ModelableParameterType  {
    var successValue = "0"
    var statusCodeKey = "code"
    var tipStrKey = "msg"
    var modelKey = "data"
}

public struct DataResponse<T> {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: T?
}

public struct ListResponse<T> {
    public init (){}
    public var code: Int = -1
    public var msg: String = ""
    public var data: [T] = []
}

