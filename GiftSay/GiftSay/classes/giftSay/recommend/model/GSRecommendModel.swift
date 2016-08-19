//
//  GSRecommendModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

//广告
class GSRecommendModel: NSObject {
    
    var code: NSNumber?
    var data: GSRecommendDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> GSRecommendModel {
        
        let model = GSRecommendModel()
        
        let jsonData = JSON(data: data)
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        let dataDict = jsonData["data"]
        model.data = GSRecommendDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class GSRecommendDataModel: NSObject {
    
    var banners: Array<GSRecommendBannersModel>?
    
    class func parseModel(jsonData: JSON) -> GSRecommendDataModel {
        
        let model = GSRecommendDataModel()
        
        let bannersArray = jsonData["banners"]
        var bArray = Array<GSRecommendBannersModel>()
        for (_,subjson) in bannersArray {
            let bannersModel = GSRecommendBannersModel.parseModel(subjson)
            bArray.append(bannersModel)
        }
        model.banners = bArray
        
        return model
        
    }
    
}

class GSRecommendBannersModel: NSObject {
    
    var ad_monitors: Array<GSRecommendADMonitorsModel>?
    var channel: String?
    var id: NSNumber?
    
    var image_url: String?
    var order: NSNumber?
    var status: NSNumber?
    
    var target: GSRecommendTargetModel?
    var target_id: NSNumber?
    var target_type: String?
    
    var target_url: String?
    var type: String?
    var webp_url: String?
    
    class func parseModel(jsonData: JSON) -> GSRecommendBannersModel {
        
        let model = GSRecommendBannersModel()
        
        model.channel = jsonData["channel"].string
        model.id = jsonData["id"].number
        model.image_url = jsonData["image_url"].string
        model.order = jsonData["order"].number
        model.status = jsonData["status"].number
        model.target_id = jsonData["target_id"].number
        model.target_type = jsonData["target_type"].string
        model.target_url = jsonData["target_url"].string
        model.type = jsonData["type"].string
        model.webp_url = jsonData["webp_url"].string
        
        let admArray = jsonData["ad_monitors"]
        var adArray = Array<GSRecommendADMonitorsModel>()
        for (_,subjson) in admArray {
            let adModel = GSRecommendADMonitorsModel.parseModel(subjson)
            adArray.append(adModel)
        }
        model.ad_monitors = adArray
        
        let targetDict = jsonData["target"]
        model.target = GSRecommendTargetModel.parseModel(targetDict)
        
        return model
        
    }
    
}

class GSRecommendADMonitorsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> GSRecommendADMonitorsModel {
        
        let model = GSRecommendADMonitorsModel()
        
        return model
        
    }
    
}

class GSRecommendTargetModel: NSObject {
    
    var banner_image_url: String?
    var banner_webp_url: String?
    var cover_image_url: String?
    
    var cover_webp_url: String?
    var created_at: NSNumber?
    var id: NSNumber?
    
    var posts_count: NSNumber?
    var status: NSNumber?
    var subtitle: String?
    
    var title: String?
    var updated_at: NSNumber?
    
    class func parseModel(jsonData: JSON) -> GSRecommendTargetModel {
        
        let model = GSRecommendTargetModel()
        
        model.banner_image_url = jsonData["banner_image_url"].string
        model.banner_webp_url = jsonData["banner_webp_url"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        model.id = jsonData["id"].number
        model.posts_count = jsonData["posts_count"].number
        model.status = jsonData["status"].number
        model.subtitle = jsonData["subtitle"].string
        model.title = jsonData["title"].string
        model.updated_at = jsonData["updated_at"].number
        
        return model
        
    }
    
}





