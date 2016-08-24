//
//  CGStrategyNoColumnCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class CGStrategyNoColumnCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    
    var groupsModel: CGStrategyNoColumnDataGroupsModel?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        if groupsModel?.id?.integerValue == ChannelGroupsType.Category.rawValue {
            
            let rightBtn = createRightBtn()
            
            rightBtn.tag = 300
            
            nameLabel.text = groupsModel?.name
            
            let channels = groupsModel?.channels
            if channels?.count > 0 {
                for i in 0..<6 {
                    let channelsModel = channels![i]
                    let subView = contentView.viewWithTag(100+i)
                    if subView?.isKindOfClass(UIButton.self) == true {
                        let btn = subView as! UIButton
                        let url = NSURL(string: channelsModel.cover_image_url!)
                        btn.kf_setBackgroundImageWithURL(url, forState: .Normal, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                }
            }
            
        }else if groupsModel?.id?.integerValue == ChannelGroupsType.Style.rawValue {
            nameLabel.text = groupsModel?.name
            
            let channels = groupsModel?.channels
            if channels?.count > 0 {
                for i in 0..<6 {
                    let channelsModel = channels![i]
                    let subView = contentView.viewWithTag(100+i)
                    if subView?.isKindOfClass(UIButton.self) == true {
                        let btn = subView as! UIButton
                        let url = NSURL(string: channelsModel.cover_image_url!)
                        btn.kf_setBackgroundImageWithURL(url, forState: .Normal, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                }
            }
        }else if groupsModel?.id?.integerValue == ChannelGroupsType.Object.rawValue {
            
            let rightBtn = createRightBtn()
            
            rightBtn.tag = 400
            
            nameLabel.text = groupsModel?.name
            
            let channels = groupsModel?.channels
            if channels?.count > 0 {
                for i in 0..<6 {
                    let channelsModel = channels![i]
                    let subView = contentView.viewWithTag(100+i)
                    if subView?.isKindOfClass(UIButton.self) == true {
                        let btn = subView as! UIButton
                        let url = NSURL(string: channelsModel.cover_image_url!)
                        btn.kf_setBackgroundImageWithURL(url, forState: .Normal, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    }
                }
            }
        }
            
    }
    
    func createRightBtn() -> UIButton {
        
        let rightBtn = UIButton.createBtn(nil, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(rightAction(_:)))
        contentView.addSubview(rightBtn)
        
        rightBtn.snp_makeConstraints(closure: { (make) in
            make.top.right.equalTo(contentView)
            make.height.equalTo(30)
            make.width.equalTo(80)
        })
        
        let rightImageView = UIImageView.createImageView("category_arrow_right")
        rightBtn.addSubview(rightImageView)
        
        rightImageView.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(rightBtn).offset(5)
            make.bottom.equalTo(rightBtn).offset(5)
            make.right.equalTo(rightBtn)
            make.width.equalTo(20)
        })
        
        let leftLabel = UILabel.createLabel("查看全部", textAlignment: .Right, font: UIFont.systemFontOfSize(15), textColor: UIColor.lightGrayColor())
        rightBtn.addSubview(leftLabel)
        
        leftLabel.snp_makeConstraints(closure: { (make) in
            make.top.equalTo(rightBtn).offset(5)
            make.right.equalTo(rightImageView.snp_left)
            make.left.equalTo(rightBtn)
            make.bottom.equalTo(rightBtn).offset(5)
        })
        
        return rightBtn
        
    }
    
    class func createNoColumnCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withGroupsModel groupsModel: CGStrategyNoColumnDataGroupsModel) -> CGStrategyNoColumnCell {
        
        let cellId = "strategyNoColumnCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CGStrategyNoColumnCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("CGStrategyNoColumnCell", owner: nil, options: nil).last as? CGStrategyNoColumnCell
        }
        
        cell?.groupsModel = groupsModel
        
        return cell!
        
    }
    
    func rightAction(but: UIButton) {
        
    }
    
    @IBAction func clickBtn(sender: UIButton) {
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
