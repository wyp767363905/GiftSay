//
//  ADDetailViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/27.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ADDetailViewController: BaseViewController {
    
    var targetId: String?
    
    var type: String?
    
    var targetUrl: String?
    
    private var tbView: UITableView?
    
    var detailView: DetailView?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addNavBackBtn()
        
        createMyNav()
        
        if type == "post" {
            
            downloaderPost()
            
            downloaderPostLike()
            
        }else if type == "url" {
            
            let str = targetUrl?.stringByRemovingPercentEncoding
            //下面这种url解码已经弃用
            //let str = targetUrl?.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
            let array = str?.componentsSeparatedByString("url=")
            var webStr = ""
            if array?.count > 1 {
                webStr = array![1]
            }
            
            let webView = UIWebView()
            webView.backgroundColor = UIColor.whiteColor()
            view.addSubview(webView)
            
            webView.snp_makeConstraints(closure: {
                [weak self]
                (make) in
                make.left.right.equalTo(self!.view)
                make.top.equalTo(self!.view).offset(64)
                make.bottom.equalTo(self!.view)
            })
            
            let url = NSURL(string: webStr)
            
            let request = NSURLRequest(URL: url!)
            
            webView.loadRequest(request)
            
        }else if type == "collection" {
            
            downloaderCollection()
            
        }
        
    }
    
    func downloaderPostLike(){
        
        if targetId != nil {
            let urlString = String(format: kADPostLikeUrl, targetId!)
            let downloader = WYPDownloader()
            downloader.type = 300
            downloader.delegate = self
            downloader.downloaderWithUrlString(urlString)
        }
        
    }
    
    func downloaderPost(){
        
        if targetId != nil {
            let urlString = String(format: kADPostUrl, targetId!)
            let downloader = WYPDownloader()
            downloader.type = 100
            downloader.delegate = self
            downloader.downloaderWithUrlString(urlString)
        }
        
    }
    
    //显示网页
    func downloaderUrl(){
        
    }
    
    func downloaderCollection(){
        
        if targetId != nil {
            let urlString = String(format: kADCollection, targetId!)
            let downloader = WYPDownloader()
            downloader.type = 200
            downloader.delegate = self
            downloader.downloaderWithUrlString(urlString)
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        if type == "post" {
            
            navigationController?.navigationBar.barTintColor = nil
            
        }
    }
    
    func createMyNav(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        if type == "post" {
            
            let btn = UIButton.createBtn("查看全集", bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(clickBtn))
            btn.frame = CGRectMake(0, 4, 80, 20)
            btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            let barBtnItem = UIBarButtonItem(customView: btn)
            navigationItem.rightBarButtonItem = barBtnItem
            
        }else if type == "url" || type == "collection" {
            
            addNavBtn("share.png", targer: self, action: #selector(clickBtn), isLeft: false)
            
        }
        
        if type == "post" {
            
            detailView = DetailView()
            view.addSubview(detailView!)
            
            detailView?.snp_makeConstraints(closure: {
                [weak self]
                (make) in
                make.edges.equalTo(self!.view!)
            })
            
        }else if type == "collection" {
            
            detailView = DetailView()
            view.addSubview(detailView!)
            
            detailView?.snp_makeConstraints(closure: {
                [weak self]
                (make) in
                make.edges.equalTo(self!.view!).inset(UIEdgeInsetsMake(64, 0, 0, 0))
            })
            
        }
        
    }
    
    func clickBtn(){
        
    }
    
    func showADPostModel(model: ADCollectionModel){
        
        detailView?.collectionModel = model
        
        detailView?.clickClosure = {
            [weak self]
            (targetId: String?, type: String, targetUrl: String?) in
            
            self!.gotoADDetail(targetId, type: type, targetUrl: targetUrl)
            
        }
        
    }
    
    func gotoADDetail(targetId: String?, type: String, targetUrl: String?) {
        
        let adDetailCtrl = ADDetailViewController()
        
        adDetailCtrl.targetId = targetId
        
        adDetailCtrl.type = type
        
        adDetailCtrl.targetUrl = targetUrl
        
        navigationController?.pushViewController(adDetailCtrl, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ADDetailViewController : WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        
        if let jsonData = data {
            
            if downloader.type == 100 {
                
                let model = ADPostModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), { 
                    [weak self] in
                    self!.detailView?.type = self!.type
                    self!.detailView?.postModel = model
                })
                
            }else if downloader.type == 200 {
                
                let model = ADCollectionModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), { 
                    [weak self] in
                    self!.detailView?.type = self!.type
                    self!.showADPostModel(model)
                    //self!.detailView?.collectionModel = model
                })
                
            }else if downloader.type == 300 {
                
                let model = ADPostLikeModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), { 
                    [weak self] in
                    self!.detailView?.type = self!.type
                    self?.detailView?.postLikeModel = model
                })
                
            }
            
        }
    }
    
}






