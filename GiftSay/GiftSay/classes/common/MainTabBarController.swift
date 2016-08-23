//
//  MainTabBarController.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private var tabbarView: UIView?
    
    //json对应的数组
    private var array:Array<Dictionary<String,String>>? {
        
        get {
            
            let path = NSBundle.mainBundle().pathForResource("Ctrl.json", ofType: nil)
            
            var tmpArray:Array<Dictionary<String,String>>? = nil
            
            if let filePath = path {
                
                let data = NSData(contentsOfFile: filePath)
                
                if let fileData = data {
                    
                    do {
                        
                        let jsonData = try NSJSONSerialization.JSONObjectWithData(fileData, options: .MutableContainers)
                        
                        if jsonData.isKindOfClass(NSArray.self) {
                            
                            tmpArray = jsonData as? Array<Dictionary<String,String>>
                            
                        }
                        
                    }catch {
                        
                        print(error)
                        return nil
                        
                    }
                    
                }
                
            }
            
            return tmpArray
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        createViewControllers()
        
    }
    
    func createViewControllers() {
        
        var ctrlNames = [String]()
        var titleNames = [String]()
        var imageNames = [String]()
        
        if let myArray = self.array {
            
            for dict in myArray {
                
                let name = dict["ctrlName"]
                ctrlNames.append(name!)
                let titleName = dict["titleName"]
                titleNames.append(titleName!)
                let imageName = dict["imageName"]
                imageNames.append(imageName!)
                
            }
            
        }else{
            
            ctrlNames = ["GiftSayViewController","HotViewController","CategoryViewController","ProfileViewController"]
            
            titleNames = ["礼物说","热门","分类","我"]
            
            imageNames = ["gift","hot","category","mine"]
            
        }
        
        var NavCtrlArray = Array<UINavigationController>()
        
        for i in 0..<ctrlNames.count {
            
            let ctrlName = "GiftSay." + ctrlNames[i]
            let cls = NSClassFromString(ctrlName) as! UIViewController.Type
            let ctrl = cls.init()
            let navCtrl = UINavigationController(rootViewController: ctrl)
            
            NavCtrlArray.append(navCtrl)
            
        }
        
        self.viewControllers = NavCtrlArray
        
        createTabbar(titleNames, imageNames: imageNames)
        
    }
    
    func createTabbar(titleNames: [String], imageNames: [String]) {
        
        tabbarView = UIView()
        tabbarView?.backgroundColor = UIColor.whiteColor()
        tabbarView?.layer.borderWidth = 1
        tabbarView?.layer.borderColor = UIColor.grayColor().CGColor
        view.addSubview(tabbarView!)
        
        tabbarView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.left.right.equalTo(self!.view)
            make.bottom.equalTo(self!.view)
            make.height.equalTo(49)
        })
        
        let width = kScreenWidth/4.0
        for i in 0..<titleNames.count {
            
            let titleName = titleNames[i]
            let imageName = imageNames[i]
            let bgImageName = imageName + "_normal"
            let selectBgImageName = imageName + "_select"
            let btn = UIButton.createBtn(nil, bgImageName: bgImageName, selectBgImageName: selectBgImageName, target: self, action: #selector(clickBtn(_:)))
            tabbarView?.addSubview(btn)
            
            btn.snp_makeConstraints(closure: { (make) in
                make.top.bottom.equalTo(tabbarView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
            })
            
            let label = UILabel.createLabel(titleName, textAlignment: .Center, font: UIFont.systemFontOfSize(8), textColor: UIColor.grayColor())
            btn.addSubview(label)
            
            label.snp_makeConstraints(closure: { (make) in
                make.left.right.equalTo(btn)
                make.bottom.equalTo(btn)
                make.height.equalTo(12)
            })
            
            btn.tag = 300+i
            label.tag = 400
            
            if (i == 0) {
                
                btn.selected = true
                label.textColor = UIColor.orangeColor()
                
            }
            
        }
        
    }
    
    func clickBtn(curBtn: UIButton){
        
        let lastBtnView = view.viewWithTag(300+selectedIndex)
        if let tmpBtn = lastBtnView {
            let lastBtn = tmpBtn as! UIButton
            let lastView = tmpBtn.viewWithTag(400)
            if let tmpLabel = lastView {
                let lastLabel = tmpLabel as! UILabel
                lastBtn.selected = false
                lastLabel.textColor = UIColor.grayColor()
            }
        }
        
        let curLabelView = curBtn.viewWithTag(400)
        if let tmpLabel = curLabelView {
            let curLabel = tmpLabel as! UILabel
            curBtn.selected = true
            curLabel.textColor = UIColor.orangeColor()
        }
        
        selectedIndex = curBtn.tag - 300
        
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
