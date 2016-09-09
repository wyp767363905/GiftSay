//
//  GiftSayViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import XWSwiftRefresh

class GiftSayViewController: KTCHomeViewController {
    
    private var recommendView: GSRecommendView?
    
    private var otherView: GSOtherView?
    
    private var candidatesArray: Array<GSSmallNavBarChannelsModel>?
    
    private var nextBtn: UIButton?
    
    var scrollView: UIScrollView?
    
    private lazy var otherArray = NSMutableArray()
    
    var num: NSNumber = 102
    
    var smallScrollView: UIScrollView?
    
    var giftType: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        createMyNav()
        
        downloaderSmallNavBarData()
        
    }
    
    //在这是下载出来的是除了精选之外的视图情况?
    func downloaderOtherData(){
        
        for i in 0..<otherArray.count {
            
            let urlString = String(format: kGiftSaySelectUrl, "\(otherArray[i])")
            let downloader = WYPDownloader()
            downloader.type = 500+i
            downloader.delegate = self
            downloader.downloaderWithUrlString(urlString)
        
        }
        
    }
    
    //创建首页整页的滚动视图
    func createHomePageView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        scrollView = UIScrollView()
        scrollView?.pagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.delegate = self
        view.addSubview(scrollView!)
        
        scrollView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(94, 0, 49, 0))
        })
        
        let containerView = UIView()
        scrollView?.addSubview(containerView)
        
        containerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo(self!.scrollView!)
            make.height.equalTo(self!.scrollView!)
        }
        
        //精选视图(特殊)
        recommendView = GSRecommendView()
        containerView.addSubview(recommendView!)
        
        recommendView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.width.equalTo(kScreenWidth)
            make.left.equalTo(containerView)
        })
        
        //其他视图是一样的
        var lastView: UIView? = nil
        if otherArray.count > 0 {
            for i in 0..<otherArray.count {
                otherView = GSOtherView()
                containerView.addSubview(otherView!)
                
                otherView?.snp_makeConstraints(closure: {
                    [weak self]
                    (make) in
                    make.top.bottom.equalTo(containerView)
                    make.width.equalTo(kScreenWidth)
                    if i == 0 {
                        make.left.equalTo((self!.recommendView?.snp_right)!)
                    }else{
                        make.left.equalTo((lastView?.snp_right)!)
                    }
                })
                
                otherView?.tag = 800+i
                
                lastView = otherView
                
            }
            
            containerView.snp_makeConstraints(closure: { (make) in
                make.right.equalTo(lastView!)
            })
            
        }
        
        addFoot()
        
        addHead()
        
    }
    
    //上拉
    func addFoot(){
        
        recommendView?.tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadNextPage))
