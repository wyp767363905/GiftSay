//
//  GSOtherView.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/24.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSOtherView: UIView {
    
    var clickClosure: ADCellClosure?
    
    var tbView: UITableView?
    
    var number: Int = 0
    
    var index: Int?
    
    var dataArray = Array<GSSelectItemsModel>()
    
    var array = NSMutableArray()
    
    var otherModel: GSSelectModel? {
        
        didSet {
            
            if number == 0 {
                dataArray.removeAll()
                array.removeAllObjects()
                if otherModel?.data?.items?.count > 0 {
                    for item in (otherModel?.data?.items)! {
                        dataArray.append(item)
                        array.addObject(dataArray)
                    }
                    tbView?.reloadData()
                    
                }
            }else if number == 1 {
                if tbView?.tag == 800+index! {
                    if otherModel?.data?.items?.count > 0 {
                        var arr = array[index!] as! Array<GSSelectItemsModel>
                        for item in (otherModel?.data?.items)! {
                            arr.append(item)
                        }
                    }
                }
                
            }
            
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

extension GSOtherView : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if number == 0 {
            if dataArray.count > 0 {
                rowNum = dataArray.count
            }
        }else if number == 1 {
            if array.count > 0 {
                rowNum = array[index!].count
            }
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var h: CGFloat = 0
        
        if dataArray.count > 0 {
            h = 230
        }
        
        return h
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        
        if dataArray.count > 0 {
            if number == 0 {
                cell = GSSelectCell.createSelectCellFor(tableView, atIndexPath: indexPath, withItemsModel: dataArray, clickClosure: clickClosure)
            }else if number == 1 {
                cell = GSSelectCell.createSelectCellFor(tableView, atIndexPath: indexPath, withItemsModel: array[index!] as! [GSSelectItemsModel], clickClosure: clickClosure)
                
            }
        }
        
        return cell
        
    }
    
}



















