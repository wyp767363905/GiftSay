//
//  HMyLayout.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/20.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

protocol HMyLayoutDelegate: NSObjectProtocol {
    
    func numberOfColumns(layout: HMyLayout) -> Int
    
}

class HMyLayout: UICollectionViewLayout {
    
    var delegate: HMyLayoutDelegate?
    
    private var sectionInsets: UIEdgeInsets?
    
    private var itemSpace: CGFloat?
    
    private var lineSpace: CGFloat?
    
    private var column: Int = 2
    
    private lazy var columnArray = NSMutableArray()
    
    private lazy var attrArray = NSMutableArray()
    
    init(sectionInsets: UIEdgeInsets, itemSpace: CGFloat, lineSpace:CGFloat) {
        super.init()
        
        self.sectionInsets = sectionInsets
        self.itemSpace = itemSpace
        self.lineSpace = lineSpace
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareLayout() {
        super.prepareLayout()
        
        columnArray.removeAllObjects()
        attrArray.removeAllObjects()
        
        if self.delegate != nil {
            column = (delegate?.numberOfColumns(self))!
        }
        
        for _ in 0..<self.column {
            
            let height = NSNumber(float: Float(sectionInsets!.top))
            columnArray.addObject(height)
            
        }
        
        let width = ((collectionView?.bounds.size.width)!-(sectionInsets?.left)!-(sectionInsets?.right)!-itemSpace!*CGFloat(column-1))/CGFloat(column)
        
        let cellCnt = collectionView?.numberOfItemsInSection(0)
        
        for i in 0..<cellCnt! {
            
            let indexPath = NSIndexPath(forItem: i, inSection: 0)
            
            let height: CGFloat = 250
            
            let curIndex = self.columnOfLowesRow()
            
            let x = (sectionInsets?.left)! + (width + itemSpace!)*CGFloat(curIndex)
            
            let curRowHeight = columnArray[curIndex] as! NSNumber
            
            let y = CGFloat(curRowHeight.floatValue) + lineSpace!
            
            let frame = CGRectMake(x, y, width, height)
            
            let attr = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
            attr.frame = frame
            
            attrArray.addObject(attr)
            
            self.columnArray[curIndex] = y+height

        }
        
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let array = NSArray(array: attrArray)
        
        return array as? [UICollectionViewLayoutAttributes]
        
    }
    
    override func collectionViewContentSize() -> CGSize {
        
        let maxHeight = maxHeightForAllColumns()
        return CGSizeMake((collectionView?.bounds.size.width)!, maxHeight+(sectionInsets?.bottom)!)
        
    }
    
    func maxHeightForAllColumns() -> CGFloat {
        
        var curHeight = CGFloat.min
        
        for i in 0..<columnArray.count {
            
            let heightNumber = columnArray[i] as! NSNumber
            let height = CGFloat(heightNumber.floatValue)
            
            if height > curHeight {
                
                curHeight = height
                
            }
            
        }
        
        return curHeight
        
    }
    
    class func ToObtainHeight(model: HotLikeDataModel) -> CGFloat {
        
        let spaceY: CGFloat = 10
        let tH: CGFloat = 10
        let cH: CGFloat = 250
        var num = (model.recommend_items?.count)!/2
        if (model.recommend_items?.count)! % 2 != 0 {
            num += 1
        }
        let offsetY = tH+cH*CGFloat(num)+spaceY*CGFloat(num+2)
        
        return offsetY
        
    }
    
    func columnOfLowesRow() -> Int {
        
        var height: CGFloat = CGFloat.max
        
        var minIndex: Int = -1
        
        for i in 0..<columnArray.count {
            
            let curNumber = self.columnArray[i] as! NSNumber
            let curHeight = CGFloat(curNumber.floatValue)
            
            if curHeight < height {
                height = curHeight
                minIndex = i
            }
            
        }
        
        return minIndex
        
    }
    
}










