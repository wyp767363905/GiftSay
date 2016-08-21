//
//  GSRecommendView.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GSRecommendView: UIView {
    
    private var tbView: UITableView?
    
    var model: GSRecommendModel?
    
    var secondaryBannersModel: GSSecondaryBannersModel?
    
    var selectModel: GSSelectModel? {
        
        didSet {
            
            tbView?.reloadData()
            
        }
        
    }

    init(){
        super.init(frame: CGRectZero)
        
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        
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
        
        if selectModel?.data?.items?.count > 0 {
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
            if selectModel?.data?.items?.count > 0 {
                rowNum += (selectModel?.data?.items?.count)!
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
            if selectModel?.data?.items?.count > 0 {
                heigeht = 230
            }
        }
        
        return heigeht
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            if model?.data?.banners?.count > 0 {
                
                cell = GSRecommendADCell.createADCellFor(tableView, atIndexPath: indexPath, withModel: model!)
            }
        }else if (secondaryBannersModel?.data?.secondary_banners?.count > 0) && (indexPath.section == 1) {
            
            cell = GSSecondaryBannersCell.createADCellFor(tableView, atIndexPath: indexPath, withModel: secondaryBannersModel!)
        }else if (selectModel?.data?.items?.count > 0) && (indexPath.section == 2) {
            let dataModel = selectModel?.data
            let itemModel = dataModel?.items

            cell = GSSelectCell.createSelectCellFor(tableView, atIndexPath: indexPath, withItemsModel: itemModel!)
        }
        
        return cell
    }
    
}








