//
//  PostWebCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/28.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol PostWebCellDelegate: NSObjectProtocol {
    func heightForRow(height: CGFloat)
}

class PostWebCell: UITableViewCell {
    
    weak var delegate: PostWebCellDelegate?
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var webView: UIWebView!
    
    var dataModel: ADPostDataModel?{
        
        didSet {
            
            showData()
            
        }
        
    }
    
    func showData(){
        
        titleLabel.text = dataModel?.title
        
        let url = NSURL(string: (dataModel?.content_url)!)
        
        let request = NSURLRequest(URL: url!)
        
        webView.delegate = self
        
        webView.scrollView.scrollEnabled = false
        
        webView.loadRequest(request)
        
    }
    
    class func createPostWebCellFor(tableView: UITableView, atIndexPath indexPath: NSIndexPath, withDataModel dataModel: ADPostDataModel, delegate: PostWebCellDelegate?) -> PostWebCell {
        
        let cellId = "postWebCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? PostWebCell
        
        if nil == cell {
            cell = NSBundle.mainBundle().loadNibNamed("PostWebCell", owner: nil, options: nil).last as? PostWebCell
        }
        
        cell?.dataModel = dataModel
        
        cell?.delegate = delegate
        
        cell?.updateFocusIfNeeded()
        
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

extension PostWebCell : UIWebViewDelegate {
    
    func webViewDidFinishLoad(webView: UIWebView) {
        
        let webHeightStr = webView.stringByEvaluatingJavaScriptFromString("document.body.scrollHeight")
        
        let height = CGFloat((webHeightStr! as NSString).floatValue)
                
        delegate?.heightForRow(CGFloat(height))
                
    }
    
}









