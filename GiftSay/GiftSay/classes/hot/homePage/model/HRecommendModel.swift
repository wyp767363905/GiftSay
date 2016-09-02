//
//  HRecommendModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

class HRecommendModel: NSObject {
    
    var code: NSNumber?
    var data: HRecommendDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> HRecommendModel {
        
        let model = HRecommendModel()
        let jsonData = JSON(data: data)
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = HRecommendDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class HRecommendDataModel: NSObject {
    
    var items: Array<HRecommendItemsModel>?
    var paging: HRecommendPagingModel?
    
    class func parseModel(jsonData: JSON) -> HRecommendDataModel {
        
        let model = HRecommendDataModel()
        
        let itemsArray = jsonData["items"]
        var iArray = Array<HRecommendItemsModel>()
        for (_,subjson) in itemsArray {
            let iModel = HRecommendItemsModel.parseModel(subjson)
            iArray.append(iModel)
        }
        model.items = iArray
        
        let pagingDict = jsonData["paging"]
        model.paging = HRecommendPagingModel.parseModel(pagingDict)
        
        return model
        
    }
    
}

class HRecommendItemsModel: NSObject {
    
    var data: HRecommendItemsDataModel?
    var type: String?
    
    class func parseModel(jsonData: JSON) -> HRecommendItemsModel {
        
        let model = HRecommendItemsModel()
        
        model.type = jsonData["type"].string
        
        let dataDict = jsonData["data"]
        model.data = HRecommendItemsDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class HRecommendItemsDataModel: NSObject {
    
    var ad_monitors: Array<HRecommendADMonitorsModel>?
    var brand_id: NSNull?
    var brand_order: NSNull?
    
    var category_id: NSNull?
    var cover_image_url: String?
    var cover_webp_url: String?
    
    var created_at: NSNumber?
    var desc: String?   //description
    var editor_id: NSNumber?
    
    var favorites_count: NSNumber?
    var id: NSNumber?
    var image_urls: Array<HRecommendImageUrlsModel>?
    
    var is_favorite: Bool?
    var keywords: String?
    var name: String?
    
    var post_ids: Array<HRecommendPostIdsModel>?
    var price: String?
    var purchase_id: NSNull?
    
    var purchase_shop_id: NSNull?
    var purchase_status: NSNumber?
    var purchase_type: NSNumber?
    
    var purchase_url: String?
    var subcategory_id: NSNull?
    var updated_at: NSNumber?
    
    var url: String?
    var webp_urls: Array<HRecommendWebpUrlsModel>?
    
    class func parseModel(jsonData: JSON) -> HRecommendItemsDataModel {
        
        let model = HRecommendItemsDataModel()
        
        model.brand_id = jsonData["brand_id"].null
        model.brand_order = jsonData["brand_order"].null
        model.category_id = jsonData["category_id"].null
        
        model.cover_image_url = jsonData["cover_image_url"].string
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        
        model.desc = jsonData["description"].string
        model.editor_id = jsonData["editor_id"].number
        model.favorites_count = jsonData["favorites_count"].number
        
        model.id = jsonData["id"].number
        model.is_favorite = jsonData["is_favorite"].bool
        model.keywords = jsonData["keywords"].string
        
        model.name = jsonData["name"].string
        model.price = jsonData["price"].string
        model.purchase_id = jsonData["purchase_id"].null
        
        model.purchase_shop_id = jsonData["purchase_shop_id"].null
        model.purchase_status = jsonData["purchase_status"].number
        model.purchase_type = jsonData["purchase_type"].number
        
        model.purchase_url = jsonData["purchase_url"].string
        model.subcategory_id = jsonData["subcategory_id"].null
        model.updated_at = jsonData["updated_at"].number
        
        model.url = jsonData["url"].string
        
        let admArray = jsonData["ad_monitors"]
        var adArray = Array<HRecommendADMonitorsModel>()
        for (_,subjson) in admArray {
            let adModel = HRecommendADMonitorsModel.parseModel(subjson)
            adArray.append(adModel)
        }
        model.ad_monitors = adArray
        
        let imageArray = jsonData["image_urls"]
        var iuArray = Array<HRecommendImageUrlsModel>()
        for (_,subjson) in imageArray {
            let iuModel = HRecommendImageUrlsModel.parseModel(subjson)
            iuArray.append(iuModel)
        }
        model.image_urls = iuArray
        
        let postmArray = jsonData["post_ids"]
        var pArray = Array<HRecommendPostIdsModel>()
        for (_,subjson) in postmArray {
            let pModel = HRecommendPostIdsModel.parseModel(subjson)
            pArray.append(pModel)
        }
        model.post_ids = pArray
        
        let webpmArray = jsonData["webp_urls"]
        var wArray = Array<HRecommendWebpUrlsModel>()
        for (_,subjson) in webpmArray {
            let wModel = HRecommendWebpUrlsModel.parseModel(subjson)
            wArray.append(wModel)
        }
        model.webp_urls = wArray
        
        
        
        return model
        
    }
    
}

class HRecommendADMonitorsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> HRecommendADMonitorsModel {
        
        let model = HRecommendADMonitorsModel()
        
        return model
    }
    
}

class HRecommendImageUrlsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> HRecommendImageUrlsModel {
        
        let model = HRecommendImageUrlsModel()
        
        return model
    }
    
}

class HRecommendPostIdsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> HRecommendPostIdsModel {
        
        let model = HRecommendPostIdsModel()
        
        return model
    }
    
}

class HRecommendWebpUrlsModel: NSObject {
    
    class func parseModel(jsonData: JSON) -> HRecommendWebpUrlsModel {
        
        let model = HRecommendWebpUrlsModel()
        
        return model
    }
    
}

class HRecommendPagingModel: NSObject {
    
    var next_url: String?
    
    class func parseModel(jsonData: JSON) -> HRecommendPagingModel {
        
        let model = HRecommendPagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}







