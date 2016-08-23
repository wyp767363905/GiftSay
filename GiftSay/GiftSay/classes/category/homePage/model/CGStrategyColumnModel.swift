//
//  CGStrategyColumnModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

class CGStrategyColumnModel: NSObject {
    
    var code: NSNumber?
    var data: CGStrategyColumnDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> CGStrategyColumnModel {
        
        let model = CGStrategyColumnModel()
        
        let jsonData = JSON(data: data)
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = CGStrategyColumnDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class CGStrategyColumnDataModel: NSObject {
    
    var columns: Array<CGStrategyColumnColumnsModel>?
    var paging: CGStrategyColumnPagingModel?
    
    class func parseModel(jsonData: JSON) -> CGStrategyColumnDataModel {
        
        let model = CGStrategyColumnDataModel()
        
        let columnsArray = jsonData["columns"]
        var cArray = Array<CGStrategyColumnColumnsModel>()
        for (_,subjson) in columnsArray {
            let cModel = CGStrategyColumnColumnsModel.parseModel(subjson)
            cArray.append(cModel)
        }
        model.columns = cArray
        
        let pagingDict = jsonData["paging"]
        model.paging = CGStrategyColumnPagingModel.parseModel(pagingDict)
        
        return model
        
    }
    
}

class CGStrategyColumnColumnsModel: NSObject {
    
    var author: String?
    var banner_image_url: String?
    var banner_webp_url: String?
    
    var category: String?
    var cover_image_url: String?
    var cover_webp_url: String?
    
    var created_at: NSNumber?
    var desc: String?   //description
    var id: NSNumber?
    
    var order: NSNumber?
    var post_published_at: NSNumber?
    var status: NSNumber?
    
    var subtitle: String?
    var title: String?
    var updated_at: NSNumber?
    
    class func parseModel(jsonData: JSON) -> CGStrategyColumnColumnsModel {
        
        let model = CGStrategyColumnColumnsModel()
        
        model.author = jsonData["author"].string
        model.banner_image_url = jsonData["banner_image_url"].string
        model.banner_webp_url = jsonData["banner_webp_url"].string
        
        model.category = jsonData["category"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        
        model.created_at = jsonData["created_at"].number
        model.desc = jsonData["description"].string
        model.id = jsonData["id"].number
        
        model.order = jsonData["order"].number
        model.post_published_at = jsonData["post_published_at"].number
        model.status = jsonData["status"].number
        
        model.subtitle = jsonData["subtitle"].string
        model.title = jsonData["title"].string
        model.updated_at = jsonData["updated_at"].number
        
        return model
    }
    
}

class CGStrategyColumnPagingModel: NSObject {
    
    var next_url: String?
    
    class func parseModel(jsonData: JSON) -> CGStrategyColumnPagingModel {
        
        let model = CGStrategyColumnPagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}















