//
//  ProfileLoginCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol ProfileLoginCellDelegate: NSObjectProtocol {
    
    func profileJumpLogin(vc: UIViewController)
    
}

class ProfileLoginCell: UITableViewCell {
    
    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    weak var delegate: ProfileLoginCellDelegate?
    
    var isLogin: Bool = false
    
    func configModel(){
        
        loginBtn.setBackgroundImage(UIImage(named: "me_profilebackground@2x.jpg"), forState: .Normal)
        
        loginLabel.text = "登录"
        
        loginImageView.image = UIImage(named: "male")
        
        loginImageView.layer.borderWidth = 1
        loginImageView.layer.borderColor = UIColor.whiteColor().CGColor
        loginImageView.layer.cornerRadius = 65/2
        loginImageView.clipsToBounds = true
        
    }
    
    @IBAction func loginAction(sender: UIButton) {
        
        if (!isLogin) {
            
            let loginCtrl = LoginViewController()
            
            self.delegate?.profileJumpLogin(loginCtrl)
            
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
