//
//  CategoryView.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class CategoryView: UIView {

    private var tbView: UITableView?
    
    weak var delegate: CGStrategyColumnCellDelegate?
    
    weak var noDelegate: CGStrategyNoColumnCellDelegate?
    
    var columnModel: CGStrategyColumnModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    var noColumnModel: CGStrategyNoColumnModel?{
        
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

extension CategoryView : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        var sectionNum = 0
        
        if columnModel?.data?.columns?.count > 0 {
            sectionNum = 1
        }
        
        if noColumnModel?.data?.channel_groups?.count > 0 {
            sectionNum += (noColumnModel?.data?.channel_groups?.count)!
        }
        
        return sectionNum
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rowNum = 0
        
        if columnModel?.data?.columns?.count > 0 {
            rowNum = 1
        }else{
            if noColumnModel?.data?.channel_groups?.count > 0 {
                let groupsModel = noColumnModel?.data?.channel_groups![section]
                if groupsModel?.id?.integerValue == ChannelGroupsType.Category.rawValue {
                    rowNum = 1
                }else if groupsModel?.id?.integerValue == ChannelGroupsType.Style.rawValue {
                    rowNum = 1
                }else if groupsModel?.id?.integerValue == ChannelGroupsType.Object.rawValue {
                    rowNum = 1
                }
            }
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var heigeht: CGFloat = 0
        
        if indexPath.section == 0 {
            if columnModel?.data?.columns?.count > 0 {
                heigeht = 260
            }
        }else {
            if noColumnModel?.data?.channel_groups?.count > 0 {
                heigeht = 260
            }
        }
        
        return heigeht
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            if columnModel?.data?.columns?.count > 0 {
                let dataModel = columnModel?.data
                cell = CGStrategyColumnCell.createColumnCellFor(tableView, atIndexPath: indexPath, withdataModel: dataModel!, delegate: delegate!)
            }
        }else{
            if noColumnModel?.data?.channel_groups?.count > 0 {
                
                let groups = noColumnModel?.data?.channel_groups
                let num = indexPath.section-1
                if groups![num].id?.integerValue == ChannelGroupsType.Category.rawValue {
                    cell = CGStrategyNoColumnCell.createNoColumnCellFor(tableView, atIndexPath: indexPath, withGroupsModel: groups![num], delegate: noDelegate!)
                }else if groups![num].id?.integerValue == ChannelGroupsType.Style.rawValue {
                    cell = CGStrategyNoColumnCell.createNoColumnCellFor(tableView, atIndexPath: indexPath, withGroupsModel: groups![num], delegate: noDelegate!)
                }else if groups![num].id?.integerValue == ChannelGroupsType.Object.rawValue {
                    cell = CGStrategyNoColumnCell.createNoColumnCellFor(tableView, atIndexPath: indexPath, withGroupsModel: groups![num], delegate: noDelegate!)
                }
                
            }
        }
        
        return cell
    }
    
}








