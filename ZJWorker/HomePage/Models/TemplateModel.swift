//
//  TemplateModel.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import MoyaMapper
import SwiftyJSON

struct TemplateModel: Codable{
    var msg = ""
    var code = 0
    
    var pageNum = 1
    var hasNexpage = false
    
    func mapping(_ json: JSON) {
        
    }
}
