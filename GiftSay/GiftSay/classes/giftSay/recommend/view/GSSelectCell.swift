//
//  GSSelectCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSSelectCell: UITableViewCell {
    
    //显示数据
    var model: GSSelectrDataModel?
    
    var itemsModel:GSSelectItemsModel?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        let authorModel = itemsModel?.author
        
        let columnModel = itemsModel?.column

        for j in 0..<8 {
            
            let num = 200+j
            let subView = contentView.viewWithTag(num)
            if ((subView?.isKindOfClass(UILabel.self)) == true) {
                if num == 200 {
                    let label = subView as! UILabel
                    label.text = columnModel?.category
                }else if num == 201 {
                    let label = subView as! UILabel
                    label.text = columnModel?.title
                }else if num == 203 {
                    let label = subView as! UILabel
                    label.text = authorModel?.nickname
                }else if num == 205 {
                    let label = subView as! UILabel
                    label.text = itemsModel?.title
                }else if num == 207 {
                    let label = subView as! UILabel
                    label.text = "\((itemsModel?.likes_count)!)"
                }
            }
            
            if ((subView?.isKindOfClass(UIImageView)) == true) {
                if num == 202 {
                    let url = NSURL(string: (authorModel?.avatar_url)!)
                    let imageView = subView as! UIImageView
                    imageView.layer.cornerRadius = 10
                    imageView.clipsToBounds = true
                    imageView.kf_setImageWithURL(url, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }else if num == 204 {
                    let url = NSURL(string: (itemsModel?.cover_image_url)!)
                    let imageView = subView as! UIImageView
                    imageView.kf_setImageWithURL(url, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
            }
            
        }
        
    }
    
    class func createSelectCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withItemsModel itemsModel: [GSSelectItemsModel]) -> GSSelectCell {
        
        let cellId = "selectCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? GSSelectCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("GSSelectCell", owner: nil, options: nil).last as? GSSelectCell
        }
        
        cell?.itemsModel = itemsModel[indexPath.row]
        
        return cell!
    }
    
    //点击进详情
    @IBAction func detailAction(sender: UIButton) {
    }
    
    //点赞
    @IBAction func thumbUpAction(sender: UIButton) {
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
