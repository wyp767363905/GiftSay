//
//  ItemAndStrategyCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol ItemAndStrategyCellDelegate: NSObjectProtocol {
    
    func itemAndStrategyJumpLogin(vc: UIViewController)
    
}

class ItemAndStrategyCell: UITableViewCell {
    
    @IBOutlet weak var noLoginLabel: UILabel!
    
    weak var delegate: ItemAndStrategyCellDelegate?
    
    var isLogin: Bool = false
    
    func configModel() {
        
        noLoginLabel.text = "登录以享受更多功能"
        
        let subView = contentView.viewWithTag(200)
        if subView?.isKindOfClass(UIImageView.self) == true {
            let imageView = subView as! UIImageView
            imageView.layer.borderWidth = 1
            imageView.layer.borderColor = UIColor.whiteColor().CGColor
            imageView.layer.cornerRadius = 45/2
            imageView.clipsToBounds = true
        }
        
        let subBtn = contentView.viewWithTag(100)
        if subBtn?.isKindOfClass(UIButton.self) == true {
            
            let btn = subBtn as! UIButton
            btn.selected = true
            btn.backgroundColor = UIColor.redColor()
            
        }
        
    }
    
    @IBAction func clickBtn(sender: UIButton) {
        
        let index = sender.tag-100
        if index == 0 {
            
            sender.selected = true
            sender.backgroundColor = UIColor.redColor()
            let subBtn = contentView.viewWithTag(101)
            if subBtn?.isKindOfClass(UIButton.self) == true {
                
                let btn = subBtn as! UIButton
                btn.selected = false
                btn.backgroundColor = UIColor.whiteColor()
                
            }
            
        }else if index == 1 {
            
            sender.selected = true
            sender.backgroundColor = UIColor.redColor()
            let subBtn = contentView.viewWithTag(100)
            if subBtn?.isKindOfClass(UIButton.self) == true {
                
                let btn = subBtn as! UIButton
                btn.selected = false
                btn.backgroundColor = UIColor.whiteColor()
                
            }
            
        }
        
    }
    
    @IBAction func noLoginAction(sender: UIButton) {
        
        if !(isLogin) {
            
            let loginCtrl = LoginViewController()
            
            self.delegate?.itemAndStrategyJumpLogin(loginCtrl)
            
        }
        
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
