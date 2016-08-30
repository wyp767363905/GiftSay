//
//  GSRecommendADCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSRecommendADCell: UITableViewCell {
    
    //图片点击事件闭包
    var clickClosure: ADCellClosure?
    
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
                
                //添加手势
                tmpImageView.userInteractionEnabled = true
                tmpImageView.tag = 500+i
                let g = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
                tmpImageView.addGestureRecognizer(g)
                
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
    
    func tapAction(g: UIGestureRecognizer){
        
        let index = (g.view?.tag)! - 500
        
        let model = bannersArray![index]
        
        if ((model.target_id?.isKindOfClass(NSNumber.self)) != nil) {
            clickClosure!("\(model.target_id!)", model.type!, model.target_url)
        }else{
            clickClosure!(nil, model.type!, model.target_url)
        }
        
        
        
    }
    
    class func createADCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withModel model: GSRecommendModel, clickClosure: ADCellClosure?) -> GSRecommendADCell {
        
        let cellId = "recommendADCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? GSRecommendADCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("GSRecommendADCell", owner: nil, options: nil).last as? GSRecommendADCell
        }
        cell?.bannersArray = model.data?.banners
        
        cell?.clickClosure = clickClosure
        
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









