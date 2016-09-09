//
//  ColumnProfileCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/6.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ColumnProfileCell: UITableViewCell {
    
    private var flag: Bool = true
    
    @IBOutlet weak var profileLabel: UILabel!
    
    @IBOutlet weak var lockLabel: UILabel!
    
    @IBOutlet weak var lockImageView: UIImageView!
    
    @IBOutlet weak var lockBtn: UIButton!
    
    @IBAction func lockAction(sender: UIButton) {
        
        if (!flag) {
            lockLabel.text = "查看全部"
            
            lockImageView.image = UIImage(named: "category_arrow_down")
            flag = true
        }else{
            lockLabel.text = "收起"
            
            lockImageView.image = UIImage(named: "category_arrow_top")
            flag = false
        }
        
    }
    
    var dataModel: CDDataModel? {
        
        didSet {
            
            if dataModel != nil {
                showData()
            }
            
        }
        
    }
    
    func showData(){
        
        profileLabel.text = (dataModel?.desc)!
        
        lockLabel.text = "查看全部"
        
        lockImageView.image = UIImage(named: "category_arrow_down")
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    class func createColumnProfileCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withdataModel dataModel: CDDataModel) -> ColumnProfileCell {
        
        let cellId = "columnProfileCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ColumnProfileCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("ColumnProfileCell", owner: nil, options: nil).last as? ColumnProfileCell
        }
        
        cell?.dataModel = dataModel
        
        return cell!
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
