//
//  SetUpViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/31.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class SetUpViewController: BaseViewController {
    
    private var tbView: UITableView?
    
    private var imageNames = NSArray()
    
    private var titleArray = NSArray()
    
    private var descArray = NSArray()
    
    private lazy var dataArray = NSMutableArray()
    
    private var model: RecommendModel?{
        
        didSet {
            
            if model != nil {
                let appArray = (model?.data?.ios_apps)!
                for appModel in appArray {
                    dataArray.addObject(appModel)
                    createData()
                }
                self.tbView?.reloadData()
            }
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createMyNav()
        
        createTableView()
        
        downloaderRecommendData()
        
    }
    
    func createData(){
        
        imageNames = ["identity","invitation","score","feedback","service","like","pushed","clear_cache","network_test","about","recommended"]
        titleArray = ["我的身份","邀请好友使用礼物说","给我们评分吧","意见反馈","客服电话","喜欢单品到默认清单","消息推送设置","清除缓存","网络监测","关于礼物说","推荐应用"]
        descArray = ["男孩 高中生","","奖励5积分","","4009992053","","","","","",""]
        
    }
    
    func downloaderRecommendData(){
        
        let urlString = kSetUpRecommendedUrl
        let downloader = WYPDownloader()
        downloader.delegate = self
        downloader.downloaderWithUrlString(urlString)
        
    }
    
    func createTableView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        tbView = UITableView(frame: CGRectZero, style: .Plain)
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
        tbView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 0, 0))
        })
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = UIColor.redColor()
        
    }
    
    func createMyNav(){
        
        addNavTitle("更多")
        
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

extension SetUpViewController : WYPDownloaderDelegate {
    
    func downloader(downloader: WYPDownloader, didFailWithError error: NSError) {
        print(error)
    }
    
    func downloader(downloader: WYPDownloader, didFinishWithData data: NSData?) {
        
        if let jsonData = data {
            
            let model = RecommendModel.parseModel(jsonData)
            
            dispatch_async(dispatch_get_main_queue(), { 
                [weak self] in
                self!.model = model
            })
            
        }
        
    }
    
}

extension SetUpViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rowNum = 0
        
        if imageNames != "" && titleArray != "" && descArray != "" && dataArray != "" {
            rowNum = imageNames.count + dataArray.count
        }
        
        return rowNum
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var height: CGFloat = 0
        
        if indexPath.row >= (imageNames.count - 1) && indexPath.row <= (imageNames.count+dataArray.count-2){
            
            height = 100
            
        }else{
            
            height = 50
            
        }
        
        return height
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row >= (imageNames.count - 1) && indexPath.row <= (imageNames.count+dataArray.count-2){
            
            let cellId = "setCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? SetCell

            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("SetUpCell", owner: nil, options: nil)[1] as? SetCell
            }
            let model = dataArray[indexPath.row-imageNames.count+1]
            cell?.configModel(model as! RecommendAppsModel)
            
            return cell!
            
        }else{
            let cellId = "setUpCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? SetUpCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("SetUpCell", owner: nil, options: nil)[0] as? SetUpCell
            }
            
            if indexPath.row < (imageNames.count - 1) {
                
                cell?.smallBgImageView.image = UIImage(named: imageNames[indexPath.row] as! String)
                cell?.smallTitleLabel.text = titleArray[indexPath.row] as? String
                cell?.smallDescLabel.text = descArray[indexPath.row] as? String
                
            }else{
                
                cell?.smallBgImageView.image = UIImage(named: imageNames[indexPath.row-dataArray.count] as! String)
                cell?.smallTitleLabel.text = titleArray[indexPath.row-dataArray.count] as? String
                cell?.smallDescLabel.text = descArray[indexPath.row-dataArray.count] as? String
                
            }
            
            if indexPath.row == 5 {
                
                let sw = UISwitch()
                cell?.addSubview(sw)
                
                sw.snp_makeConstraints(closure: { (make) in
                    make.right.equalTo(cell!).offset(-20)
                    make.top.equalTo(cell!).offset(10)
                    make.width.equalTo(60)
                    make.height.equalTo(40)
                })
                
            }
            
            if indexPath.row == 0 || indexPath.row == 3 || indexPath.row == 6 || indexPath.row == 7 || indexPath.row == 8 || indexPath.row == 9 {
                
                cell?.smallImageView.image = UIImage(named: "category_arrow_right")

            }else{
                cell?.smallImageView.image = nil
            }
            
            return cell!
            
        }
        
    }
    
}











