//
//  HotRightView.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotRightView: UIView {

    var dataModel: HotCommentsDataModel?{
        
        didSet {
            
            if dataModel?.comments != nil {
                tbView?.reloadData()
            }
            
        }
        
    }
    
    private var tbView: UITableView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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

extension HotRightView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if dataModel?.comments != nil {
            return (dataModel?.comments?.count)!
        }
        return 0
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if dataModel?.comments![indexPath.row].created_at != nil {
            let commentsModel = dataModel?.comments![indexPath.row]
            height = HotRecommendCell.heightForModel(commentsModel!)
        }
        
        return height
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if dataModel?.comments![indexPath.row].created_at != nil {
            cell = HotRecommendCell.createItemCellFor(tableView, atIndexPath: indexPath, withDataModel: dataModel!)
        }
        
        return cell
    }
    
}













