//
//  ProfileLoginCell.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/23.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class ProfileLoginCell: UITableViewCell {
    
    @IBOutlet weak var loginImageView: UIImageView!
    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    func configModel(){
        
        loginBtn.setBackgroundImage(UIImage(named: "me_profilebackground@2x"), forState: .Normal)
        
        loginLabel.text = "登录"
        
        loginImageView.image = UIImage(named: "male")
        
        loginImageView.layer.borderWidth = 1
        loginImageView.layer.borderColor = UIColor.whiteColor().CGColor
        loginImageView.layer.cornerRadius = 65/2
        loginImageView.clipsToBounds = true
        
    }
    
    @IBAction func loginAction(sender: UIButton) {
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
