//
//  ColumnListCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ColumnListCell: UITableViewCell {
    
    @IBOutlet weak var authorImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var thumbUpLabel: UILabel!
    
    var postModel: CDPostModel? {
        
        didSet {
            showData()
        }
        
    }
    
    func showData(){
        
        authorImageView.layer.cornerRadius = 5
        authorImageView.layer.masksToBounds = true
        let url = NSURL(string: (postModel?.cover_image_url)!)
        authorImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        descLabel.text = (postModel?.title)!
        
        timeLabel.text = "\((Int((postModel?.created_at)!)/1000))"
        
        nickNameLabel.text = (postModel?.author?.nickname)!
        
        thumbUpLabel.text = "\((postModel?.likes_count)!)"
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func createColumnProfileCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withdataModel dataModel: CDDataModel) -> ColumnListCell {
        
        let cellId = "columnListCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ColumnListCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("ColumnListCell", owner: nil, options: nil).last as? ColumnListCell
        }
        
        cell?.postModel = dataModel.posts![indexPath.row-2]
        
        return cell!
    }
    
    @IBAction func thumbUpAction(sender: UIButton) {
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
