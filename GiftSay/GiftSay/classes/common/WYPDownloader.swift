//
//  WYPDownloader.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol WYPDownloaderDelegate: NSObjectProtocol {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError)
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?)
    
}

class WYPDownloader: NSObject {
    
    var delegate: WYPDownloaderDelegate?
    
    var type: Int?
    
    func downloaderWithUrlString(UrlString: String) {
        
        let url = NSURL(string: UrlString)
        
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error) in
            
            if let err = error {
                self.delegate?.downloader(self, didFailWithError: err)
            }else{
                let httpRes = response as! NSHTTPURLResponse
                if httpRes.statusCode == 200 {
                    self.delegate?.downloader(self, didFinishWithData: data)
                }else{
                    let error = NSError(domain: UrlString, code: httpRes.statusCode, userInfo: ["msg":"下载失败"])
                    self.delegate?.downloader(self, didFailWithError: error)
                }
            }
            
        }
        
        task.resume()
        
    }
    
}
