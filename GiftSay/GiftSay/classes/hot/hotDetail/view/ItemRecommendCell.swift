//
//  ItemRecommendCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ItemRecommendCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var dataModel: HotLikeDataModel?{
        
        didSet {
            if dataModel?.recommend_posts?.count > 0 {
                showData()
            }
        }
        
    }
    
    func showData(){
        
        scrollView.showsHorizontalScrollIndicator = false
        
        titleLabel.text = "精品攻略推荐"
        
        let containerView = UIView()
        scrollView.addSubview(containerView)
        
        containerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo(self!.scrollView)
            make.height.equalTo(self!.scrollView)
        }
        
        let btnW = (kScreenWidth-20)/3*2
        var lastBtn: UIButton? = nil
        for i in 0..<(dataModel?.recommend_posts?.count)! {
            
            let btn = UIButton(type: .Custom)
            let url = NSURL(string: (dataModel?.recommend_posts![i].cover_image_url)!)
            btn.kf_setBackgroundImageWithURL(url, forState: .Normal, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
            btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
            btn.tag = 600+i
            containerView.addSubview(btn)
            
            btn.snp_makeConstraints(closure: { (make) in
                make.top.bottom.equalTo(containerView)
                make.width.equalTo(btnW)
                if i == 0 {
                    make.left.equalTo(containerView).offset(10)
                }else{
                    make.left.equalTo((lastBtn?.snp_right)!).offset(10)
                }
            })
            
            let label = UILabel.createLabel((dataModel?.recommend_posts![i].title)!, textAlignment: .Left, font: UIFont.systemFontOfSize(13), textColor: UIColor.whiteColor())
            btn.addSubview(label)
            
            label.snp_makeConstraints(closure: { (make) in
                make.bottom.equalTo(btn).offset(-5)
                make.left.equalTo(btn).offset(5)
                make.right.equalTo(btn).offset(-5)
                make.height.equalTo(20)
            })
            
            lastBtn = btn
            
        }
        
        containerView.snp_makeConstraints { (make) in
            make.right.equalTo(lastBtn!).offset(10)
        }
        
    }
    
    func clickBtn(btn: UIButton) {
        
        let index = btn.tag-600
        dataModel?.recommend_posts![index].id
        
    }
    
    class func createItemCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: HotLikeDataModel) -> ItemRecommendCell {
        
        let cellId = "itemRecommendCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ItemRecommendCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("ItemRecommendCell", owner: nil, options: nil).last as? ItemRecommendCell
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
