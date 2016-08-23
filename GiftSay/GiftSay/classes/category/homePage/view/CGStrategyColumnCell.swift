//
//  CGStrategyColumnCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/22.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class CGStrategyColumnCell: UITableViewCell {

    @IBOutlet weak var columnLabel: UILabel!
    
    @IBOutlet weak var lookAllLabel: UILabel!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBAction func lookAllAction(sender: UIButton) {
    }
    
    var columnsArray: Array<CGStrategyColumnColumnsModel>?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        for subView in scrollView.subviews {
            subView.removeFromSuperview()
        }
        
        columnLabel.text = "栏目"
        
        lookAllLabel.text = "查看全部"
        
        scrollView.showsHorizontalScrollIndicator = false
        
        let containerView = UIView()
        scrollView.addSubview(containerView)
        
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollView)
        }
        
        if columnsArray?.count > 0 {
            var firstBtn: UIButton? = nil
            var secondBtn: UIButton? = nil
            var thridBtn: UIButton? = nil
            for i in 0..<(columnsArray?.count)! {
                
                let btn = UIButton.createBtn(nil, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(detailAction))
                containerView.addSubview(btn)
                
                btn.snp_makeConstraints(closure: { (make) in
                    if i%3 == 0 {
                        make.top.equalTo(containerView).offset(5)
                    }else if i%3 == 1 && firstBtn != nil {
                        make.top.equalTo((firstBtn?.snp_bottom)!).offset(10)
                    }else if i%3 == 2 && secondBtn != nil {
                        make.top.equalTo((secondBtn?.snp_bottom)!).offset(10)
                    }
                    if i/3 == 0 {
                        make.left.equalTo(containerView).offset(10)
                    }else{
                        if firstBtn != nil && i%3 == 0 {
                            make.left.equalTo((firstBtn?.snp_right)!).offset(10)
                        }else if secondBtn != nil && i%3 == 1 {
                            make.left.equalTo((secondBtn?.snp_right)!).offset(10)
                        }else if thridBtn != nil && i%3 == 2 {
                            make.left.equalTo((thridBtn?.snp_right)!).offset(10)
                        }
                    }
                    make.width.equalTo(260)
                    make.height.equalTo(65)
                    
                })
                
                if i%3 == 0 {
                    firstBtn = btn
                }else if i%3 == 1 {
                    secondBtn = btn
                }else if i%3 == 2 {
                    thridBtn = btn
                }
                
                let imageView = UIImageView.createImageView(nil)
                imageView.layer.cornerRadius = 5
                imageView.clipsToBounds = true
                btn.addSubview(imageView)
                
                imageView.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(btn)
                    make.left.equalTo(btn)
                    make.width.equalTo(120)
                })
                
                let url = NSURL(string: columnsArray![i].banner_image_url!)
                imageView.kf_setImageWithURL(url, placeholderImage: nil, optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                
                var lastLabel: UILabel? = nil
                for j in 0..<3 {
                    let label = UILabel()
                    btn.addSubview(label)
                    
                    label.snp_makeConstraints(closure: { (make) in
                        make.left.equalTo(imageView.snp_right).offset(10)
                        if j == 0 {
                            make.top.equalTo(btn).offset(5)
                            
                            make.height.equalTo(20)
                        }else if j == 1 {
                            make.top.equalTo((lastLabel?.snp_bottom)!).offset(5)
                            make.height.equalTo(15)
                        }else if j == 2 {
                            make.top.equalTo((lastLabel?.snp_bottom)!)
                            make.height.equalTo(15)
                        }
                        make.width.equalTo(120)
                    })
                    lastLabel = label
                    
                    if j == 0 {
                        label.text = columnsArray![i].title
                    }else if j == 1 {
                        label.text = columnsArray![i].subtitle
                        label.font = UIFont.systemFontOfSize(14)
                        label.textColor = UIColor.lightGrayColor()
                    }else if j == 2 {
                        label.text = columnsArray![i].author
                        label.font = UIFont.systemFontOfSize(14)
                        label.textColor = UIColor.lightGrayColor()
                    }
                    
                }
                
            }
            
            containerView.snp_makeConstraints(closure: { (make) in
                make.right.equalTo((firstBtn?.snp_right)!).offset(10)
            })
            
        
        
            let lookAllbtn = UIButton.createBtn("点击查看全部", bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(clickBtn))
            containerView.addSubview(lookAllbtn)
            
            lookAllbtn.snp_makeConstraints { (make) in
                make.left.equalTo((thridBtn?.snp_right)!).offset(10)
                make.top.equalTo((secondBtn?.snp_bottom)!).offset(30)
                make.width.equalTo(120)
                make.height.equalTo(30)
            }
            
            lookAllbtn.setTitleColor(UIColor.redColor(), forState: .Normal)
            lookAllbtn.layer.borderWidth = 1
            lookAllbtn.layer.borderColor = UIColor.redColor().CGColor
            
        }
        
    }
    
    func clickBtn(){
        
    }
    
    func detailAction(){
        
    }
    
    class func createColumnCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withdataModel dataModel: CGStrategyColumnDataModel) -> CGStrategyColumnCell {
        
        let cellId = "strategyColumnCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CGStrategyColumnCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("CGStrategyColumnCell", owner: nil, options: nil).last as? CGStrategyColumnCell
        }
        
        cell?.columnsArray = dataModel.columns
        
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
