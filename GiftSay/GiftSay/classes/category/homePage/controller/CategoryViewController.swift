//
//  CategoryViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class CategoryViewController: KTCHomeViewController {

    private var categoryView: CategoryView?
    
    var searchBar: UISearchBar?
    
    private var model: SearchKeyWordsModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createSearchBar()
        
        createHomePageView()
        
        downloaderSCData()
        
        downloaderSNCData()
        
        downloaderSearchKeyWordsData()
        
    }
    
    //初始化视图
    func createHomePageView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        //推荐
        categoryView = CategoryView()
        categoryView?.delegate = self
        categoryView?.noDelegate = self
        view.addSubview(categoryView!)
        
        categoryView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(104, 0, 49, 0))
            })
        
    }
    
    func downloaderSearchKeyWordsData(){
        
        let urlString = kSearchKeyWordsUrl
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 300
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func downloaderSNCData(){
        
        let urlString = kCategoryStrategyNoColumnUrl
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 200
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func downloaderSCData(){
        
        let urlString = kCategoryStrategyColumnUrl
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 100
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func createSearchBar(){
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
        searchBar = UISearchBar(frame: CGRectMake(0,64,view.bounds.size.width,40))
        searchBar?.delegate = self
        searchBar?.barTintColor = UIColor.whiteColor()
        searchBar?.backgroundColor = UIColor.grayColor()
        view.addSubview(searchBar!)
        
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
                    [weak self] in
                    self!.categoryView?.columnModel = model
                })
            }else if downloader.type == 200 {
                let model = CGStrategyNoColumnModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.categoryView?.noColumnModel = model
                })
            }else if downloader.type == 300 {
                let model = SearchKeyWordsModel.parseModel(jsonData)
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.model = model
                    self!.searchBar?.placeholder = (model.data?.placeholder)!
                })
            }
        }
        
    }
    
}

extension CategoryViewController : CGStrategyColumnCellDelegate {
    
    func sendIdWithDetailView(typeId: NSNumber) {
        
        let columnDetailCtrl = ColumnDetailViewController()
        columnDetailCtrl.typeId = Int(typeId)
        navigationController?.pushViewController(columnDetailCtrl, animated: true)
        
    }
    
}

extension CategoryViewController : CGStrategyNoColumnCellDelegate {
    
    func sendIdWithNoDetailView(typeId: NSNumber) {
        
        let columnDetailCtrl = NoColumnDetailViewController()
        columnDetailCtrl.typeId = Int(typeId)
        navigationController?.pushViewController(columnDetailCtrl, animated: true)
        
    }
    
}

extension CategoryViewController : UISearchBarDelegate {
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        
        let searchCtrl = SearchViewController()
        
        searchCtrl.model = model
        
        navigationController?.pushViewController(searchCtrl, animated: true)
        
        return false
    }
        
}












