//
//  ItemLikeCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ItemLikeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var collView: UICollectionView!
    
    var dataModel: HotLikeDataModel?{
        
        didSet {
            showData()
        }
        
    }
    
    func showData(){
                
        titleLabel.text = "你可能也喜欢"
        
    }
    
    class func createItemCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: HotLikeDataModel) -> ItemLikeCell {
        
        let cellId = "itenLikeCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ItemLikeCell
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("ItemLikeCell", owner: nil, options: nil).last as? ItemLikeCell
        }
        cell?.dataModel = dataModel
        
        return cell!
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        let layout = HMyLayout(sectionInsets: UIEdgeInsetsMake(0, 10, 10, 10), itemSpace: 10, lineSpace: 10)
        
        layout.delegate = self
        
        collView.collectionViewLayout = layout
        
        collView.delegate = self
        collView.dataSource = self
        
        collView.scrollEnabled = false
        
        collView.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
        let nib = UINib(nibName: "HotItemLikeCell", bundle: nil)
        self.collView?.registerNib(nib, forCellWithReuseIdentifier: "hotItemLikeCellId")
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ItemLikeCell : HMyLayoutDelegate {
    
    func numberOfColumns(layout: HMyLayout) -> Int {
        return 2
    }
    
}

extension ItemLikeCell : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataModel?.recommend_items?.count ?? 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if dataModel?.recommend_items!.count > 0 {
            
            let itemsModel = dataModel?.recommend_items
            cell = HotItemLikeCell.createHotCellFor(collectionView, atIndexPath: indexPath, withItemModel: itemsModel!)
            
        }
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("=======")
        
//        let hotDetailCtrl = HotDetailViewController()
//        hotDetailCtrl.typeId = dataModel?.recommend_items![indexPath.row].id
//        hotDetailCtrl.navigationController?.pushViewController(hotDetailCtrl, animated: true)
        
    }
    
}














