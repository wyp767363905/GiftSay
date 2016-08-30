//
//  HotViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class HotViewController: BaseViewController {
    
    private var collView: UICollectionView?
    
    var model:HRecommendModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createMyNav()
        
        downloaderHotData()
        
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
        
        if let jsonData = data {
            
            let model = HRecommendModel.parseModel(jsonData)
            
            dispatch_async(dispatch_get_main_queue(), {
                
                [weak self] in
                self!.model = model
                self!.createLayout()
                
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
        return (model?.data?.items?.count)!
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = UICollectionViewCell()
        
        if model?.data?.items?.count > 0 {
            
            let itemsModel = model?.data?.items
            cell = HRecommendCell.createHotCellFor(collectionView, atIndexPath: indexPath, withDataModel: itemsModel!)
            
        }
        
        return cell
        
    }
    
}






