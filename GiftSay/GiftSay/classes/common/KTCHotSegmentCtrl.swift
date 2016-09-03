//
//  KTCHotSegmentCtrl.swift
//  GiftSay
//
//  Created by qianfeng on 16/9/3.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

class KTCHotSegmentCtrl: UIView {
    
    private var lineView: UIView?
    
    var spaceX: CGFloat = 30
    
    var selectIndex: Int = 0 {
        
        didSet {
            
            if selectIndex != oldValue {
                
                seletBtnAtIndex(selectIndex, lastIndex: oldValue)
                
            }
            
        }
        
    }
    
    init(frame: CGRect, titleNames: [String]) {
        super.init(frame: frame)
        
        if titleNames.count > 0 {
            
            let w = (bounds.size.width-CGFloat(titleNames.count-1)*spaceX)/CGFloat(titleNames.count)
            
            for i in 0..<titleNames.count {
                
                let frame = CGRectMake(CGFloat(i)*(w+spaceX), 0, w, bounds.size.height)
                
                let btn = KTCHotSegmentBtn(frame: frame)
                
                btn.configTitle(titleNames[i])
                
                btn.addTarget(self, action: #selector(clickBtn(_:)), forControlEvents: .TouchUpInside)
                
                btn.tag = 300+i
                
                addSubview(btn)
                
                if i == 0 {
                    
                    btn.clicked = true
                    
                }
                
            }
            
            lineView = UIView()
            lineView?.backgroundColor = UIColor.whiteColor()
            lineView?.frame = CGRectMake(0, bounds.size.height-2, w, 2)
            addSubview(lineView!)
            
        }
        
    }
    
    func clickBtn(btn: KTCHotSegmentBtn){
        
        if btn.tag != selectIndex+300 {
            
            selectIndex = btn.tag - 300
            
        }
        
    }
    
    func seletBtnAtIndex(selectIndex: Int, lastIndex: Int){
        
        let curView = viewWithTag(300+selectIndex)
        if curView?.isKindOfClass(KTCHotSegmentBtn.self) == true {
            let curBtn = curView as! KTCHotSegmentBtn
            curBtn.clicked = true
        }
        
        let lastView = viewWithTag(300+lastIndex)
        if lastView?.isKindOfClass(KTCHotSegmentBtn.self) == true {
            let lastBtn = lastView as! KTCHotSegmentBtn
            lastBtn.clicked = false
        }
        
        lineView?.frame.origin.x = ((lineView?.bounds.width)!+spaceX)*CGFloat(selectIndex)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

class KTCHotSegmentBtn: UIControl {
    
    private var label: UILabel?
    
    var clicked: Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        label = UILabel.createLabel(nil, textAlignment: .Center, font: UIFont.systemFontOfSize(20), textColor: UIColor.whiteColor())
        label?.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height-10)
        addSubview(label!)
        
    }
    
    func configTitle(title: String){
        label?.text = title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

























