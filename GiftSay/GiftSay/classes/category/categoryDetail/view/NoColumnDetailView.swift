//
//  NoColumnDetailView.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class NoColumnDetailView: UIView {
    
    private var tbView: UITableView?
    
    var dataModel: NCDDataModel?{
        
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

extension NoColumnDetailView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if dataModel?.items?.count > 0 {
            rowNum += (dataModel?.items?.count)!
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if dataModel?.items?.count > 0 {
            height = 230
        }
        
        return height
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if dataModel?.items?.count > 0 {
            cell = NoColumnCell.createCollectionCellFor(tableView, atIndexPath: indexPath, withDataModel: dataModel!)
        }
        
        return cell
    }
    
}
