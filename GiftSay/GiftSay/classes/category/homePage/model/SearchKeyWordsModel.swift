//
//  SearchKeyWordsModel.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit
import SwiftyJSON

class SearchKeyWordsModel: NSObject {
    
    var code: NSNumber?
    var data: SearchKeyWordsDataModel?
    var message: String?
    
    class func parseModel(data: NSData) -> SearchKeyWordsModel {
        
        let jsonData = JSON(data: data)
        
        let model = SearchKeyWordsModel()
        
        model.code = jsonData["code"].number
        model.message = jsonData["message"].string
        model.data = SearchKeyWordsDataModel.parseModel(jsonData["data"])
        
        return model
        
    }
    
}

class SearchKeyWordsDataModel: NSObject {
    
    var hot_words: Array<String>?
    var placeholder: String?
    
    class func parseModel(jsonData: JSON) -> SearchKeyWordsDataModel {
        
        let model = SearchKeyWordsDataModel()
        
        model.placeholder = jsonData["placeholder"].string
        
        var array = Array<String>()
        for (_,subjson) in jsonData["hot_words"] {
            let str = subjson.stringValue
            array.append(str)
        }
        model.hot_words = array
        
        return model
        
    }
    
}





















