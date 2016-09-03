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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        addMyNav()
        
    }
    
    func addMyNav(){
        
        segCtrl = KTCHotSegmentCtrl(frame: CGRectMake(80, 0, kScreenWidth-80*2, 44), titleNames: ["单品","详情","评论"])
        
        navigationItem.titleView = segCtrl
        
        addNavBackBtn()
        
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
