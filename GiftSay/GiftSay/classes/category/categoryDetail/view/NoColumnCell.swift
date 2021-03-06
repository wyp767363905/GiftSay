//
//  NoColumnCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class NoColumnCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorImageVeiw: UIImageView!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    var itemModel: NCDItemsModel?{
        
        didSet {
            
            if itemModel != nil {
                
                showData()
                
            }
            
        }
        
    }
    
    func showData(){
        
        categoryLabel.text = itemModel?.column?.category
        
        titleLabel.text = itemModel?.column?.title
        
        descLabel.text = itemModel?.title
        
        likesCountLabel.text = "\((itemModel?.likes_count)!)"
        
        authorLabel.text = itemModel?.author?.nickname
        
        let url = NSURL(string: (itemModel?.author?.avatar_url)!)
        authorImageVeiw.layer.cornerRadius = 10
        authorImageVeiw.layer.masksToBounds = true
        authorImageVeiw.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        let coverUrl = NSURL(string: (itemModel?.cover_image_url)!)
        coverImageView.kf_setImageWithURL(coverUrl, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
    }
    
    @IBAction func clickBtn(sender: UIButton) {
        
        if sender.tag == 100 {
            
        }else if sender.tag == 101 {
            
        }else if sender.tag == 102 {
            
        }
        
    }
    
    @IBAction func thumbUpAction(sender: UIButton) {
    }
    
    class func createCollectionCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: NCDDataModel) -> NoColumnCell {
        
        let cellId = "noColumnCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? NoColumnCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("NoColumnCell", owner: nil, options: nil).last as? NoColumnCell
        }
        
        cell?.itemModel = dataModel.items![indexPath.row]
        
        return cell!
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
