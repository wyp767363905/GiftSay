//
//  ColumnDetailViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/5.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ColumnDetailViewController: BaseViewController {
    
    private var columnDetailView: ColumnDetailView?
    
    var typeId: Int?{
        
        didSet {
            if typeId != nil {
                downloaderData()
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createNav()
        
        createDetailNav()
        
    }
    
    func createNav(){
        
        addNavBackBtn()
        
        addNavBtn("share", targer: self, action: #selector(rightAction), isLeft: false)
        
    }
    
    func rightAction(){
        
    }
    
    func createDetailNav(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        columnDetailView = ColumnDetailView()
        view.addSubview(columnDetailView!)
        
        columnDetailView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 0, 0))
        })
        
    }
    
    func downloaderData(){
        
        let urlString = String(format: kColumnDetailUrl, typeId!)
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.type = 100
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

extension ColumnDetailViewController : WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        
        if let jsonData = data {
            
            if downloader.type == 100 {
                
                let model = CDModel.parseModel(jsonData)
                
                dispatch_async(dispatch_get_main_queue(), {
                    [weak self] in
                    self!.columnDetailView?.dataModel = model.data
                })
                
            }
            
        }
        
    }
    
}










