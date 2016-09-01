//
//  RecommendModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class RecommendModel: NSObject {
    
    var code: NSNumber?
    var data: RecommendDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> RecommendModel {
        
        let jsonData = JSON(data: data)
        
        let model = RecommendModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = RecommendDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class RecommendDataModel: NSObject {
    
    var ios_apps: Array<RecommendAppsModel>?
    
    class func parseModel(jsonData: JSON) -> RecommendDataModel {
        
        let model = RecommendDataModel()
        
        var array = Array<RecommendAppsModel>()
        for (_,subjson) in jsonData["ios_apps"] {
            let appModel = RecommendAppsModel.parseModel(subjson)
            array.append(appModel)
        }
        model.ios_apps = array
        
        return model
        
    }
    
}

class RecommendAppsModel: NSObject {
    
    var download_url: String?
    var icon_url: String?
    var id: NSNumber?
    
    var order: NSNumber?
    var show: Bool?
    var subtitle: String?
    
    var title: String?
    var type: String?
    
    class func parseModel(jsonData: JSON) -> RecommendAppsModel {
        
        let model = RecommendAppsModel()
        
        model.download_url = jsonData["download_url"].string
        model.icon_url = jsonData["icon_url"].string
        model.id = jsonData["id"].number
        
        model.order = jsonData["order"].number
        model.show = jsonData["show"].bool
        model.subtitle = jsonData["subtitle"].string
        
        model.title = jsonData["title"].string
        model.type = jsonData["type"].string
        
        return model
        
    }
    
}



























