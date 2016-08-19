//
//  GSSmallNavBarModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/17.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import SwiftyJSON

//小导航栏
class GSSmallNavBarModel: NSObject {
    
    var code: NSNumber?
    var data: GSSmallNavBarDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> GSSmallNavBarModel {
        
        let model = GSSmallNavBarModel()
        
        let jsonData = JSON(data: data)
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        
        let dataDict = jsonData["data"]
        model.data = GSSmallNavBarDataModel.parseModel(dataDict)
        
        return model
        
    }
    
}

class GSSmallNavBarDataModel: NSObject {
    
    var candidates: Array<GSSmallNavBarCandidatesModel>?
    var channels: Array<GSSmallNavBarChannelsModel>?
    
    class func parseModel(jsonData: JSON) -> GSSmallNavBarDataModel {
        
        let model = GSSmallNavBarDataModel()
        
        let candidatesArray = jsonData["candidates"]
        var cdArray = Array<GSSmallNavBarCandidatesModel>()
        for (_,subjson) in candidatesArray {
            let cdModel = GSSmallNavBarCandidatesModel.parseModel(subjson)
            cdArray.append(cdModel)
        }
        model.candidates = cdArray
        
        let channelsArray = jsonData["channels"]
        var cnArray = Array<GSSmallNavBarChannelsModel>()
        for (_,subjson) in channelsArray {
            let cnModel = GSSmallNavBarChannelsModel.parseModel(subjson)
            cnArray.append(cnModel)
        }
        model.channels = cnArray
        
        return model
        
    }
    
}

class GSSmallNavBarCandidatesModel: NSObject {
    
    var editable: Bool?
    var id: NSNumber?
    var name: String?
    
    class func parseModel(jsonData: JSON) -> GSSmallNavBarCandidatesModel {
        
        let model = GSSmallNavBarCandidatesModel()
        
        model.editable = jsonData["editable"].bool
        model.id = jsonData["id"].number
        model.name = jsonData["name"].string
        
        return model
        
    }
    
}

class GSSmallNavBarChannelsModel: NSObject {
    
    var editable: Bool?
    var id: NSNumber?
    var name: String?
    
    class func parseModel(jsonData: JSON) -> GSSmallNavBarChannelsModel {
        
        let model = GSSmallNavBarChannelsModel()
        
        model.editable = jsonData["editable"].bool
        model.id = jsonData["id"].number
        model.name = jsonData["name"].string
        
        return model
        
    }
    
}

