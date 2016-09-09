//
//  CDModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class CDModel: NSObject {
    
    var code: NSNumber?
    var data: CDDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> CDModel {
        
        let jsonData = JSON(data: data)
        
        let model = CDModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        model.data = CDDataModel.parseModel(jsonData["data"])
        
        return model
        
    }
    
}

class CDDataModel: NSObject {
    
    var banner_image_url: String?
    var banner_webp_url: String?
    var category: String?
    
    var cover_image_url: String?
    var cover_webp_url: String?
    var created_at: NSNumber?
    
    var desc: String?    //description
    var id: NSNumber?
    var likes_count: NSNumber?
    
    var order: NSNumber?
    var paging: CDPagingModel?
    var post_published_at: NSNumber?
    
    var posts: Array<CDPostModel>?
    var share_url: String?
    var status: NSNumber?
    
    var subtitle: String?
    var title: String?
    var updated_at: NSNumber?
    
    class func parseModel(jsonData: JSON) -> CDDataModel {
        
        let model = CDDataModel()
        
        model.banner_image_url = jsonData["banner_image_url"].string
        model.banner_webp_url = jsonData["banner_webp_url"].string
        model.category = jsonData["category"].string
        
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        
        model.desc = jsonData["description"].string
        model.id = jsonData["id"].number
        model.likes_count = jsonData["likes_count"].number
        
        model.order = jsonData["order"].number
        model.post_published_at = jsonData["post_published_at"].number
        model.share_url = jsonData["share_url"].string
        
        model.status = jsonData["status"].number
        model.subtitle = jsonData["subtitle"].string
        model.title = jsonData["title"].string
        
        model.updated_at = jsonData["updated_at"].number
        
        model.paging = CDPagingModel.parseModel(jsonData["paging"])
        
        var array = Array<CDPostModel>()
        for (_,subjson) in jsonData["posts"] {
            let postsModel = CDPostModel.parseModel(subjson)
            array.append(postsModel)
        }
        model.posts = array
                
        return model
        
    }
    
}

class CDPagingModel: NSObject {
    
    var next_url: String?
    
    class func parseModel(jsonData: JSON) -> CDPagingModel {
        
        let model = CDPagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}

class CDPostModel: NSObject {
    
    var ad_monitors: NSArray?//
    var author: CDAuthorModel?
    var content_type: NSNumber?
    
    var content_url: String?
    var cover_image_url: String?
    var cover_webp_url: String?
    
    var created_at: NSNumber?
    var editor_id: NSNumber?
    var feature_list: NSArray?//
    
    var id: NSNumber?
    var label_ids: NSArray?//
    var liked: Bool?
    
    var likes_count: NSNumber?
    var published_at: NSNumber?
    var share_msg: String?
    
    var short_title: String?
    var status: NSNumber?
    var template: String?
    
    var title: String?
    var updated_at: NSNumber?
    var url: String?
    
    class func parseModel(jsonData: JSON) -> CDPostModel {
        
        let model = CDPostModel ()
        
        model.content_type = jsonData["content_type"].number
        model.content_url = jsonData["content_url"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        model.editor_id = jsonData["editor_id"].number
        
        model.id = jsonData["id"].number
        model.liked = jsonData["liked"].bool
        model.likes_count = jsonData["likes_count"].number
        
        model.published_at = jsonData["published_at"].number
        model.share_msg = jsonData["share_msg"].string
        model.short_title = jsonData["short_title"].string
        
        model.status = jsonData["status"].number
        model.template = jsonData["template"].string
        model.title = jsonData["title"].string
        
        model.updated_at = jsonData["updated_at"].number
        model.url = jsonData["url"].string
        
        model.author = CDAuthorModel.parseModel(jsonData["author"])
        
        return model
        
    }
    
}

class CDAuthorModel: NSObject {
    
    var avatar_url: String?
    var created_at: NSNumber?
    var id: NSNumber?
    var nickname: String?
    
    class func parseModel(jsonData: JSON) -> CDAuthorModel {
        
        let model = CDAuthorModel()
        
        model.avatar_url = jsonData["avatar_url"].string
        model.created_at = jsonData["created_at"].number
        model.id = jsonData["id"].number
        model.nickname = jsonData["nickname"].string
        
        return model
        
    }
    
}




