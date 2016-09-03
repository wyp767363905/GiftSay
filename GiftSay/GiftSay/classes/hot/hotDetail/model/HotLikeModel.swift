//
//  HotLikeModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class HotLikeModel: NSObject {
    
    var code: NSNumber?
    var data: HotLikeDataModel?
    var message: String?
    
    class func praseModel(data: NSData) -> HotLikeModel {
        
        let jsonData = JSON(data: data)
        
        let model = HotLikeModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = HotLikeDataModel.praseModel(dataDict)
        
        return model
        
    }
    
}

class HotLikeDataModel: NSObject {
    
    var recommend_items: Array<HotLikeItemsModel>?//12
    var recommend_posts: Array<HotLikePostsModel>?//5
    
    class func praseModel(jsonData: JSON) -> HotLikeDataModel {
        
        let model = HotLikeDataModel()
        
        var itemArray = Array<HotLikeItemsModel>()
        for (_,subjson) in jsonData["recommend_items"] {
            let itemModel = HotLikeItemsModel.praseModel(subjson)
            itemArray.append(itemModel)
        }
        model.recommend_items = itemArray
        
        var postArray = Array<HotLikePostsModel>()
        for (_,subjson) in jsonData["recommend_posts"] {
            let postModel = HotLikePostsModel.praseModel(subjson)
            postArray.append(postModel)
        }
        model.recommend_posts = postArray
        
        return model
        
    }
    
}

class HotLikeItemsModel: NSObject {
    
    var brand_id: NSNull?
    var brand_order: NSNull?
    var category_id: NSNumber?
    
    var cover_image_url: String?
    var cover_webp_url: NSNull?
    var created_at: NSNumber?
    
    var desc: String?    //description
    var editor_id: NSNumber?
    var favorites_count: NSNumber?
    
    var id: NSNumber?
    var image_urls: Array<HotLikeItemsImageModel>?
    var name: String?
    
    var post_ids: NSArray?//
    var price: String?
    var purchase_id: String?
    
    var purchase_status: NSNumber?
    var purchase_type: NSNumber?
    var purchase_url: String?
    
    var subcategory_id: NSNumber?
    var updated_at: NSNumber?
    var url: String?
    
    var webp_urls: Array<HotLikeItemsWebpModel>?
    
    class func praseModel(jsonData: JSON) -> HotLikeItemsModel {
        
        let model = HotLikeItemsModel()
        
        model.brand_id = jsonData["brand_id"].null
        model.brand_order = jsonData["brand_order"].null
        model.category_id = jsonData["category_id"].number
        
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].null
        model.created_at = jsonData["created_at"].number
        
        model.desc = jsonData["description"].string
        model.editor_id = jsonData["editor_id"].number
        model.favorites_count = jsonData["favorites_count"].number
        
        model.id = jsonData["id"].number
        model.name = jsonData["name"].string
        model.price = jsonData["price"].string
        
        model.purchase_id = jsonData["purchase_id"].string
        model.purchase_status = jsonData["purchase_status"].number
        model.purchase_type = jsonData["purchase_type"].number
        
        model.purchase_url = jsonData["purchase_url"].string
        model.subcategory_id = jsonData["subcategory_id"].number
        model.updated_at = jsonData["updated_at"].number
        
        model.url = jsonData["url"].string
        
        var imageArray = Array<HotLikeItemsImageModel>()
        for i in 0..<jsonData["image_urls"].count {
            let imageModel = HotLikeItemsImageModel.praseModel(jsonData["image_urls"][i], index: i)
            imageArray.append(imageModel)
        }
        model.image_urls = imageArray
        
        var webpArray = Array<HotLikeItemsWebpModel>()
        for i in 0..<jsonData["webp_urls"].count {
            let webpModel = HotLikeItemsWebpModel.praseModel(jsonData["webp_urls"][i], index: i)
            webpArray.append(webpModel)
        }
        model.webp_urls = webpArray
        
        return model
        
    }
    
}

class HotLikeItemsImageModel: NSObject {
    
    var fristUrl: String?
    var secondUrl: String?
    var thirdUrl: String?
    var fourthUrl: String?
    
    class func praseModel(jsonData: JSON, index: Int) -> HotLikeItemsImageModel {
        
        let model = HotLikeItemsImageModel()
        
        if index == 0 {
            
            model.fristUrl = jsonData.string
            
        }else if index == 1 {
            
            model.secondUrl = jsonData.string
            
        }else if index == 2 {
            
            model.thirdUrl = jsonData.string
            
        }else if index == 3 {
            
            model.fourthUrl = jsonData.string
            
        }
        
        return model
        
    }
    
}

class HotLikeItemsWebpModel: NSObject {
    
    var fristUrl: String?
    var secondUrl: String?
    var thirdUrl: String?
    var fourthUrl: String?
    
    class func praseModel(jsonData: JSON, index: Int) -> HotLikeItemsWebpModel {
        
        let model = HotLikeItemsWebpModel()
        
        if index == 0 {
            
            model.fristUrl = jsonData.string
            
        }else if index == 1 {
            
            model.secondUrl = jsonData.string
            
        }else if index == 2 {
            
            model.thirdUrl = jsonData.string
            
        }else if index == 3 {
            
            model.fourthUrl = jsonData.string
            
        }
        
        return model
        
    }
    
}

class HotLikePostsModel: NSObject {
    
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
    
    class func praseModel(jsonData: JSON) -> HotLikePostsModel {
        
        let model = HotLikePostsModel()
        
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
















