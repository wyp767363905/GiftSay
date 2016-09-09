//
//  ColumnPicCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ColumnPicCell: UITableViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var favoriteLabel: UILabel!
    
    var dataModel: CDDataModel? {
        
        didSet {
            
            if dataModel != nil {
                showData()
            }
            
        }
        
    }
    
    func showData(){
        
        let url = NSURL(string: (dataModel?.cover_image_url)!)
        bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        titleLabel.text = (dataModel?.title)!
        
        favoriteLabel.text = "\((dataModel?.likes_count)!)人喜欢"
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func createColumnPicCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withdataModel dataModel: CDDataModel) -> ColumnPicCell {
        
        let cellId = "columnPicCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ColumnPicCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("ColumnPicCell", owner: nil, options: nil).last as? ColumnPicCell
        }
        
        cell?.dataModel = dataModel
        
        return cell!
    }
    
    @IBAction func focusAction(sender: UIButton) {
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
