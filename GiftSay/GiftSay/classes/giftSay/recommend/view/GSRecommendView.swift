//
//  GSRecommendView.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSRecommendView: UIView {
    
    var clickClosure: ADCellClosure?
    
    var tbView: UITableView?
    
    var dataArray = Array<GSSelectItemsModel>()
    
    var number: Int?
    
    var model: GSRecommendModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    var secondaryBannersModel: GSSecondaryBannersModel?{
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }
    
    var selectModel: GSSelectModel? {
        
        didSet {
            
            if number == 0 {
                dataArray.removeAll()
            }
            if selectModel?.data?.items?.count > 0 {
                for item in (selectModel?.data?.items)! {
                    dataArray.append(item)
                }
                tbView?.reloadData()
            }
            
        }
        
    }

    init(){
        super.init(frame: CGRectZero)
        
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

extension GSRecommendView : UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        var sectionNum = 0
        
        if model?.data?.banners?.count > 0 {
            sectionNum += 1
        }
        
        if secondaryBannersModel?.data?.secondary_banners?.count > 0 {
            sectionNum += 1
        }
        
        if dataArray.count > 0 {
            sectionNum += 1
        }
        return sectionNum
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if section == 0 {
            if model?.data?.banners?.count > 0 {
                rowNum = 1
            }
        }else if section == 1 {
            if secondaryBannersModel?.data?.secondary_banners?.count > 0 {
                rowNum = 1
            }
        }else if section == 2 {
            if dataArray.count > 0 {
                rowNum += dataArray.count
            }
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var heigeht: CGFloat = 0
        
        if indexPath.section == 0 {
            if model?.data?.banners?.count > 0 {
                heigeht = 160
            }
        }else if indexPath.section == 1 {
            if secondaryBannersModel?.data?.secondary_banners?.count > 0 {
                heigeht = 100
            }
        }else if indexPath.section == 2 {
            if dataArray.count > 0 {
                heigeht = 230
            }
        }
        
        return heigeht
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            if model?.data?.banners?.count > 0 {
                
                cell = GSRecommendADCell.createADCellFor(tableView, atIndexPath: indexPath, withModel: model!, clickClosure: clickClosure)
            }
        }else if (secondaryBannersModel?.data?.secondary_banners?.count > 0) && (indexPath.section == 1) {
            
            cell = GSSecondaryBannersCell.createADCellFor(tableView, atIndexPath: indexPath, withModel: secondaryBannersModel!)
        }else if (dataArray.count > 0) && (indexPath.section == 2) {

            cell = GSSelectCell.createSelectCellFor(tableView, atIndexPath: indexPath, withItemsModel: dataArray, clickClosure: clickClosure)
        }
        
        return cell
    }
    
}








