//
//  ItemCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var descLabel: UILabel!
    
    var dataModel: HotItemDataModel?{
        
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
    
    class func createItemCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: HotItemDataModel) -> ItemCell {
        
        let cellId = "itemCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ItemCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("ItemCell", owner: nil, options: nil).last as? ItemCell
        }
        cell?.dataModel = dataModel
        
        return cell!
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
