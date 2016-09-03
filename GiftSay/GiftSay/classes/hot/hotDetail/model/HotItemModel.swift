//
//  HotItemModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class HotItemModel: NSObject {
    
    var code: NSNumber?
    var data: HotItemDataModel?
    var message: String?
    
    class func praseModel(data: NSData) -> HotItemModel {
        
        let jsonData = JSON(data: data)
        
        let model = HotItemModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = HotItemDataModel.praseModel(dataDict)
        
        return model
        
    }
    
}

class HotItemDataModel: NSObject {
    
    var ad_monitors: NSNull?
    var authentic: NSNull?
    var brand_id: NSNull?
    
    var brand_order: NSNull?
    var category_id: NSNumber?
    var comments_count: NSNumber?
    
    var cover_image_url: String?
    var cover_webp_url: String?
    var created_at: NSNumber?
    
    var desc: String?    //description
    var detail_html: String?
    var editor_id: NSNumber?
    
    var favorited: Bool?
    var favorites_count: NSNumber?
    var id: NSNumber?
    
    var image_urls: Array<HotItemImageModel>?
    var keywords: String?
    var liked: Bool?
    
    var likes_count: NSNumber?
    var name: String?
    var post_ids: NSArray?
    
    var price: String?
    var purchase_id: String?
    var purchase_shop_id: NSNull?
    
    var purchase_status: NSNumber?
    var purchase_type: NSNumber?
    var purchase_url: String?
    
    var shares_count: NSNumber?
    var short_description: String?
    var source: HotItemSourceModel?
    
    var subcategory_id: NSNumber?
    var updated_at: NSNumber?
    var url: String?
    
    var webp_urls: Array<HotItemWebpModel>?
    
    class func praseModel(jsonData: JSON) -> HotItemDataModel {
        
        let model = HotItemDataModel()
        
        model.ad_monitors = jsonData["ad_monitors"].null
        model.authentic = jsonData["authentic"].null
        model.brand_id = jsonData["brand_id"].null
        
        model.brand_order = jsonData["brand_order"].null
        model.category_id = jsonData["category_id"].number
        model.comments_count = jsonData["comments_count"].number
        
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        
        model.desc = jsonData["description"].string
        model.detail_html = jsonData["desc"].string
        model.editor_id = jsonData["editor_id"].number
        
        model.favorited = jsonData["favorited"].bool
        model.favorites_count = jsonData["favorites_count"].number
        model.id = jsonData["id"].number
        
        
        model.keywords = jsonData["keywords"].string
        model.liked = jsonData["liked"].bool
        model.likes_count = jsonData["likes_count"].number
        
        model.name = jsonData["name"].string
        model.price = jsonData["price"].string
        model.purchase_id = jsonData["purchase_id"].string
        
        model.purchase_shop_id = jsonData["purchase_shop_id"].null
        model.purchase_status = jsonData["purchase_status"].number
        model.purchase_type = jsonData["purchase_type"].number
        
        model.purchase_url = jsonData["purchase_url"].string
        model.shares_count = jsonData["shares_count"].number
        model.short_description = jsonData["short_description"].string
        
        
        model.subcategory_id = jsonData["subcategory_id"].number
        model.updated_at = jsonData["updated_at"].number
        model.url = jsonData["url"].string
        
        var imageArray = Array<HotItemImageModel>()
        for (_,subjson) in jsonData["image_urls"] {
            let imageModel = HotItemImageModel.praseModel(subjson)
            imageArray.append(imageModel)
        }
        model.image_urls = imageArray
        
        let sourceDict = jsonData["source"]
        model.source = HotItemSourceModel.praseModel(sourceDict)
        
        var webpArray = Array<HotItemWebpModel>()
        for (_,subjson) in jsonData["webp_urls"] {
            let webpModel = HotItemWebpModel.praseModel(subjson)
            webpArray.append(webpModel)
        }
        model.webp_urls = webpArray
        
        return model
        
    }

}

class HotItemImageModel: NSObject {
    
    var urlDict: String?
    
    class func praseModel(jsonData: JSON) -> HotItemImageModel {
        
        let model = HotItemImageModel()
        
        model.urlDict = jsonData.string
        
        return model
        
    }
    
}

class HotItemSourceModel: NSObject {
    
    var button_title: String?
    var name: String?
    var page_title: String?
    var type: String?
    
    class func praseModel(jsonData: JSON) -> HotItemSourceModel {
        
        let model = HotItemSourceModel()
        
        model.button_title = jsonData["button_title"].string
        model.name = jsonData["name"].string
        model.page_title = jsonData["page_title"].string
        model.type = jsonData["type"].string
        
        return model
        
    }
    
}

class HotItemWebpModel: NSObject {
    
    var urlDict: String?
    
    class func praseModel(jsonData: JSON) -> HotItemWebpModel {
        
        let model = HotItemWebpModel()
        
        model.urlDict = jsonData.string
        
        return model
        
    }

}

















