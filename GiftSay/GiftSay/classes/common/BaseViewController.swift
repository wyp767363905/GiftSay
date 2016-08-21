//
//  BaseViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import XWSwiftRefresh

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
    }
    
    func addNavTitle(title: String){
        
        let titleLabel = UILabel.createLabel(title, textAlignment: .Center, font: UIFont.systemFontOfSize(24), textColor: UIColor.blackColor())
        navigationItem.titleView = titleLabel
        
        titleLabel.snp_makeConstraints { (make) in
            make.top.equalTo(navigationItem.titleView!).offset(20)
            make.bottom.equalTo(navigationItem.titleView!)
            make.right.equalTo(navigationItem.titleView!).offset(0)
            make.left.equalTo(navigationItem.titleView!).offset(0)
        }
        
    }
    
    func addNavBtn(imageName: String, targer: AnyObject?, action: Selector, isLeft: Bool){
        
        let btn = UIButton.createBtn(nil, bgImageName: imageName, selectBgImageName: nil, target: targer, action: action)
        btn.frame = CGRectMake(0, 4, 20, 20)
        
        let barBtnItem = UIBarButtonItem(customView: btn)
        
        if isLeft {
            navigationItem.leftBarButtonItem = barBtnItem
        }else{
            navigationItem.rightBarButtonItem = barBtnItem
        }
        
    }
    
    func addNavBackBtn(){
        
        addNavBtn("", targer: self, action: #selector(backAction), isLeft: true)
        
    }
    
    func backAction(){
        
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









