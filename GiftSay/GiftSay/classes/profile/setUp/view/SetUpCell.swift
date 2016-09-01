//
//  SetUpCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class SetUpCell: UITableViewCell {

    @IBOutlet weak var smallBgImageView: UIImageView!
    
    @IBOutlet weak var smallTitleLabel: UILabel!
    
    @IBOutlet weak var smallDescLabel: UILabel!
    
    @IBOutlet weak var smallImageView: UIImageView!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
