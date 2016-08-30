//
//  ADPostLikeModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

class ADPostLikeModel: NSObject {
    
    var code: NSNumber?
    var data: ADPostLikeDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> ADPostLikeModel {
        
        let jsonData = JSON(data: data)
        
        let model = ADPostLikeModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = ADPostLikeDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class ADPostLikeDataModel: NSObject {
    
    var recommend_posts: Array<ADPostLikePostsModel>?
    
    class func parseModel(jsonData: JSON) -> ADPostLikeDataModel {
        
        let model = ADPostLikeDataModel()
        
        var array = Array<ADPostLikePostsModel>()
        for (_,subjson) in jsonData["recommend_posts"] {
            let postsModel = ADPostLikePostsModel.parseModel(subjson)
            array.append(postsModel)
        }
        model.recommend_posts = array
        
        return model
        
    }
    
}

class ADPostLikePostsModel: NSObject {
    
    var ad_monitors: NSNull?
    var content_type: NSNumber?
    var content_url: String?
    
    var cover_image_url: String?
    var cover_webp_url: String?
    var created_at: NSNumber?
    
    var editor_id: NSNumber?
    var feature_list: NSArray?
    var id: NSNumber?
    
    var label_ids: NSArray?
    var likes_count: NSNumber?
    var published_at: NSNumber?
    
    var share_msg: String?
    var short_title: String?
    var status: NSNumber?
    
    var template: String?
    var title: String?
    var updated_at: NSNumber?
    
    var url: String?
    
    class func parseModel(jsonData: JSON) -> ADPostLikePostsModel {
        
        let model = ADPostLikePostsModel()
        
        model.ad_monitors = jsonData["ad_monitors"].null
        model.content_type = jsonData["content_type"].number
        model.content_url = jsonData["content_url"].string
        
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        
        model.editor_id = jsonData["editor_id"].number
        model.id = jsonData["id"].number
        model.likes_count = jsonData["likes_count"].number
        
        model.published_at = jsonData["published_at"].number
        model.share_msg = jsonData["share_msg"].string
        model.short_title = jsonData["short_title"].string
        
        model.status = jsonData["status"].number
        model.template = jsonData["template"].string
        model.title = jsonData["title"].string
        
        model.updated_at = jsonData["updated_at"].number
        model.url = jsonData["url"].string
        
        return model
        
    }
    
}

















