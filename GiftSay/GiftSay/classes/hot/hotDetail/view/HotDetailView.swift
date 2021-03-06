//
//  HotDetailView.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotDetailView: UIView {
    
    private var tbView: UITableView?
    
    var itemModel: HotItemModel?{
        
        didSet {
            tbView?.reloadData()
        }
        
    }
    
    var likeModel: HotLikeModel?{
        
        didSet {
            tbView?.reloadData()
        }
        
    }
    
    init() {
        super.init(frame: CGRectZero)
        
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        addSubview(tbView!)
        tbView?.separatorStyle = .None
        tbView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!)
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension HotDetailView : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var sectionNum = 0
        
        if itemModel?.data != nil {
            sectionNum += 1
        }
        
        if likeModel?.data?.recommend_posts?.count > 0 {
            sectionNum += 1
        }
        
        if likeModel?.data?.recommend_items?.count > 0 {
            sectionNum += 1
        }
        
        return sectionNum
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if itemModel?.data != nil && likeModel?.data?.recommend_posts?.count > 0 && likeModel?.data?.recommend_items?.count > 0 {
            rowNum = 1
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if indexPath.section == 0 {
            
            let model = itemModel?.data
            if model != nil {
                height = ItemCell.heightForModel(model!)
            }
            
        }else if indexPath.section == 1 {
            
            let num = likeModel?.data?.recommend_posts?.count
            if num > 0 {
                height = 160
            }
            
        }else if indexPath.section == 2 {
            
            let model = likeModel?.data
            if model != nil {
                height = HMyLayout.ToObtainHeight(model!)
            }
            
        }
                
        return height
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            cell = ItemCell.createItemCellFor(tableView, atIndexPath: indexPath, withDataModel: (itemModel?.data)!)
            
        }else if indexPath.section == 1 {
            
            cell = ItemRecommendCell.createItemCellFor(tableView, atIndexPath: indexPath, withDataModel: (likeModel?.data)!)
            
        }else if indexPath.section == 2 {
            
            cell = ItemLikeCell.createItemCellFor(tableView, atIndexPath: indexPath, withDataModel: (likeModel?.data)!)
            
        }
        
        return cell
    }
    
}















