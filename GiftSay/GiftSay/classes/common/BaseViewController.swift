//
//  BaseViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

import XWSwiftRefresh

class BaseViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    lazy var dataArray = NSMutableArray()
    
    var tbView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        createTableView()
        
    }
    
    func addNavTitle(title: String){
        
        let titleLabel = UILabel.createLabel(title, textAlignment: .Center, font: UIFont.systemFontOfSize(24), textColor: UIColor.blackColor())
        navigationItem.titleView = titleLabel
        
    }
    
    func addNavBtn(imageName: String, targer: AnyObject?, action: Selector, isLeft: Bool){
        
        let btn = UIButton.createBtn(nil, bgImageName: imageName, selectBgImageName: nil, target: targer, action: action)
        btn.frame = CGRectMake(0, 4, 36, 36)
        
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
    
    func createTableView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        tbView = UITableView(frame: CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-49), style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
        addFoot()
        
        addHead()
        
    }
    
    func addFoot(){
        tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: #selector(loadNextPage))
    }
    
    func loadNextPage(){
        
    }
    
    func addHead(){
        tbView?.headerView = XWRefreshNormalHeader(target: self, action: #selector(loadFirstPage))
    }
    
    func loadFirstPage(){
        
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

//MARK: UITabelView代理
extension BaseViewController{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}








