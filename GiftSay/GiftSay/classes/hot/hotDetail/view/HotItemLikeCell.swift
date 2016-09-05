//
//  HotItemLikeCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotItemLikeCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var favoriteNumLabel: UILabel!
    
    var itemModel: HotLikeItemsModel?{
        
        didSet {
            
            if itemModel != nil {
                showData()
            }
            
        }
        
    }
    
    func showData(){
        
        backgroundColor = UIColor.whiteColor()
        layer.cornerRadius = 5
        clipsToBounds = true
        
        let url = NSURL(string: (itemModel?.cover_image_url)!)
        bgImageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        descLabel.text = (itemModel?.desc)!
        
        priceLabel.text = "¥ \((itemModel?.price)!)"
        
        favoriteNumLabel.text = "\((itemModel?.favorites_count)!)"
        
    }
    
    class func createHotCellFor(collectionView: UICollectionView, atIndexPath indexPath: NSIndexPath, withItemModel itemModels: [HotLikeItemsModel]) -> HotItemLikeCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("hotItemLikeCellId", forIndexPath: indexPath) as? HotItemLikeCell
        
        cell?.itemModel = itemModels[indexPath.row]
        
        return cell!
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
