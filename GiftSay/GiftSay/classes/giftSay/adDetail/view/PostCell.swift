//
//  PostCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {
    
    @IBOutlet weak var postImageView: UIImageView!
    
    var dataModel:ADPostDataModel?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        let url = NSURL(string: (dataModel?.cover_image_url)!)
        postImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
    }
    
    class func createPostCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: ADPostDataModel) -> PostCell {
        
        let cellId = "postCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? PostCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("PostCell", owner: nil, options: nil).last as? PostCell
        }
        
        cell?.dataModel = dataModel
        
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
