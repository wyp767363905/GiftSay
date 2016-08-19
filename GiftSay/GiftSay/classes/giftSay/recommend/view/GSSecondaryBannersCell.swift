//
//  GSSecondaryBannersCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSSecondaryBannersCell: UITableViewCell {
    
    private var scrollView: UIScrollView?
    
    private var bnImageView: UIImageView?
    
    var sbArray: Array<GSSecondaryBannersBannersModel>?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        scrollView = UIScrollView()
        contentView.addSubview(scrollView!)
        
        scrollView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.contentView)
            })
        
        let containerView = UIView()
        scrollView?.addSubview(containerView)
        
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView!)
            make.height.equalTo(scrollView!)
        }
        
        var lastView: UIView? = nil
        let cnt = sbArray?.count
        if cnt > 0 {
            for i in 0..<cnt! {
                
                let model = sbArray![i]
                let tmpImageView = UIImageView.createImageView(nil)
                let url = NSURL(string: model.image_url!)
                tmpImageView.kf_setImageWithURL(url, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                containerView.addSubview(tmpImageView)
                
                tmpImageView.snp_makeConstraints(closure: { (make) in
                    make.top.equalTo(containerView).offset(10)
                    make.bottom.equalTo(containerView).offset(-10)
                    make.width.equalTo(80)
                    if i == 0 {
                        make.left.equalTo(10)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!).offset(10)
                    }
                })
                
                tmpImageView.layer.cornerRadius = 5
                tmpImageView.clipsToBounds = true
                
                lastView = tmpImageView
                
            }
            
            containerView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo((lastView?.snp_right)!).offset(10)
            })
            
        }
        
        scrollView?.showsHorizontalScrollIndicator = false
        
        
    }
    
    class func createADCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withModel model: GSSecondaryBannersModel) -> GSSecondaryBannersCell {
        
        let cellId = "secondaryBannersCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? GSSecondaryBannersCell
        if nil == cell {
            cell = GSSecondaryBannersCell(style: .Default, reuseIdentifier: cellId)
        }
        cell?.sbArray = model.data?.secondary_banners
        
        return cell!
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
