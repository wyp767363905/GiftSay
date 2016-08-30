//
//  PostScrollViewCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class PostScrollViewCell: UITableViewCell {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var dataModel: ADPostLikeDataModel?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        titleLabel.text = "你可能也喜欢"
        
        let containerView = UIView()
        scrollView.addSubview(containerView)
        
        containerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo(self!.scrollView)
            make.height.equalTo(self!.scrollView)
        }
        
        var lastBtn: UIButton? = nil
        let width: CGFloat = 260
        for i in 0..<(dataModel?.recommend_posts?.count)! {
            
            let btn = UIButton(type: .Custom)
            let url = NSURL(string: (dataModel?.recommend_posts![i].cover_image_url)!)
            btn.kf_setBackgroundImageWithURL(url, forState: .Normal, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            containerView.addSubview(btn)
            
            btn.snp_makeConstraints(closure: { (make) in
                make.top.bottom.equalTo(containerView)
                make.width.equalTo(width)
                if i == 0 {
                    make.left.equalTo(containerView)
                }else{
                    make.left.equalTo((lastBtn?.snp_right)!).offset(5)
                }
            })
            
            lastBtn = btn
            
        }
        
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(lastBtn!)
        }
        
    }
    
    class func createPostScrollViewCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: ADPostLikeDataModel) -> PostScrollViewCell {
        
        let cellId = "postScrollViewCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? PostScrollViewCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("PostScrollViewCell", owner: nil, options: nil).last as? PostScrollViewCell
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
