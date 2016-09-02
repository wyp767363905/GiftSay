//
//  ProfileViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ProfileViewController: KTCHomeViewController {
    
    private var tbView: UITableView?
    
    var isLogin: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createMyNav()
        
        createTableView()
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.barTintColor = nil
        
    }
    
    func createTableView(){
        
        automaticallyAdjustsScrollViewInsets = false
        
        tbView = UITableView()
        tbView?.delegate = self
        tbView?.dataSource = self
        view.addSubview(tbView!)
        
        tbView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(-64, 0, 49, 0))
        })
        
    }
    
    func createMyNav(){
        
        var leftArray = Array<UIBarButtonItem>()
        var rightArray = Array<UIBarButtonItem>()
        for i in 0..<4 {
            
            let btn = UIButton(type: .Custom)
            btn.frame = CGRectMake(0, 0, 20, 20)
            
            if i == 0 {
                btn.setBackgroundImage(UIImage(named: "mail"), forState: .Normal)
            }
            
            if i == 1 {
                btn.setBackgroundImage(UIImage(named: "alarm_clock"), forState: .Normal)
            }
            
            if i == 2 {
                btn.setBackgroundImage(UIImage(named: "set_up"), forState: .Normal)
            }
            
            if i == 3 {
                btn.setBackgroundImage(UIImage(named: "scan"), forState: .Normal)
            }
            
            btn.tag = 500+i
            
            btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
            
            let barBtn = UIBarButtonItem(customView: btn)
            
            if i < 2 {
                leftArray.append(barBtn)
            }else if i < 4 {
                rightArray.append(barBtn)
            }
            
        }
        
        navigationItem.leftBarButtonItems = leftArray
        navigationItem.rightBarButtonItems = rightArray
        
    }
    
    func clickBtn(btn: UIButton){
        
        let index = btn.tag - 500
        
        if index == 0 {
            
            if (!isLogin) {
                let loginCtrl = LoginViewController()
                presentViewController(loginCtrl, animated: true, completion: nil)
            }
            
        }else if index == 1 {
            
            if (!isLogin) {
                let loginCtrl = LoginViewController()
                presentViewController(loginCtrl, animated: true, completion: nil)
            }
            
        }else if index == 2 {
            
            let setUpCtrl = SetUpViewController()
            navigationController?.pushViewController(setUpCtrl, animated: true)
            
        }else if index == 3 {
            
        }
        
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

extension ProfileViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var h: CGFloat = 0
        
        if indexPath.row == 0 {
            h = 300
        }else if indexPath.row == 1 {
            h = 80
        }else if indexPath.row == 2 {
            h = 300
        }
        
        return h
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cellId = "profileLoginCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ProfileLoginCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("ProfileLoginCell", owner: nil, options: nil).last as? ProfileLoginCell
            }
            cell?.configModel()
            cell?.delegate = self
            return cell!
        }else if indexPath.row == 1 {
            let cellId = "functionBtnCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FunctionBtnCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("FunctionBtnCell", owner: nil, options: nil).last as? FunctionBtnCell
            }
            cell?.configModel()
            cell?.delegate = self
            return cell!
        }else if indexPath.row == 2 {
            let cellId = "itemAndStrategyCellId"
            var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? ItemAndStrategyCell
            if nil == cell {
                cell = NSBundle.mainBundle().loadNibNamed("ItemAndStrategyCell", owner: nil, options: nil).last as? ItemAndStrategyCell
            }
            cell?.configModel()
            cell?.delegate = self
            return cell!
        }
        
        return UITableViewCell()
        
    }
    
}

extension ProfileViewController : ProfileLoginCellDelegate {
    
    func profileJumpLogin(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
}

extension ProfileViewController : FunctionBtnCellDelegate {
    
    func functionJumpLogin(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
}

extension ProfileViewController : ItemAndStrategyCellDelegate {
    
    func itemAndStrategyJumpLogin(vc: UIViewController) {
        presentViewController(vc, animated: true, completion: nil)
    }
    
}








