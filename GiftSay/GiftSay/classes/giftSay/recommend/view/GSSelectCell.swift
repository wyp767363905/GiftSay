//
//  GSSelectCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/19.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSSelectCell: UITableViewCell {
    
    var clickClosure: ADCellClosure?
    
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
                    imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }else if num == 204 {
                    let url = NSURL(string: (itemsModel?.cover_image_url)!)
                    let imageView = subView as! UIImageView
                    imageView.userInteractionEnabled = false
                    imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
            }
            
        }
        
    }
    
    class func createSelectCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withItemsModel itemsModel: [GSSelectItemsModel], clickClosure: ADCellClosure?) -> GSSelectCell {
        
        let cellId = "selectCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? GSSelectCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("GSSelectCell", owner: nil, options: nil).last as? GSSelectCell
        }
        
        cell?.clickClosure = clickClosure
        cell?.itemsModel = itemsModel[indexPath.row]
        
        return cell!
    }
    
    //点击进详情
    @IBAction func detailAction(sender: UIButton) {
        
        if sender.tag == 100 {
            
        }else if sender.tag == 101 {
            
        }else if sender.tag == 102 {
            
            clickClosure!("\((itemsModel?.id)!)", (itemsModel?.type)!, itemsModel?.url)
        }
        
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
