//
//  ADPostModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

class ADPostModel: NSObject {
    
    var code: NSNumber?
    var data: ADPostDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> ADPostModel {
        
        let jsonData = JSON(data: data)
        
        let model = ADPostModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dict = jsonData["data"]
        model.data = ADPostDataModel.parseModel(dict)
        
        return model
        
    }
    
}

class ADPostDataModel: NSObject {
    
    var ad_monitors: NSNull?
    var column: ADPostModelColumnModel?
    var column_bottom: String?
    
    var column_header: String?
    var comments_count: NSNumber?
    var content: NSNull?
    
    var content_type: NSNumber?
    var content_url: String?
    var cover_image_url: String?
    
    var cover_webp_url: String?
    var created_at: NSNumber?
    var editor_id: NSNumber?
    
    var feature_list: NSArray?
    var id: NSNumber?
    var item_ad_monitors: NSDictionary?
    
    var label_ids: NSArray?
    var liked: Bool?
    var likes_count: NSNumber?
    
    var published_at: NSNumber?
    var share_msg: String?
    var shares_count: NSNumber?
    
    var short_title: String?
    var status: NSNumber?
    var template: String?
    
    var title: String?
    var updated_at: NSNumber?
    var url: String?
    
    var content_html: String?
    
    class func parseModel(jsonData: JSON) -> ADPostDataModel {
        
        let model = ADPostDataModel()
        
        model.ad_monitors = jsonData["ad_monitors"].null
        model.column_bottom = jsonData["column_bottom"].string
        model.column_header = jsonData["column_header"].string
        
        model.comments_count = jsonData["comments_count"].number
        model.content = jsonData["content"].null
        model.content_type = jsonData["content_type"].number
        
        model.content_url = jsonData["content_url"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        
        model.created_at = jsonData["created_at"].number
        model.editor_id = jsonData["editor_id"].number
        //model.feature_list = jsonData[""]
        
        model.id = jsonData["id"].number
        //model.item_ad_monitors = jsonData[""]
        //model.label_ids = jsonData[""]
        
        model.liked = jsonData["liked"].bool
        model.likes_count = jsonData["likes_count"].number
        model.short_title = jsonData["short_title"].string
        
        model.status = jsonData["status"].number
        model.template = jsonData["template"].string
        model.title = jsonData["title"].string
        
        model.updated_at = jsonData["updated_at"].number
        model.url = jsonData["url"].string
        model.content_html = jsonData["content_html"].string
        
        let dict = jsonData["dict"]
        model.column = ADPostModelColumnModel.parseModel(dict)
        
        return model
        
    }
    
}

class ADPostModelColumnModel: NSObject {
    
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
    
    class func parseModel(jsonData: JSON) -> ADPostModelColumnModel {
        
        let model = ADPostModelColumnModel()
        
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
















