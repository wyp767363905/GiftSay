//
//  ADCollectionModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

class ADCollectionModel: NSObject {
    
    var code: NSNumber?
    var data: ADCollectionDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> ADCollectionModel {
        
        let jsonData = JSON(data: data)
        
        let model = ADCollectionModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = ADCollectionDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class ADCollectionDataModel: NSObject {
    
    var banner_image_url: String?
    var banner_webp_url: String?
    var cover_image_url: String?
    
    var cover_webp_url: String?
    var created_at: NSNumber?
    var id: NSNumber?
    
    var paging: ADCollectionPagingModel?
    var posts: Array<ADCollectionPostsModel>?
    var posts_count: NSNumber?
    
    var status: NSNumber?
    var subtitle: String?
    var title: String?
    
    var updated_at: NSNumber?
    var url: String?
    
    class func parseModel(jsonData: JSON) -> ADCollectionDataModel {
        
        let model = ADCollectionDataModel()
        
        model.banner_image_url = jsonData["banner_image_url"].string
        model.banner_webp_url = jsonData["banner_webp_url"].string
        model.cover_image_url = jsonData["cover_image_url"].string
        
        model.cover_webp_url = jsonData["cover_webp_url"].string
        model.created_at = jsonData["created_at"].number
        model.id = jsonData["id"].number
        
        model.posts_count = jsonData["posts_count"].number
        model.status = jsonData["status"].number
        model.subtitle = jsonData["subtitle"].string
        
        model.title = jsonData["title"].string
        model.updated_at = jsonData["updated_at"].number
        model.url = jsonData["url"].string
        
        let pagingDict = jsonData["paging"]
        model.paging = ADCollectionPagingModel.parseModel(pagingDict)
        
        var array = Array<ADCollectionPostsModel>()
        for (_,subjson) in jsonData["posts"] {
            let postsModel = ADCollectionPostsModel.parseModel(subjson)
            array.append(postsModel)
        }
        model.posts = array
        
        return model
        
    }

}

class ADCollectionPagingModel: NSObject {
    
    var next_url: String?
    
    class func parseModel(jsonData: JSON) -> ADCollectionPagingModel {
        
        let model = ADCollectionPagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}

class ADCollectionPostsModel: NSObject {
    
    var ad_monitors: NSArray?
    var author: ADCollectionAuthorModel?
    var column: ADCollectionColumnModel?
    
    var content_type: NSNumber?
    var content_url: String?
    var cover_image_url: String?
    
    var cover_webp_url: String?
    var created_at: NSNumber?
    var editor_id: NSNumber?
    
    var feature_list: NSArray?
    var id: NSNumber?
    var label_ids: NSArray?
    
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
    
    class func parseModel(jsonData: JSON) -> ADCollectionPostsModel {
        
        let model = ADCollectionPostsModel()
        
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
        
        model.type = jsonData["type"].string
        model.updated_at = jsonData["updated_at"].number
        model.url = jsonData["url"].string
        
        let authorDict = jsonData["author"]
        model.author = ADCollectionAuthorModel.parseModel(authorDict)
        
        let columnDict = jsonData["column"]
        model.column = ADCollectionColumnModel.parseModel(columnDict)
        
        return model
        
    }

}

class ADCollectionAuthorModel: NSObject {
    
    var avatar_url: String?
    var avatar_webp_url: NSNull?
    var created_at: NSNumber?
    
    var id: NSNumber?
    var nickname: String?
    
    class func parseModel(jsonData: JSON) -> ADCollectionAuthorModel {
        
        let model = ADCollectionAuthorModel()
        
        model.avatar_url = jsonData["avatar_url"].string
        model.avatar_webp_url = jsonData["avatar_webp_url"].null
        model.created_at = jsonData["created_at"].number
        
        model.id = jsonData["id"].number
        model.nickname = jsonData["nickname"].string
        
        return model
    }

}

class ADCollectionColumnModel: NSObject {
    
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
    
    class func parseModel(jsonData: JSON) -> ADCollectionColumnModel {
        
        let model = ADCollectionColumnModel()
        
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












