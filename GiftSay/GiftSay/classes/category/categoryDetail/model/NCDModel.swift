//
//  NCDModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class NCDModel: NSObject {
    
    var code: NSNumber?
    var data: NCDDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> NCDModel {
        
        let jsonData = JSON(data: data)
        
        let model = NCDModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        model.data = NCDDataModel.parseModel(jsonData["data"])
        
        return model
        
    }
    
}

class NCDDataModel: NSObject {
    
    var items: Array<NCDItemsModel>?
    var paging: NCDPagingModel?
    
    class func parseModel(jsonData: JSON) -> NCDDataModel {
        
        let model = NCDDataModel()
        
        var array = Array<NCDItemsModel>()
        for (_,subjson) in jsonData["items"] {
            let itemsModel = NCDItemsModel.parseModel(subjson)
            array.append(itemsModel)
        }
        model.items = array
        
        model.paging = NCDPagingModel.parseModel(jsonData["paging"])
        
        return model
        
    }

}

class NCDItemsModel: NSObject {
    
    var ad_monitors: NSArray?//
    var author: NCDAuthorModel?
    var column: NCDColumnModel?
    
    var content_type: NSNumber?
    var content_url: String?
    var cover_image_url: String?
    
    var cover_webp_url: String?
    var created_at: NSNumber?
    var editor_id: NSNumber?
    
    var feature_list: NSArray?//
    var hidden_cover_image: Bool?
    var id: NSNumber?
    
    var labels: NSArray?//
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
    
    class func parseModel(jsonData: JSON) -> NCDItemsModel {
        
        let model = NCDItemsModel()
        
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
        
        model.author = NCDAuthorModel.parseModel(jsonData["author"])
        
        model.column = NCDColumnModel.parseModel(jsonData["column"])
        
        return model
        
    }
    
}

class NCDAuthorModel: NSObject {
    
    var avatar_url: String?
    var avatar_webp_url: NSNull?
    var created_at: NSNumber?
    var id: NSNumber?
    var nickname: String?
    
    class func parseModel(jsonData: JSON) -> NCDAuthorModel {
        
        let model = NCDAuthorModel()
        
        model.avatar_url = jsonData["avatar_url"].string
        model.avatar_webp_url = jsonData["avatar_webp_url"].null
        model.created_at = jsonData["created_at"].number
        model.id = jsonData["id"].number
        model.nickname = jsonData["nickname"].string
        
        return model
        
    }
    
}

class NCDColumnModel: NSObject {
    
    var banner_image_url: String?
    var category: String?
    var cover_image_url: String?
    
    var created_at: NSNumber?
    var desc: String?    //description
    var id: NSNumber?
    
    var order: NSNumber?
    var post_published_at: NSNumber?
    var status: NSNumber?
    
    var subtitle: String?
    var title: String?
    var updated_at: NSNumber?
    
    class func parseModel(jsonData: JSON) -> NCDColumnModel {
        
        let model = NCDColumnModel()
        
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

class NCDPagingModel: NSObject {
    
    var next_url: String?
    
    class func parseModel(jsonData: JSON) -> NCDPagingModel {
        
        let model = NCDPagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}









