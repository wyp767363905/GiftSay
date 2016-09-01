//
//  SetCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class SetCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    func configModel(model: RecommendAppsModel){
        
        let url = NSURL(string: model.icon_url!)
        bgImageView.kf_setImageWithURL(url)
        
        titleLabel.text = (model.title)!
        
        descLabel.text = (model.subtitle)!
        
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
