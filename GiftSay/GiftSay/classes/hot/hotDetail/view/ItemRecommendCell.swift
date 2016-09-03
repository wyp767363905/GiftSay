//
//  ItemRecommendCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ItemRecommendCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var dataModel: HotLikeDataModel?{
        
        didSet {
            showData()
        }
        
    }
    
    func showData(){
        
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
