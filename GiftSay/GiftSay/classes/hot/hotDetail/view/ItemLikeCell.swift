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
        
        let layout = HMyLayout(sectionInsets: UIEdgeInsetsMake(10, 10, 10, 10), itemSpace: 10, lineSpace: 10)
        
        layout.delegate = self
        
        collView.collectionViewLayout = layout
        
        collView.delegate = self
        collView.dataSource = self
        
        collView.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
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
        return UICollectionViewCell()
    }
    
}