//        for i in 0..<otherArray.count {
//            otherView?.tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(nextPage))
//
//        }
        
    }
    
    func nextPage(){
        
        giftType = 1
        
        otherView?.number = giftType
        
        kGiftSaySelectUrl = (otherView?.otherModel?.data?.paging?.next_url)!
        
    }
    
    func loadNextPage(){
        
        giftType = 1
        
        recommendView?.number = giftType
        
        kGiftSaySelectUrl = (recommendView?.selectModel?.data?.paging?.next_url)!
        
        downloaderSelectData()
        
    }
    
    //下拉
    func addHead(){
        
        recommendView?.tbView?.headerView = XWRefreshNormalHeader(target: self, action: #selector(loadFirstPage))
        
        //otherView?.tbView?.headerView = XWRefreshNormalHeader(target: self, action: #selector(firstPage))
        
    }
    
    func firstPage(){
        
        giftType = 0
        
        otherView?.number = giftType
        
        kGiftSaySelectUrl = "http://api.liwushuo.com/v2/channels/%@/items_v2?ad=2&gender=1&generation=3&limit=20&offset=0"
        
    }
    
    func loadFirstPage(){
        
        giftType = 0
        
        recommendView?.number = giftType
        
        kGiftSaySelectUrl = "http://api.liwushuo.com/v2/channels/%@/items_v2?ad=2&gender=1&generation=3&limit=20&offset=0"
        
        downloaderAdData()
        
        downloaderSecondaryBannersData()
        
        downloaderSelectData()
        
        downloaderOtherData()
        
        downloaderSelectData()
        
    }
    
    //精选
    func downloaderSelectData() {
        
        var urlString = ""
        
        if giftType == 0 {
            urlString = String(format: kGiftSaySelectUrl, num)
        }else if giftType == 1 {
            urlString = kGiftSaySelectUrl
        }
        let downloader = WYPDownloader()
        downloader.type = 400
        downloader.delegate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    //次要的横幅
    func downloaderSecondaryBannersData() {
        
        let urlString = kGiftSayBannersUrl
        let downloader = WYPDownloader()
        downloader.type = 300
        downloader.delegate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    //滚动视图数据下载
    func downloaderAdData() {
        
        let urlString = kGiftSayAdUrl
        let downloader = WYPDownloader()
        downloader.type = 200
        downloader.delegate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    //小导航栏数据下载
    func downloaderSmallNavBarData() {
        
        let urlString = kGiftSaySmallNavBarUrl
        let downloader = WYPDownloader()
        downloader.type = 100
        downloader.delegate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()

    }
    
    //导航
    func createMyNav(){
        
        addNavTitle("礼物说")
        
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
        
        smallScrollView = UIScrollView()
        smallScrollView?.showsHorizontalScrollIndicator = false
        view.addSubview(smallScrollView!)
        
        //滚动视图约束
        smallScrollView?.snp_makeConstraints {
            [weak self]
            (make) in
            make.top.equalTo(self!.view).offset(64)
            make.left.equalTo(self!.view)
            make.right.equalTo(self!.view).offset(-30)
            make.height.equalTo(30)
        }
        
        let smallContainerView = UIView()
        smallContainerView.tag = 10
        smallScrollView?.addSubview(smallContainerView)
        
        //容器视图约束
        smallContainerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo(self!.smallScrollView!)
            make.height.equalTo(self!.smallScrollView!)
        }
        
        createBtnAndAlterView(smallContainerView)
        
    }
    
    //创建小导航栏上面的按钮并修改容器视图
    func createBtnAndAlterView(smallContainerView: UIView) {
        
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
                smallContainerView.addSubview(tmpBtn)
                
                tmpBtn.snp_makeConstraints(closure: { (make) in
                    make.top.bottom.equalTo(smallContainerView)
                    make.width.equalTo(tmpBtnRect.size.width)
                    if i == 0 {
                        make.left.equalTo(smallContainerView).offset(10)
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
            
            //修改容器视图约束
            smallContainerView.snp_makeConstraints(closure: {
                (make) in
                make.right.equalTo((lastBtn?.snp_right)!).offset(10)
            })
            
        }

    }
    
    //小导航栏按钮的点击事件
    func clickBtn(tmpBtn: UIButton){
        
        //点击选中情况
        if nextBtn != nil {
            nextBtn?.selected = false
            nextBtn?.setTitleColor(UIColor.blackColor(), forState: .Normal)
            tmpBtn.selected = true
            tmpBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
        }
        
        UIView.beginAnimations("donghua", context: nil)
        UIView.setAnimationDuration(0.5)
        UIView.setAnimationRepeatCount(1)
        UIView.setAnimationDelegate(self)
        var offsetX = tmpBtn.center.x-(smallScrollView?.center.x)!
        if offsetX < 0 {
            offsetX = 0
        }
        if offsetX > ((smallScrollView?.contentSize.width)!-(smallScrollView?.bounds.size.width)!) {
            offsetX = (smallScrollView?.contentSize.width)!-(smallScrollView?.bounds.size.width)!
        }
        smallScrollView?.contentOffset = CGPointMake(offsetX, 0)
        UIView.commitAnimations()
        
        nextBtn = tmpBtn
        
    }
    
    func gotoADDetail(targetId: String?, type: String, targetUrl: String?) {
        
        let adDetailCtrl = ADDetailViewController()
        
        adDetailCtrl.targetId = targetId
        
        adDetailCtrl.type = type
        
        adDetailCtrl.targetUrl = targetUrl
        
        navigationController?.pushViewController(adDetailCtrl, animated: true)
        
    }
    
    func showRecommendData(model: GSRecommendModel){
        
        recommendView?.model = model
        
        recommendView?.clickClosure = {
            [weak self]
            (targetId: String?, type: String, targetUrl: String?) in
            
            self!.gotoADDetail(targetId, type: type, targetUrl: targetUrl)
            
        }
        
    }
    
    func showSelectData(model: GSSelectModel,tag: Int){
        
        if tag == 400 {
            recommendView?.selectModel = model
            
            recommendView?.clickClosure = {
                [weak self]
                (targetId: String?, type: String, targetUrl: String?) in
                
                self!.gotoADDetail(targetId, type: type, targetUrl: targetUrl)
                
            }
        }else{
            
            let subView = self.scrollView?.viewWithTag(300+tag)
            if ((subView?.isKindOfClass(GSOtherView.self)) == true) {
                
                let otherView = subView as! GSOtherView
                otherView.otherModel = model
                otherView.clickClosure = {
                    [weak self]
                    (targetId: String?, type: String, targetUrl: String?) in
                    
                    self!.gotoADDetail(targetId, type: type, targetUrl: targetUrl)
                }
                
            }
            
        }
        
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
                candidatesArray = model.data?.channels
                
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.createSmallNavBarBtn()
                    if model.data?.candidates?.count > 0 {
                        for i in 0..<(model.data?.candidates?.count)! {
                            
                            let id = model.data?.candidates![i].id
                            self!.otherArray.addObject(id!)
                            
                        }
                        
                        self!.createHomePageView()
                        
                        self!.downloaderAdData()
                        
                        self!.downloaderSecondaryBannersData()
                        
                        self!.downloaderSelectData()
                        
                        self!.downloaderOtherData()
                        
                    }
                })
            }else if downloader.type == 200 {
                let model = GSRecommendModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.showRecommendData(model)
                })
            }else if downloader.type == 300 {
                let model = GSSecondaryBannersModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.recommendView?.secondaryBannersModel = model
                })
            }else if downloader.type == 400 {
                
                /*
                let str = NSString(data: jsonData, encoding: NSUTF8StringEncoding)
                print(str!)
                */
                
                let model = GSSelectModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.showSelectData(model,tag: 400)
                    self!.recommendView?.tbView?.footerView?.endRefreshing()
                    self!.recommendView?.tbView?.headerView?.endRefreshing()
                })
            }else{
                
                for i in 0..<otherArray.count {
                    if downloader.type == 500+i {
                        let model = GSSelectModel.parseModel(jsonData)
                        
                        dispatch_async(dispatch_get_main_queue(), {
                            [weak self] in
                            self!.showSelectData(model,tag: 500+i)
                            
                        })
                    }
                    
                }
                
            }
        }
        
    }
    
}

extension GiftSayViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        
        let subView = smallScrollView?.viewWithTag(1000+index)
        if subView?.isKindOfClass(UIButton.self) == true {
            let tmpBtn = subView as! UIButton
            if nextBtn != nil {
                nextBtn?.selected = false
                nextBtn?.setTitleColor(UIColor.blackColor(), forState: .Normal)
                tmpBtn.selected = true
                tmpBtn.setTitleColor(UIColor.redColor(), forState: .Normal)
            }
            UIView.beginAnimations("donghua", context: nil)
            UIView.setAnimationDuration(0.5)
            UIView.setAnimationRepeatCount(1)
            UIView.setAnimationDelegate(self)
            var offsetX = tmpBtn.center.x-(smallScrollView?.center.x)!
            if offsetX < 0 {
                offsetX = 0
            }
            if offsetX > ((smallScrollView?.contentSize.width)!-(smallScrollView?.bounds.size.width)!) {
                offsetX = (smallScrollView?.contentSize.width)!-(smallScrollView?.bounds.size.width)!
            }
            smallScrollView?.contentOffset = CGPointMake(offsetX, 0)
            UIView.commitAnimations()
            
            nextBtn = tmpBtn
            
        }
        
    }
    
}



