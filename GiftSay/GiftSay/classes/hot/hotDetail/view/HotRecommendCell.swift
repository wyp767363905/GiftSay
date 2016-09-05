//
//  HotRecommendCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotRecommendCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var commentsLabel: UILabel!
    
    var commentsModel: CommentsModel?{
        
        didSet {
            
            if commentsModel != nil {
                showData()
            }
        }
        
    }
    
    func showData(){
        
        let url = NSURL(string: (commentsModel?.user?.avatar_url)!)
        userImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        userImageView.layer.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        
        userNameLabel.text = (commentsModel?.user?.nickname)!
        
        let date = NSDate(timeIntervalSince1970: NSTimeInterval((commentsModel?.created_at)!))
        let df = NSDateFormatter()
        df.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateStr = df.stringFromDate(date)
        let array = dateStr.componentsSeparatedByString(" ")
        var dates = Array<String>()
        if array.count > 1{
            let dateArray = array[0].componentsSeparatedByString("-")
            let timeArray = array[1].componentsSeparatedByString(":")
            
            if dateArray.count == timeArray.count && dateArray.count == 3 {
                dates.append(dateArray[1])
                dates.append(dateArray[2])
                dates.append(timeArray[0])
                dates.append(timeArray[1])
            }
        }
        let str = NSString(format: "%@月%@日 %@:%@", dates[0], dates[1], dates[2], dates[3])
        timeLabel.text = str as String
        
        commentsLabel.text = (commentsModel?.content)!
        //修改高度
        let descStr = NSString(string: (commentsModel?.content)!)
        let dict = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        let rect = descStr.boundingRectWithSize(CGSizeMake(kScreenWidth-10, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: dict, context: nil)
        var height = CGFloat(Int(rect.size.height))
        if rect.size.height - height > 0 && height > 20 {
            height += 1
        }
        
        commentsLabel.snp_updateConstraints { (make) in
            make.height.equalTo(height)
        }
        
    }
    
    class func createItemCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: HotCommentsDataModel) -> HotRecommendCell {
        
        let cellId = "hotRecommendCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? HotRecommendCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("HotRecommendCell", owner: nil, options: nil).last as? HotRecommendCell
        }
        
        cell?.commentsModel = dataModel.comments![indexPath.row]
        
        return cell!
        
    }
    
    class func heightForModel(model: CommentsModel) -> CGFloat {
        
        var offsetY: CGFloat = 0
        
        let top: CGFloat = 15
        
        let bottom: CGFloat = 15
        
        let imageH: CGFloat = 40
        
        let spaceX: CGFloat = 10
        
        let descStr = NSString(string: (model.content)!)
        let dict = [NSFontAttributeName: UIFont.systemFontOfSize(17)]
        let rect = descStr.boundingRectWithSize(CGSizeMake(kScreenWidth-10, CGFloat.max), options: .UsesLineFragmentOrigin, attributes: dict, context: nil)
        var height = CGFloat(Int(rect.size.height))
        if rect.size.height - height > 0 {
            height += 1
        }
        
        offsetY = top+bottom+imageH+spaceX+height
        
        return offsetY
        
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
