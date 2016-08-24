//
//  FunctionBtnCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class FunctionBtnCell: UITableViewCell {
    
    func configModel(){
        
        let imageNames = ["shopping_cart","orders","gift_certificate","attention","customer_service"]
        let textNames = ["购物车","订单","礼券","关注","客服"]
        
        for i in 0..<imageNames.count {
            
            let subImage = contentView.viewWithTag(200+i)
            let subLabel = contentView.viewWithTag(300+i)
            
            if subImage?.isKindOfClass(UIImageView.self) == true {
                
                let imageView = subImage as! UIImageView
                imageView.image = UIImage(named: imageNames[i])
                
            }
            
            if subLabel?.isKindOfClass(UILabel.self) == true {
                
                let label = subLabel as! UILabel
                label.text = textNames[i]
                
            }
            
        }
        
    }
    
    @IBAction func clickBtn(sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
