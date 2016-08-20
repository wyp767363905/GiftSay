//
//  GiftSayViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class GiftSayViewController: BaseViewController {
    
    private var recommendView: GSRecommendView?
    
    private var candidatesArray: Array<GSSmallNavBarCandidatesModel>?
    
    private var nextBtn: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createMyNav()
        
        createHomePageView()
        
        downloaderSmallNavBarData()
        
        downloaderAdData()
        
        downloaderSecondaryBannersData()
        
        downloaderSelectData()
        
    }
    
    func createHomePageView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        recommendView = GSRecommendView()
        view.addSubview(recommendView!)
        
        recommendView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
        
    }
    
    func downloaderSelectData() {
        
        let urlString = kGiftSaySelectUrl
        let downloader = WYPDownloader()
        downloader.type = 400
        downloader.dalagate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func downloaderSecondaryBannersData() {
        
        let urlString = kGiftSayBannersUrl
        let downloader = WYPDownloader()
        downloader.type = 300
        downloader.dalagate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    //滚动视图数据下载
    func downloaderAdData() {
        
        let urlString = kGiftSayAdUrl
        let downloader = WYPDownloader()
        downloader.type = 200
        downloader.dalagate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    //小导航栏数据下载
    func downloaderSmallNavBarData() {
        
        let urlString = kGiftSaySmallNavBarUrl
        let downloader = WYPDownloader()
        downloader.type = 100
        downloader.dalagate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    //导航
    func createMyNav(){
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        addNavBtn("sign_in", targer: self, action: #selector(signInAction), isLeft: true)
        
        addNavBtn("search", targer: self, action: #selector(searchAction), isLeft: false)
        
    }
    
    func signInAction(){
        
    }
    
    func searchAction(){
        
    }
    
    //创建小导航栏
    func createSmallNavBarBtn(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        view.addSubview(scrollView)
        
        scrollView.snp_makeConstraints {
            [weak self]
            (make) in
            make.top.equalTo(self!.view).offset(64)
            make.left.equalTo(self!.view)
            make.right.equalTo(self!.view).offset(-30)
            make.height.equalTo(30)
        }
        
        let containerView = UIView()
        //containerView.backgroundColor = UIColor.blackColor()
        scrollView.addSubview(containerView)
        
        containerView.snp_makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.height.equalTo(scrollView)
        }
        
        var lastBtn: UIButton? = nil
        let cnt = candidatesArray?.count
        if cnt > 0 {
            for i in 0..<cnt! {
                
                let model = candidatesArray![i]
                let dict = [NSFontAttributeName: UIFont.systemFontOfSize(13)]
                let tmpBtn = UIButton.createBtn(model.name!, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(clickBtn(_:)))
                tmpBtn.tag = 1000+i
                tmpBtn.titleLabel?.font = UIFont.systemFontOfSize(13)
                let nameStr = NSString(string: model.name!)
                let tmpBtnRect = nameStr.boundingRectWithSize(CGSizeMake(CGFloat.max, tmpBtn.frame.size.height), options: .TruncatesLastVisibleLine, attributes: dict, context: nil)
                tmpBtn.frame.size.width = tmpBtnRect.size.width
                containerView.addSubview(tmpBtn)
                
                tmpBtn.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(containerView)
                    if i == 0 {
                        make.left.equalTo(containerView).offset(10)
                    }else{
                        make.left.equalTo((lastBtn?.snp_right)!).offset(10)
                    }
                })
                
                lastBtn = tmpBtn
                
                if i == 0 {
                    tmpBtn.selected = true
                    tmpBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
                    nextBtn = tmpBtn
                }
                
            }
            
            containerView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo((lastBtn?.snp_right)!).offset(10)
            })
            
        }
        
    }
    
    func clickBtn(tmpBtn: UIButton){
        
        if nextBtn != nil {
            nextBtn?.selected = false
            nextBtn?.setTitleColor(UIColor.blackColor(), forState: .Normal)
            tmpBtn.selected = true
            tmpBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
        
        nextBtn = tmpBtn
        
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

//MARK: WYPDownloader代理
extension GiftSayViewController : WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        
        if let jsonData = data {
            if downloader.type == 100 {
                let model = GSSmallNavBarModel.parseModel(jsonData)
                candidatesArray = model.data?.candidates
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.createSmallNavBarBtn()
                })
            }else if downloader.type == 200 {
                let model = GSRecommendModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.recommendView?.model = model
                })
            }else if downloader.type == 300 {
                let model = GSSecondaryBannersModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), { 
                    self.recommendView?.secondaryBannersModel = model
                })
            }else if downloader.type == 400 {
                let model = GSSelectModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.recommendView?.selectModel = model
                })
            }
        }
        
    }
    
}





