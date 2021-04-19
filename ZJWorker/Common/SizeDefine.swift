//
//  SizeDefine.swift
//  ZJWorker
//
//  Created by Guochao on 2021/4/15.
//

import Foundation
import UIKit

///尺寸
let SCREEN_WIDTH = UIScreen.main.bounds.size.width
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height

let STATUS_NAV_BAR_Y:CGFloat = IS_IPHONE_X == true ? 88.0 : 64.0
let TABBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 83.0 : 49.0
let STATUSBAR_HEIGHT:CGFloat = IS_IPHONE_X == true ? 44.0 : 20.0

///机型
let SCREEN_MAX_LENGTH  = max(SCREEN_WIDTH, SCREEN_HEIGHT)
let IS_IPHONE_4_OR_LESS = SCREEN_MAX_LENGTH < 568.0
let IS_IPHONE_5 = SCREEN_MAX_LENGTH == 568.0
let IS_IPHONE_6 = SCREEN_MAX_LENGTH == 667.0
let IS_IPHONE_6P = SCREEN_MAX_LENGTH == 736.0
let IS_IPHONE_X = SCREEN_MAX_LENGTH == 812.0


///信息
let GetAppInfo = Bundle.main.infoDictionary//当前app信息
let GetAppCurrentVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")//获取当前版本号
let GetSystemVersion = UIDevice.current.systemVersion//获取设备系统号


///rgb
func COLORFROMRGB(r:CGFloat,_ g:CGFloat,_ b:CGFloat, alpha:CGFloat) -> UIColor
{
    return UIColor(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: alpha)
}

func COLORFROM16(h:Int) ->UIColor {
    return COLORFROMRGB(r: CGFloat(((h)>>16) & 0xFF), CGFloat(((h)>>8) & 0xFF), CGFloat((h) & 0xFF), alpha: 1.0)
}

func COLORFROM16(h:Int, alpha: CGFloat) ->UIColor {
    return COLORFROMRGB(r: CGFloat(((h)>>16) & 0xFF), CGFloat(((h)>>8) & 0xFF), CGFloat((h) & 0xFF), alpha: CGFloat(alpha))
}
