//
//  CGStrategyNoColumnModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

class CGStrategyNoColumnModel: NSObject {
    
    var code: NSNumber?
    var data: CGStrategyNoColumnDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> CGStrategyNoColumnModel {
        
        let model = CGStrategyNoColumnModel()
        
        let jsonData = JSON(data: data)
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = CGStrategyNoColumnDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class CGStrategyNoColumnDataModel: NSObject {
    
    var channel_groups: Array<CGStrategyNoColumnDataGroupsModel>?
    
    class func parseModel(jsonData: JSON) -> CGStrategyNoColumnDataModel {
        
        let model = CGStrategyNoColumnDataModel()
        
        var array = Array<CGStrategyNoColumnDataGroupsModel>()
        for (_,subjson) in jsonData["channel_groups"] {
            let cgModel = CGStrategyNoColumnDataGroupsModel.parseModel(subjson)
            array.append(cgModel)
        }
        model.channel_groups = array
        
        return model
        
    }
    
}

class CGStrategyNoColumnDataGroupsModel: NSObject {
    
    var channels: Array<CGStrategyNoColumnDataChannelsModel>?
    var id: NSNumber?
    var name: String?
    var order: NSNumber?
    var status: NSNumber?
    
    class func parseModel(jsonData: JSON) -> CGStrategyNoColumnDataGroupsModel {
        
        let model = CGStrategyNoColumnDataGroupsModel()
        
        model.id = jsonData["id"].number
        model.name = jsonData["name"].string
        model.order = jsonData["order"].number
        model.status = jsonData["status"].number
        
        var array = Array<CGStrategyNoColumnDataChannelsModel>()
        for (_,subjson) in jsonData["channels"] {
            let chaModel = CGStrategyNoColumnDataChannelsModel.parseModel(subjson)
            array.append(chaModel)
        }
        model.channels = array
        
        return model
        
    }
    
}

class CGStrategyNoColumnDataChannelsModel: NSObject {
    
    var cover_image_url: String?
    var group_id: NSNumber?
    var icon_url: String?
    
    var id: NSNumber?
    var items_count: NSNumber?
    var name: String?
    
    var order: NSNumber?
    var status: NSNumber?
    var url: String?
    
    class func parseModel(jsonData: JSON) -> CGStrategyNoColumnDataChannelsModel {
        
        let model = CGStrategyNoColumnDataChannelsModel()
        
        model.cover_image_url = jsonData["cover_image_url"].string
        model.group_id = jsonData["group_id"].number
        model.icon_url = jsonData["icon_url"].string
        model.id = jsonData["id"].number
        model.items_count = jsonData["items_count"].number
        model.name = jsonData["name"].string
        model.order = jsonData["order"].number
        model.status = jsonData["status"].number
        model.url = jsonData["url"].string
        
        return model
        
    }
    
}





















