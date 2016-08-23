//
//  CategoryViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class CategoryViewController: BaseViewController {

    private var categoryView: CategoryView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createSearchBar()
        
        createHomePageView()
        
        downloaderSCData()
        
        downloaderSNCData()
        
    }
    
    //初始化视图
    func createHomePageView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        //推荐
        categoryView = CategoryView()
        view.addSubview(categoryView!)
        
        categoryView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(104, 0, 49, 0))
            })
        
    }
    
    func downloaderSNCData(){
        
        let urlString = kCategoryStrategyNoColumnUrl
        let downloader = WYPDownloader()
        downloader.dalagate = self
        downloader.type = 200
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func downloaderSCData(){
        
        let urlString = kCategoryStrategyColumnUrl
        let downloader = WYPDownloader()
        downloader.dalagate = self
        downloader.type = 100
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func createSearchBar(){
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        let searchBar = UISearchBar(frame: CGRectMake(0,64,view.bounds.size.width,40))
        searchBar.placeholder = "快选一份礼物,送给心爱的Ta吧"
        searchBar.barTintColor = UIColor.whiteColor()
        searchBar.backgroundColor = UIColor.grayColor()
        view.addSubview(searchBar)
        
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

extension CategoryViewController : WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        if let jsonData = data {
            if downloader.type == 100 {
                let model = CGStrategyColumnModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    self.categoryView?.columnModel = model
                })
            }else if downloader.type == 200 {
                let model = CGStrategyNoColumnModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), { 
                    self.categoryView?.noColumnModel = model
                })
            }
        }
        
    }
    
}


















