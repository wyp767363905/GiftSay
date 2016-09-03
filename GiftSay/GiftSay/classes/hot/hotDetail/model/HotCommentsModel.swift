//
//  HotCommentsModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class HotCommentsModel: NSObject {
    
    var code: NSNumber?
    var data: HotCommentsDataModel?
    var message: String?
    
    class func praseModel(data: NSData) -> HotCommentsModel {
        
        let jsonData = JSON(data: data)
        
        let model = HotCommentsModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = HotCommentsDataModel.praseModel(dataDict)
        
        return model
        
    }
    
}

class HotCommentsDataModel: NSObject {
    
    var comments: Array<CommentsModel>?
    var paging: PagingModel?
    
    class func praseModel(jsonData: JSON) -> HotCommentsDataModel {
        
        let model = HotCommentsDataModel()
        
        var array = Array<CommentsModel>()
        for (_,subjson) in jsonData["comments"] {
            let cModel = CommentsModel.praseModel(subjson)
            array.append(cModel)
        }
        model.comments = array
        
        let dict = jsonData["paging"]
        model.paging = PagingModel.praseModel(dict)
        
        return model
        
    }
    
}

class CommentsModel: NSObject {
    
    var content: String?
    var created_at: NSNumber?
    var id: NSNumber?
    
    var images: Array<CommentsImagesModel>?
    var item_id: NSNumber?
    var replied_comment: CommentsCommentModel?
    
    var replied_user: CommentsUserModel?
    var reply_to_id: NSNumber?
    var show: Bool?
    
    var status: NSNumber?
    var user: CommentsUserModel?
    
    class func praseModel(jsonData: JSON) -> CommentsModel {
        
        let model = CommentsModel()
        
        model.content = jsonData["content"].string
        model.created_at = jsonData["content"].number
        model.id = jsonData["content"].number
        
        model.item_id = jsonData["content"].number
        model.reply_to_id = jsonData["content"].number
        model.show = jsonData["content"].bool
        
        model.status = jsonData["content"].number
        
        var array = Array<CommentsImagesModel>()
        for (_,subjson) in jsonData["images"] {
            let imageModel = CommentsImagesModel.praseModel(subjson)
            array.append(imageModel)
        }
        model.images = array
        
        let commentDict = jsonData[""]
        model.replied_comment = CommentsCommentModel.praseModel(commentDict)
        
        let  rUserModel = jsonData["replied_user"]
        model.replied_user = CommentsUserModel.praseModel(rUserModel)
        
        let  userModel = jsonData["user"]
        model.user = CommentsUserModel.praseModel(userModel)
        
        return model
        
    }
    
}

class CommentsImagesModel: NSObject {
    
    var h: NSNumber?
    var original: String?
    var thumbnail: String?
    
    var url: String?
    var w: NSNumber?
    
    class func praseModel(jsonData: JSON) -> CommentsImagesModel {
        
        let model = CommentsImagesModel()
        
        model.h = jsonData["h"].number
        model.original = jsonData["original"].string
        model.thumbnail = jsonData["thumbnail"].string
        
        model.url = jsonData["url"].string
        model.w = jsonData["w"].number
        
        return model
        
    }
    
}

class CommentsCommentModel: NSObject {
    
    var content: String?
    var created_at: NSNumber?
    var id: NSNumber?
    
    var images: NSArray?//没有数据
    var item_id: NSNumber?
    var reply_to_id: NSNull?
    
    var show: Bool?
    var status: NSNumber?
    var user_id: NSNumber?
    
    class func praseModel(jsonData: JSON) -> CommentsCommentModel {
        
        let model = CommentsCommentModel()
        
        model.content = jsonData["content"].string
        model.created_at = jsonData["created_at"].number
        model.id = jsonData["id"].number
        
        model.item_id = jsonData["item_id"].number
        model.reply_to_id = jsonData["reply_to_id"].null
        model.show = jsonData["show"].bool
        
        model.status = jsonData["status"].number
        model.user_id = jsonData["user_id"].number
        
        return model
        
    }
    
}

class CommentsUserModel: NSObject {
    
    var avatar_url: String?
    var can_mobile_login: Bool?
    var guest_uuid: NSNull?
    
    var id: NSNumber?
    var nickname: String?
    var role: NSNumber?
    
    class func praseModel(jsonData: JSON) -> CommentsUserModel {
        
        let model = CommentsUserModel()
        
        model.avatar_url = jsonData["avatar_url"].string
        model.can_mobile_login = jsonData["can_mobile_login"].bool
        model.guest_uuid = jsonData["guest_uuid"].null
        
        model.id = jsonData["id"].number
        model.nickname = jsonData["nickname"].string
        model.role = jsonData["role"].number
        
        return model
        
    }
    
}

class PagingModel: NSObject {
    
    var next_url: String?
    
    class func praseModel(jsonData: JSON) -> PagingModel {
        
        let model = PagingModel()
        
        model.next_url = jsonData["next_url"].string
        
        return model
        
    }
    
}



















