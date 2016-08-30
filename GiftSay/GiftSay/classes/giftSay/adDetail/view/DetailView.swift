//
//  DetailView.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class DetailView: UIView {
    
    var clickClosure: ADCellClosure?
    
    private var tbView: UITableView?
    
    var type: String?
    
    var postModel: ADPostModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    var collectionModel: ADCollectionModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    var postLikeModel: ADPostLikeModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        
        //分界线
        tbView?.separatorStyle = .None
        
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

extension DetailView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if type == "post" {
            
            if postModel?.data != nil {
                
                rowNum = 3
                
            }
            
        }else if type == "collection" {
            
            if collectionModel?.data?.posts?.count > 0 {
                
                rowNum += (collectionModel?.data?.posts?.count)!
                
            }
            
        }
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if type == "post" {
            
            if postModel?.data != nil {
                
                if indexPath.row == 0 {
                    
                    height = 140
                    
                }else if indexPath.row == 1 {
                    
                    height = 537
                    
                }else if indexPath.row == 2 {
                    
                    height = 170
                    
                }
                
            }
            
        }else if type == "collection" {
            
            if collectionModel?.data?.posts?.count > 0 {
                
                height = 230
                
            }
            
        }
        
        return height
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if type == "post" {
            
            if postModel?.data != nil {
                
                if indexPath.row == 0 {
                    
                    let dataModel = postModel?.data
                    cell = PostCell.createPostCellFor(tableView, atIndexPath: indexPath, withDataModel: dataModel!)
                    
                }else if indexPath.row == 1 {
                    
                    let dataModel = postModel?.data
                    cell = PostWebCell.createPostWebCellFor(tableView, atIndexPath: indexPath, withDataModel: dataModel!)
                    
                }else if indexPath.row == 2 {
                    
                    let dataModel = postLikeModel?.data
                    cell = PostScrollViewCell.createPostScrollViewCellFor(tableView, atIndexPath: indexPath, withDataModel: dataModel!)
                    
                }
                
            }
            
        }else if type == "collection" {
            
            if collectionModel?.data?.posts?.count > 0 {
                
                let dataModel = collectionModel?.data
                
                cell = CollectionCell.createCollectionCellFor(tableView, atIndexPath: indexPath, withDataModel: dataModel!, clickClosure: clickClosure)
                
            }
            
        }
        
        return cell
    }
    
}














