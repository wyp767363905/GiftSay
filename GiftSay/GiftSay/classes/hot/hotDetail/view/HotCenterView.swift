//
//  HotCenterView.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/4.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotCenterView: UIView {
    
    private var webView: UIWebView?
    
    var urlString: NSString?{
        
        didSet {
            
            let urlStr = String(self.urlString!)
            let url = NSURL(string: urlStr)
            let request = NSURLRequest(URL: url!)
            webView?.loadRequest(request)
            
        }
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: CGRectZero)
        
        webView = UIWebView()
        webView?.scrollView.showsVerticalScrollIndicator = false
        webView?.backgroundColor = UIColor.whiteColor()
        addSubview(webView!)
        
        webView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!)
        })
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
