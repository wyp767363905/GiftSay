//
//  GSRecommendADCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSRecommendADCell: UITableViewCell {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var bannersArray: Array<GSRecommendBannersModel>?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        for subView in scrollView.subviews {
            subView.removeFromSuperview()
        }
        
        let containerView = UIView()
        scrollView.addSubview(containerView)
        
        containerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo(self!.scrollView)
            make.height.equalTo(self!.scrollView)
        }
        
        var lastView: UIView? = nil
        let cnt = bannersArray?.count
        if cnt > 0 {
            for i in 0..<cnt! {
                
                let model = bannersArray![i]
                let tmpImageView = UIImageView.createImageView(nil)
                let url = NSURL(string: model.image_url!)
                tmpImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                containerView.addSubview(tmpImageView)
                
                tmpImageView.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(kScreenWidth)
                    if i == 0 {
                        make.left.equalTo(containerView)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!)
                    }
                })
                
                lastView = tmpImageView
                
            }
            
            containerView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo((lastView?.snp_right)!)
            })
            pageControl.numberOfPages = cnt!
            pageControl.userInteractionEnabled = false
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.pagingEnabled = true
            scrollView.delegate = self
            
        }
        
    }
    
    class func createADCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withModel model: GSRecommendModel) -> GSRecommendADCell {
        
        let cellId = "recommendADCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? GSRecommendADCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("GSRecommendADCell", owner: nil, options: nil).last as? GSRecommendADCell
        }
        cell?.bannersArray = model.data?.banners
        
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

extension GSRecommendADCell : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        pageControl.currentPage = index
        
    }
    
}









