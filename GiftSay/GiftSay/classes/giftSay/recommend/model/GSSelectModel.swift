//
//  GSSelectModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

//精选
class GSSelectModel: NSObject {
    
    var code: NSNumber?
    var data: GSSelectrDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> GSSelectModel {
        
        let model = GSSelectModel()
        
        let jsonData = JSON(data: data)
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = GSSelectrDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class GSSelectrDataModel: NSObject {
    
    var items: Array<GSSelectItemsModel>?
    var paging: GSSelectPagingModel?
    
    class func parseModel(jsonData: JSON) -> GSSelectrDataModel {
        
        let model = GSSelectrDataModel()
        
        let itemsArray = jsonData["items"]
        var iArray = Array<GSSelectItemsModel>()
        for (_,subjson) in itemsArray {
            let iModel = GSSelectItemsModel.parseModel(subjson)
            iArray.append(iModel)
        }
        model.items = iArray
        
        let pagingDict = jsonData["paging"]
        model.paging = GSSelectPagingModel.parseModel(pagingDict)
        
        return model
        
    }
    
}

class GSSelectItemsModel: NSObject {
    
    var ad_monitors: Array<GSSelectADMonitorsModel>?
    var author: GSSelectAuthorModel?
    var column: GSSelectColumnModel?
    
    var content_type: NSNumber?
    var content_url: String?
    var cover_image_url: String?
    
    var cover_webp_url: String?
    var created_at: NSNumber?
    var editor_id: NSNumber?
    
    var feature_list: Array<GSSelectFeatureListModel>?
    var hidden_cover_image: Bool?
    var id: NSNumber?
    
    var labels: Array<GSSelectLabelsModel>?
    var liked: Bool?
    var likes_count: NSNumber?
    
    var published_at: NSNumber?
    var share_msg: String?
    var short_title: String?
    
    var status: NSNumber?
    var template: String?
    var title: String?
    
    var type: String?
    var updated_at: NSNumber?
    var url: String?
    
    
    class func parseModel(jsonData: JSON) -> GSSelectItemsModel {
        
        let model = GSSelectItemsModel()
        
        model.content_type = jsonData["content_type"].number
        model.content_url = jsonData["content_url"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        model.editor_id = jsonData["editor_id"].number
        
        model.hidden_cover_image = jsonData["hidden_cover_image"].bool
        model.id = jsonData["id"].number
        model.liked = jsonData["liked"].bool
        
        model.likes_count = jsonData["likes_count"].number
        model.published_at = jsonData["published_at"].number
        model.share_msg = jsonData["share_msg"].string
        
        model.short_title = jsonData["short_title"].string
        model.status = jsonData["status"].number
        model.template = jsonData["template"].string
        
        model.title = jsonData["title"].string
        model.type = jsonData["type"].string
        model.updated_at = jsonData["updated_at"].number
        
        model.url = jsonData["url"].string
        
        let admArray = jsonData["ad_monitors"]
        var adArray = Array<GSSelectADMonitorsModel>()
        for (_,subjson) in admArray {
            let adModel = GSSelectADMonitorsModel.parseModel(subjson)
            adArray.append(adModel)
        }
        model.ad_monitors = adArray
        
        let authorDict = jsonData["author"]
        model.author = GSSelectAuthorModel.parseModel(authorDict)
        
        let columnDict = jsonData["column"]
        model.column = GSSelectColumnModel.parseModel(columnDict)
        
        let fListArray = jsonData["feature_list"]
        var flArray = Array<GSSelectFeatureListModel>()
        for (_,subjson) in fListArray {
            let flModel = GSSelectFeatureListModel.parseModel(subjson)
            flArray.append(flModel)
        }
        model.feature_list = flArray
        
        let labelsArray = jsonData["labels"]
        var lArray = Array<GSSelectLabelsModel>()
        for (_,subjson) in labelsArray {
            let lModel = GSSelectLabelsModel.parseModel(subjson)
            lArray.append(lModel)
        }
        model.labels = lArray
        
        
        return model
        
    }
    
}

//下一页的情况
class GSSelectPagingModel: NSObject {
    
    var next_url: String?
    
    class func parseModel(jsonData: JSON) -> GSSelectPagingModel {
        
        let model = GSSelectPagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}

class GSSelectAuthorModel: NSObject {
    
    var avatar_url: String?
    var avatar_webp_url: String?
    var created_at: NSNumber?
    var id: NSNumber?
    var nickname: String?
    
    class func parseModel(jsonData: JSON) -> GSSelectAuthorModel {
        
        let model = GSSelectAuthorModel()
        
        model.avatar_url = jsonData["avatar_url"].string
        model.avatar_webp_url = jsonData ["avatar_webp_url"].string
        model.created_at = jsonData["created_at"].number
        model.id = jsonData["id"].number
        model.nickname = jsonData["nickname"].string
        
        return model
        
    }
    
}

class GSSelectColumnModel: NSObject {
    
    var banner_image_url: String?
    var category: String?
    var cover_image_url: String?
    
    var created_at: NSNumber?
    var desc: String?   //description
    var id: NSNumber?
    
    var order: NSNumber?
    var post_published_at: NSNumber?
    var status: NSNumber?
    
    var subtitle: String?
    var title: String?
    var updated_at: NSNumber?
    
    class func parseModel(jsonData: JSON) -> GSSelectColumnModel {
        let model = GSSelectColumnModel()
        
        model.banner_image_url = jsonData["banner_image_url"].string
        model.category = jsonData["category"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        
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

class GSSelectADMonitorsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> GSSelectADMonitorsModel {
        
        let model = GSSelectADMonitorsModel()
        
        return model
        
    }
    
}

class GSSelectFeatureListModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> GSSelectFeatureListModel {
        
        let model = GSSelectFeatureListModel()
        
        return model
        
    }
    
}

class GSSelectLabelsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> GSSelectLabelsModel {
        
        let model = GSSelectLabelsModel()
        
        return model
        
    }
    
}











