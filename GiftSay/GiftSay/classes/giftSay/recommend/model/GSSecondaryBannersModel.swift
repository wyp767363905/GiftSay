//
//  GSSecondaryBannersModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

//次要的横幅
class GSSecondaryBannersModel: NSObject {
    
    var code: NSNumber?
    var data: GSSecondaryBannersDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> GSSecondaryBannersModel {
        
        let model = GSSecondaryBannersModel()
        
        let jsonData = JSON(data: data)
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        let dataDict = jsonData["data"]
        model.data = GSSecondaryBannersDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class GSSecondaryBannersDataModel: NSObject {
    
    var secondary_banners: Array<GSSecondaryBannersBannersModel>?
    
    class func parseModel(jsonData: JSON) -> GSSecondaryBannersDataModel {
        
        let model = GSSecondaryBannersDataModel()
        
        let bannersArray = jsonData["secondary_banners"]
        var bArray = Array<GSSecondaryBannersBannersModel>()
        for (_,subjson) in bannersArray {
            let bModel = GSSecondaryBannersBannersModel.parseModel(subjson)
            bArray.append(bModel)
        }
        model.secondary_banners = bArray
        
        return model
        
    }
    
}

class GSSecondaryBannersBannersModel: NSObject {
    
    var ad_monitors: Array<GSSecondaryBannersADMonitorsModel>?
    var id: NSNumber?
    var image_url: String?
    var target_url: String?
    var webp_url: String?
    
    class func parseModel(jsonData: JSON) -> GSSecondaryBannersBannersModel {
        
        let model = GSSecondaryBannersBannersModel()
        
        model.id = jsonData["id"].number
        model.image_url = jsonData["image_url"].string
        model.target_url = jsonData["target_url"].string
        model.webp_url = jsonData["webp_url"].string
        
        let adArray = jsonData["ad_monitors"]
        var amArray = Array<GSSecondaryBannersADMonitorsModel>()
        for (_,subjson) in adArray {
            let amModel = GSSecondaryBannersADMonitorsModel.parseModel(subjson)
            amArray.append(amModel)
        }
        model.ad_monitors = amArray
        
        return model
        
    }
    
}

class GSSecondaryBannersADMonitorsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> GSSecondaryBannersADMonitorsModel {
        
        let model = GSSecondaryBannersADMonitorsModel()
        
        
        return model
        
    }
    
}







