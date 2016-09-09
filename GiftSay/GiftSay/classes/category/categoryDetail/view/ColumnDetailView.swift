//
//  ColumnDetailView.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ColumnDetailView: UIView {

    private var tbView: UITableView?
    
    var dataModel: CDDataModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    init(){
        super.init(frame: CGRectZero)
        
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        addSubview(tbView!)
        
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

extension ColumnDetailView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if dataModel?.banner_image_url != nil {
            rowNum += 1
        }
        
        if dataModel?.desc != nil {
            rowNum += 1
        }
        
        if dataModel?.posts?.count > 0 {
            rowNum += (dataModel?.posts?.count)!
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if dataModel?.banner_image_url != nil && indexPath.row == 0 {
            height = 180
        }
        
        if dataModel?.desc != nil && indexPath.row == 1 {
            height = 100
        }
        
        if dataModel?.posts?.count > 0 && indexPath.row > 0 {
            height = 100
        }
        
        return height
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if dataModel?.banner_image_url != nil && indexPath.row == 0 {
            
            cell = ColumnPicCell.createColumnPicCellFor(tableView, atIndexPath: indexPath, withdataModel: dataModel!)
            
        }else if dataModel?.desc != nil && indexPath.row == 1 {
            
            cell = ColumnProfileCell.createColumnProfileCellFor(tableView, atIndexPath: indexPath, withdataModel: dataModel!)
            
        }else if dataModel?.posts?.count > 0 && indexPath.row > 1 {
            
            cell = ColumnListCell.createColumnProfileCellFor(tableView, atIndexPath: indexPath, withdataModel: dataModel!)
            
        }
        
        return cell
    }
    
}














