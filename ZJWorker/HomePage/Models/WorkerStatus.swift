//
//  WorkerStatus.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import MoyaMapper
import SwiftyJSON

struct WorkerStatus: Codable {
    
}

struct User: Modelable {
    var user: String = ""
    var id: Int = 0
    
    
    init() {}
    mutating func mapping(_ json: JSON) {
        
    }
}
