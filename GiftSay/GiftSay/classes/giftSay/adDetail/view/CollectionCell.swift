//
//  CollectionCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/29.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class CollectionCell: UITableViewCell {
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var authorImageVeiw: UIImageView!
    
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var likesCountLabel: UILabel!
    
    @IBOutlet weak var authorLabel: UILabel!
    
    var clickClosure: ADCellClosure?
    
    var collectionModel: ADCollectionPostsModel?{
        
        didSet {
            
            if collectionModel != nil {
                
                showData()

            }

        }
        
    }
    
    func showData(){
        
        categoryLabel.text = collectionModel?.column?.category
        
        titleLabel.text = collectionModel?.column?.title
        
        descLabel.text = collectionModel?.title
        
        likesCountLabel.text = "\((collectionModel?.likes_count)!)"
        
        authorLabel.text = collectionModel?.author?.nickname
        
        let url = NSURL(string: (collectionModel?.author?.avatar_url)!)
        authorImageVeiw.layer.cornerRadius = 10
        authorImageVeiw.layer.masksToBounds = true
        authorImageVeiw.kf_setImageWithURL(url, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
        let coverUrl = NSURL(string: (collectionModel?.cover_image_url)!)
        coverImageView.kf_setImageWithURL(coverUrl, placeholderImage: UIImage(named: "preload_image"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
        
    }
    
    @IBAction func clickBtn(sender: UIButton) {
        
        if sender.tag == 100 {
            
        }else if sender.tag == 101 {
            
        }else if sender.tag == 102 {
            
            clickClosure!("\((collectionModel?.column?.id)!)", (collectionModel?.type)!, collectionModel?.url)
        }
        
    }
    
    @IBAction func thumbUpAction(sender: UIButton) {
    }
    
    class func createCollectionCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: ADCollectionDataModel, clickClosure: ADCellClosure?) -> CollectionCell {
        
        let cellId = "collectionCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CollectionCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("CollectionCell", owner: nil, options: nil).last as? CollectionCell
        }
        
        cell?.clickClosure = clickClosure
        cell?.collectionModel = dataModel.posts![indexPath.row]
        
        return cell!
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
