//
//  HotDetailViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/2.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotDetailViewController: BaseViewController {
    
    private var segCtrl: KTCHotSegmentCtrl?
    
    private var hotDetailItmeView: HotDetailView?
    
    private var centerView: HotCenterView?
    
    private var rightView: HotRightView?
    
    var url: NSString?{
        
        didSet {
            
            centerView?.urlString = url
            
        }
        
    }
    
    var scrollView: UIScrollView?
    
    var typeId: NSNumber?{
        
        didSet {
            
            if typeId != nil {
                
                createView()
                downloaderItemData()
                downloaderLikeData()
                downloaerRightData()
                
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addMyNav()
        
    }
    
    func createBottomBtn(model: HotItemModel){
        
        let bottomView = UIView()
        bottomView.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        view.addSubview(bottomView)
        
        bottomView.snp_makeConstraints {
            [weak self]
            (make) in
            make.left.right.equalTo(self!.view)
            make.bottom.equalTo(self!.view)
            make.height.equalTo(49)
        }
        
        let topSpace:CGFloat = (49.0-30.0)/2

        let thumbBtn = UIButton.createBtn(nil, bgImageName: "thumb_up_hot_detail", selectBgImageName: nil, target: self, action: #selector(thumbAction))
        bottomView.addSubview(thumbBtn)
        
        thumbBtn.snp_makeConstraints { (make) in
            make.left.equalTo(bottomView).offset(20)
            make.top.equalTo(bottomView).offset(topSpace)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        let shareBtn = UIButton.createBtn(nil, bgImageName: "share_hot_detail", selectBgImageName: nil, target: self, action: #selector(shareAction))
        bottomView.addSubview(shareBtn)
        
        shareBtn.snp_makeConstraints { (make) in
            make.left.equalTo(thumbBtn.snp_right).offset(40)
            make.top.equalTo(bottomView).offset(topSpace)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }
        
        let gotoBtn = UIButton.createBtn(nil, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(gotoAction))
        gotoBtn.backgroundColor = UIColor.redColor()
        gotoBtn.layer.cornerRadius = 3
        gotoBtn.layer.masksToBounds = true
        bottomView.addSubview(gotoBtn)
        
        gotoBtn.snp_makeConstraints { (make) in
            make.top.equalTo(bottomView).offset(topSpace)
            make.right.equalTo(bottomView).offset(-10)
            make.width.equalTo(200)
            make.height.equalTo(30)
        }
        
        let gotoLabel = UILabel.createLabel((model.data?.source?.button_title), textAlignment: .Center, font: UIFont.systemFontOfSize(15), textColor: UIColor.whiteColor())
        gotoBtn.addSubview(gotoLabel)
        
        gotoLabel.snp_makeConstraints { (make) in
            make.edges.equalTo(gotoBtn)
        }
        
    }
    
    func thumbAction(){
        
    }
    
    func shareAction(){
        
    }
    
    func gotoAction(){
        
    }
    
    func addMyNav(){
        
        segCtrl = KTCHotSegmentCtrl(frame: CGRectMake(80, 0, kScreenWidth-80*2, 44), titleNames: ["单品","详情","评论"])
        
        segCtrl?.delegate = self
        
        navigationItem.titleView = segCtrl
        
        addNavBackBtn()
        
    }
    
    func createView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        scrollView = UIScrollView()
        scrollView?.pagingEnabled = true
        scrollView?.showsHorizontalScrollIndicator = false
        scrollView?.delegate = self
        view.addSubview(scrollView!)
        
        scrollView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
        })
        
        let containerView = UIView()
        scrollView?.addSubview(containerView)
        
        containerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo(self!.scrollView!)
            make.height.equalTo(self!.scrollView!)
        }
        
        hotDetailItmeView = HotDetailView()
        containerView.addSubview(hotDetailItmeView!)
        
        hotDetailItmeView?.snp_makeConstraints(closure: { (make) in
            make.top.bottom.equalTo(containerView)
            make.left.equalTo(containerView)
            make.width.equalTo(kScreenWidth)
        })
        
        centerView = HotCenterView()
        containerView.addSubview(centerView!)
        
        centerView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.top.bottom.equalTo(containerView)
            make.left.equalTo((self!.hotDetailItmeView?.snp_right)!)
            make.width.equalTo(kScreenWidth)
        })
        
        rightView = HotRightView()
        containerView.addSubview(rightView!)
        
        rightView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.top.bottom.equalTo(containerView)
            make.left.equalTo((self!.centerView?.snp_right)!)
            make.width.equalTo(kScreenWidth)
        })
        
        containerView.snp_makeConstraints {
            [weak self]
            (make) in
            make.right.equalTo(self!.rightView!)
        }
        
    }
    
    func downloaderItemData(){
        
        let urlString = String(format: kHotDetailItemUrl, typeId!)
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 100
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func downloaderLikeData() {
        
        let urlString = String(format: kHotDetailLikeUrl, typeId!)
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 200
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func downloaerRightData() {
        
        let urlString = String(format: kHotCommentsUrl, typeId!)
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 300
        downloader.downloaderWithUrlString(urlString)
        
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

extension HotDetailViewController : WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        
        if let jsonData = data {
            
            if downloader.type == 100 {
                
                let model = HotItemModel.praseModel(jsonData)
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.hotDetailItmeView?.itemModel = model
                    self!.createBottomBtn(model)
                })
            }else if downloader.type == 200 {
                
                let model = HotLikeModel.praseModel(jsonData)
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.hotDetailItmeView?.likeModel = model
                })
            }else if downloader.type == 300 {
                
                let model = HotCommentsModel.praseModel(jsonData)
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.rightView?.dataModel = model.data
                })
            }
            
        }
        
    }
    
}

extension HotDetailViewController : KTCHotSegmentCtrlDelegate {
    
    func didSelectSegCtrl(segCtrl: KTCHotSegmentCtrl, atIndex index: Int) {
        
        scrollView?.contentOffset = CGPointMake(kScreenWidth*CGFloat(index), 0)
        
        if index == 2 {
            
            addNavBtn("sign_in_hot", targer: self, action: #selector(clickBtn), isLeft: false)
            
        }else{
            
            navigationItem.rightBarButtonItem = nil
            
        }
        
    }
    
    func clickBtn() {
        
        
        
    }
    
}

extension HotDetailViewController : UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        
        let index = Int(scrollView.contentOffset.x/scrollView.bounds.size.width)
        //修改标题选中的按钮
        segCtrl?.selectIndex = index
        
        if index == 2 {
            
            addNavBtn("sign_in_hot", targer: self, action: #selector(clickBtn), isLeft: false)
            
        }else{
            
            navigationItem.rightBarButtonItem = nil
            
        }
        
    }
    
}













