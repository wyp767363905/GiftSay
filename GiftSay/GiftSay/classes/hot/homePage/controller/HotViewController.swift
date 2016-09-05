//
//  HotViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import XWSwiftRefresh

class HotViewController: KTCHomeViewController {
    
    private var collView: UICollectionView?
    
    var model:HRecommendModel?
    
    private lazy var dataArray = NSMutableArray()
    
    private var hotType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createMyNav()
        
        downloaderHotData()
        
        createLayout()
        
    }
    
    func createLayout(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        let layout = HMyLayout(sectionInsets: UIEdgeInsetsMake(10, 10, 10, 10), itemSpace: 10, lineSpace: 10)
        
        layout.delegate = self
        
        collView = UICollectionView(frame: CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49), collectionViewLayout: layout)
        collView?.delegate = self
        collView?.dataSource = self
        
        collView?.backgroundColor = UIColor(white: 0.98, alpha: 1.0)
        
        let nib = UINib(nibName: "HRecommendCell", bundle: nil)
        self.collView?.registerNib(nib, forCellWithReuseIdentifier: "recommendHotCellId")
        
        view.addSubview(collView!)
        
        addFoot()
        
        addHead()
        
    }
    
    func addFoot(){
        collView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadNextPage))
    }
    
    func loadNextPage(){
        
        hotType = 1
        if model?.data?.paging?.next_url != nil {
            kHotUrl = (model?.data?.paging?.next_url)!
            downloaderHotData()
        }
        
    }
    
    func addHead(){
        collView?.headerView = XWRefreshNormalHeader(target: self, action: #selector(loadFirstPage))
    }
    
    func loadFirstPage(){
        
        hotType = 0
        kHotUrl = "http://api.liwushuo.com/v2/items?limit=20&offset=0&gender=1&generation=3"
        downloaderHotData()
        
    }
    
    func downloaderHotData(){
        
        let urlString = kHotUrl
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func createMyNav(){
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        addNavTitle("热门")
        
        addNavBtn("search", targer: self, action: #selector(searchAction), isLeft: false)
        
    }
    
    func searchAction(){
        
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

extension HotViewController: WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        
        if hotType == 0 {
            dataArray.removeAllObjects()
        }
        
        if let jsonData = data {
            
            model = HRecommendModel.parseModel(jsonData)
            if model != nil {
                for itemsModel in (model?.data?.items)! {
                    dataArray.addObject(itemsModel)
                }
            }
            dispatch_async(dispatch_get_main_queue(), {
                [weak self] in
                self!.collView?.reloadData()
                self!.collView?.footerView?.endRefreshing()
                self!.collView?.headerView?.endRefreshing()
            })
            
        }
        
    }
    
}

extension HotViewController : HMyLayoutDelegate {
    
    func numberOfColumns(layout: HMyLayout) -> Int {
        return 2
    }
    
}

extension HotViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        var rowNum = 0
        if dataArray.count > 0 {
            rowNum += dataArray.count
        }
        
        return rowNum
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if dataArray.count > 0 {
            
            let array = NSArray(array: dataArray)
            let itemsModel = array as! [HRecommendItemsModel]
            cell = HRecommendCell.createHotCellFor(collectionView, atIndexPath: indexPath, withDataModel: itemsModel)
            
        }
        
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let hotDetailCtrl = HotDetailViewController()
        let array = NSArray(array: dataArray)
        let itemsModel = array as! [HRecommendItemsModel]
        hotDetailCtrl.typeId = itemsModel[indexPath.row].data?.id
        hotDetailCtrl.url = itemsModel[indexPath.row].data?.url
        navigationController?.pushViewController(hotDetailCtrl, animated: true)
        
    }
    
}






