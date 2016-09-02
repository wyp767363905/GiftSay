//
//  LoginViewController.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/1.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.whiteColor()
        
        createLoginView()
        
    }
    
    func createLoginView(){
        
        let exitBtn = UIButton.createBtn(nil, bgImageName: "exit", selectBgImageName: nil, target: self, action: #selector(exitAction))
        view.addSubview(exitBtn)
        
        exitBtn.snp_makeConstraints {
            [weak self]
            (make) in
            make.top.equalTo(self!.view).offset(40)
            make.left.equalTo(self!.view).offset(20)
            make.width.equalTo(25)
            make.height.equalTo(25)
        }
        
        let phoneImageView = UIImageView.createImageView("phone")
        view.addSubview(phoneImageView)
        
        phoneImageView.snp_makeConstraints {
            [weak self]
            (make) in
            make.top.equalTo(self!.view).offset(kScreenHeight/4)
            make.left.equalTo(self!.view).offset(40)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
        
        let messageImageView = UIImageView.createImageView("message")
        view.addSubview(messageImageView)
        
        messageImageView.snp_makeConstraints {
            [weak self]
            (make) in
            make.left.equalTo(self!.view).offset(40)
            make.width.height.equalTo(phoneImageView)
            make.top.equalTo(phoneImageView.snp_bottom).offset(15)
        }
        
        let regionBtn = UIButton.createBtn(nil, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(regionAction))
        view.addSubview(regionBtn)
        
        regionBtn.snp_makeConstraints {
            [weak self]
            (make) in
            make.top.equalTo(self!.view).offset(kScreenHeight/4)
            make.left.equalTo(phoneImageView.snp_right).offset(10)
            make.height.equalTo(20)
        }
        
        let regionImageView = UIImageView.createImageView("according_arrow")
        regionBtn.addSubview(regionImageView)
        
        regionImageView.snp_makeConstraints { (make) in
            make.top.equalTo(regionBtn).offset(5)
            make.bottom.equalTo(regionBtn).offset(-5)
            make.right.equalTo(regionBtn)
            make.width.equalTo(10)
        }
        
        let regionLabel = UILabel.createLabel("+86", textAlignment: .Center, font: UIFont.systemFontOfSize(15), textColor: UIColor.lightGrayColor())
        regionBtn.addSubview(regionLabel)
        regionLabel.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(regionBtn)
            make.right.equalTo(regionImageView.snp_left)
            make.width.equalTo(30)
        }
        
        regionBtn.snp_makeConstraints { (make) in
            make.left.equalTo(regionLabel)
        }
        
        let phoneTextFiled = UITextField()
        phoneTextFiled.placeholder = "输入手机号"
        view.addSubview(phoneTextFiled)
        
        phoneTextFiled.snp_makeConstraints {
            [weak self]
            (make) in
            make.top.bottom.equalTo(regionBtn)
            make.left.equalTo(regionBtn.snp_right).offset(10)
            make.right.equalTo(self!.view).offset(-40)
        }
        
        let phoneView = UIView()
        phoneView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(phoneView)
        
        phoneView.snp_makeConstraints { (make) in
            make.top.equalTo(regionBtn.snp_bottom).offset(4)
            make.left.equalTo(regionBtn)
            make.right.equalTo(phoneTextFiled)
            make.height.equalTo(1)
        }
        
        let messageTextFiled = UITextField()
        messageTextFiled.placeholder = "短信验证码"
        view.addSubview(messageTextFiled)
        
        messageTextFiled.snp_makeConstraints { (make) in
            make.left.equalTo(phoneView)
            make.top.equalTo(phoneView.snp_bottom).offset(10)
            make.height.equalTo(20)
        }
        
        let validationBtn = UIButton.createBtn(nil, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(validationAction))
        validationBtn.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        validationBtn.backgroundColor = UIColor.lightGrayColor()
        validationBtn.layer.cornerRadius = 3
        validationBtn.layer.masksToBounds = true
        view.addSubview(validationBtn)
        
        validationBtn.snp_makeConstraints { (make) in
            make.top.bottom.equalTo(messageTextFiled)
            make.right.equalTo(phoneView)
            make.width.equalTo(80)
        }
        
        let validationLabel = UILabel.createLabel("获取验证码", textAlignment: .Center, font: UIFont.systemFontOfSize(12), textColor: UIColor.whiteColor())
        validationBtn.addSubview(validationLabel)
        
        validationLabel.snp_makeConstraints { (make) in
            make.edges.equalTo(validationBtn)
        }
        
        messageTextFiled.snp_makeConstraints { (make) in
            make.right.equalTo(validationBtn.snp_left).offset(-10)
        }
        
        let messageView = UIView()
        messageView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(messageView)
        
        messageView.snp_makeConstraints { (make) in
            make.top.equalTo(messageTextFiled.snp_bottom).offset(4)
            make.left.right.equalTo(phoneView)
            make.height.equalTo(1)
        }
        
        let loginBtn = UIButton.createBtn("登录", bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(loginAction))
        loginBtn.backgroundColor = UIColor.redColor()
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.masksToBounds = true
        view.addSubview(loginBtn)
        
        loginBtn.snp_makeConstraints { (make) in
            make.top.equalTo(messageView.snp_bottom).offset(40)
            make.left.equalTo(messageImageView)
            make.right.equalTo(messageView)
            make.height.equalTo(40)
        }
        
        let switchBtn = UIButton.createBtn(nil, bgImageName: nil, selectBgImageName: nil, target: self, action: #selector(switchAction))
        view.addSubview(switchBtn)
        
        switchBtn.snp_makeConstraints { (make) in
            make.width.height.equalTo(validationBtn)
            make.top.equalTo(loginBtn.snp_bottom).offset(20)
            make.right.equalTo(loginBtn)
        }
        
        let switchLabel = UILabel.createLabel("使用密码登录", textAlignment: .Center, font: UIFont.systemFontOfSize(12), textColor: UIColor.redColor())
        switchBtn.addSubview(switchLabel)
        
        switchLabel.snp_makeConstraints { (make) in
            make.edges.equalTo(switchBtn)
        }
        
        let leftView = UIView()
        leftView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(leftView)
        
        leftView.snp_makeConstraints {
            [weak self]
            (make) in
            make.left.equalTo(loginBtn)
            make.height.equalTo(1)
            make.bottom.equalTo(self!.view).offset(-(kScreenHeight/4+7))
        }
        
        let rightView = UIView()
        rightView.backgroundColor = UIColor.lightGrayColor()
        view.addSubview(rightView)
        
        rightView.snp_makeConstraints {
            [weak self]
            (make) in
            make.right.equalTo(loginBtn)
            make.height.equalTo(1)
            make.bottom.equalTo(self!.view).offset(-(kScreenHeight/4+7))
            make.width.equalTo(leftView)
        }
        
        let centerLabel = UILabel.createLabel("使用社交账号登录", textAlignment: .Center, font: UIFont.systemFontOfSize(13), textColor: UIColor.grayColor())
        view.addSubview(centerLabel)
        
        centerLabel.snp_makeConstraints {
            [weak self]
            (make) in
            make.bottom.equalTo(self!.view).offset(-(kScreenHeight/4))
            make.left.equalTo(leftView.snp_right)
            make.right.equalTo(rightView.snp_left)
            make.height.equalTo(15)
            make.width.equalTo(120)
        }
        
        let array = ["weibo","weixin","qq"]
        var lastBtn: UIButton? = nil
        let w: CGFloat = 50
        let h: CGFloat = 50
        let spaceX = (kScreenWidth-w*3)/4
        let spaceY = (kScreenHeight/4-h)/2
        for i in 0..<array.count {
            
            let btn = UIButton.createBtn(nil, bgImageName: array[i], selectBgImageName: nil, target: self, action: #selector(thirdPartyLogin(_:)))
            view.addSubview(btn)
            btn.snp_makeConstraints(closure: {
                [weak self]
                (make) in
                make.bottom.equalTo(self!.view).offset(-spaceY)
                make.width.equalTo(w)
                make.height.equalTo(h)
                if i == 0 {
                    make.left.equalTo(self!.view).offset(spaceX)
                }else{
                    make.left.equalTo((lastBtn?.snp_right)!).offset(spaceX)
                }
            })
            
            lastBtn = btn
            
        }
        
    }
    
    func thirdPartyLogin(btn: UIButton){
        
        
        
    }
    
    func switchAction(){
        
    }
    
    func loginAction(){
        
    }
    
    func validationAction(){
        
    }
    
    func regionAction(){
        
    }
    
    func exitAction(){
        
        dismissViewControllerAnimated(true, completion: nil)
        
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
