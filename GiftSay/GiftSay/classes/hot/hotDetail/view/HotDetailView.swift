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
    
    override init(frame: CGRect) {
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
        
        if itemModel?.data != nil || likeModel?.data?.recommend_posts?.count > 0 || likeModel?.data?.recommend_items?.count > 0 {
            rowNum = 1
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            cell = ItemCell.createItemCellFor(tableView, atIndexPath: indexPath, withDataModel: (itemModel?.data)!)
            
        }else if indexPath.section == 1 {
            
        }else if indexPath.section == 1 {
            
        }
        
        return cell
    }
    
}















