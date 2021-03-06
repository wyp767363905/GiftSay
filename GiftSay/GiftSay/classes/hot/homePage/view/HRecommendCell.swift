//
//  HRecommendCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HRecommendCell: UICollectionViewCell {

    var dataModel: HRecommendItemsDataModel?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        backgroundColor = UIColor.whiteColor()
        layer.cornerRadius = 5
        clipsToBounds = true
        
        for i in 0..<5 {
            
            let num = 200+i
            let subView = self.viewWithTag(num)
            
            if subView?.isKindOfClass(UILabel.self) == true {
                
                if num == 201 {
                    let label = subView as! UILabel
                    label.text = (dataModel?.name)!
                }else if num == 202 {
                    let label = subView as! UILabel
                    label.text = "¥\((dataModel?.price)!)"
                }else if num == 204 {
                    let label = subView as! UILabel
                    label.text = "\((dataModel?.favorites_count)!)"
                }
                
            }
            
            if subView?.isKindOfClass(UIImageView.self) == true {
                
                if num == 200 {
                    let url = NSURL(string: (dataModel?.cover_image_url)!)
                    let imageView = subView as! UIImageView
                    imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                }
                
            }
            
        }
        
    }
    
    class func createHotCellFor(collectionView: UICollectionView, atIndexPath indexPath: NSIndexPath, withDataModel dataModels: [HRecommendItemsModel]) -> HRecommendCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("recommendHotCellId", forIndexPath: indexPath) as? HRecommendCell
        
        cell?.dataModel = dataModels[indexPath.row].data
        
        return cell!
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
