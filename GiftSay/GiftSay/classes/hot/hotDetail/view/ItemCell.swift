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
        
        let url = NSURL(string: (dataModel?.cover_image_url)!)
        bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        titleLabel.text = (dataModel?.name)!
        
        priceLabel.text = (dataModel?.price)!
        
        descLabel.text = (dataModel?.desc)!
        
        //修改高度
        let descStr = NSString(string: (dataModel?.desc)!)
        let dict = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        let rect = descStr.boundingRectWithSize(CGSizeMake(kScreenWidth-20, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: dict, context: nil)
        var height = CGFloat(Int(rect.size.height))
        if rect.size.height - height > 0 {
            height += 1
        }
        descLabel.snp_makeConstraints { (make) in
            make.height.equalTo(height)
        }
        
    }
    
    class func heightForModel(model: HotItemDataModel) -> CGFloat {
        
        var offsetY: CGFloat = 0
        
        let picH: CGFloat = 350
        let spaceY: CGFloat = 10
        let tH: CGFloat = 20
        let pH: CGFloat = 20
        
        let descStr = NSString(string: model.desc!)
        let dict = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        let rect = descStr.boundingRectWithSize(CGSizeMake(kScreenWidth-20, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: dict, context: nil)
        
        var height = CGFloat(Int(rect.size.height))
        
        if rect.size.height - height > 0 {
            height += 1
        }
        
        offsetY = picH+tH+pH+spaceY*4+height
        
        return offsetY
        
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
