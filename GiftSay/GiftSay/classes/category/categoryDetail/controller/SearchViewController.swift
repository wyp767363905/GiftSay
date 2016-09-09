//
//  SearchViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/7.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class SearchViewController: BaseViewController {
    
    private var searchBar: UISearchBar?
    
    var model: SearchKeyWordsModel?{
        
        didSet {
            
            if model != nil {
                
                createNav()
                searchBar?.placeholder = (model?.data?.placeholder)!
                
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func createNav(){
        
        let btn = UIButton(type: .System)
        btn.setTitle("取消", forState: .Normal)
        btn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        btn.addTarget(self, action: #selector(clickBtn), forControlEvents: .TouchUpInside)
        
        btn.frame = CGRectMake(0, 4, 60, 36)
        
        let barBtnItem = UIBarButtonItem(customView: btn)
        navigationItem.rightBarButtonItem = barBtnItem
        
        searchBar = UISearchBar(frame: CGRectMake(0,4,view.bounds.size.width-100,36))
        searchBar?.barTintColor = UIColor.whiteColor()
        searchBar?.backgroundColor = UIColor.redColor()
        let barItem = UIBarButtonItem(customView: searchBar!)
        navigationItem.leftBarButtonItem = barItem
        
    }
    
    func clickBtn(){
        
        navigationController?.popViewControllerAnimated(true)
        
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
