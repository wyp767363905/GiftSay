//
//  UILabel+Util.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

extension UILabel {
    
    class func createLabel(text: String?, textAlignment: NSTextAlignment?, font: UIFont?, textColor: UIColor?) -> UILabel {
        
        let label = UILabel()
        if let labelText = text {
            label.text = labelText
        }
        if let labelTextAlignment = textAlignment {
            label.textAlignment = labelTextAlignment
        }
        if let labelFont = font {
            label.font = labelFont
        }
        if let labelTextColor = textColor {
            label.textColor = labelTextColor
        }
        
        return label
        
    }
    
}



