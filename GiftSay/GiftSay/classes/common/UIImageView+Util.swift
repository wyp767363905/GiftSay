//
//  UIImageView+Util.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

extension UIImageView {
    
    class func createImageView(imageName: String?) -> UIImageView {
        
        let imageView = UIImageView()
        if let imageViewImageName = imageName {
            imageView.image = UIImage(named: imageViewImageName)?.imageWithRenderingMode(.AlwaysOriginal)
        }
        
        return imageView
        
    }
    
}




