//
//  Const.swift
//  GiftSay
//
//  Created by qianfeng on 16/8/16.
//  Copyright © 2016年 qianfeng. All rights reserved.
//

import UIKit

public let kScreenWidth = UIScreen.mainScreen().bounds.size.width

public let kScreenHeight = UIScreen.mainScreen().bounds.size.height

//礼物说
//精选
//小导航栏
public let kGiftSaySmallNavBarUrl = "http://api.liwushuo.com/v2/channels/preset?gender=1&generation=3"

//广告
public let kGiftSayAdUrl = "http://api.liwushuo.com/v2/banners"

//广告点击详情的内容(在广告里面的这个属性就是下面网页的后缀"target_id": 1045348)
//第一种
public let kADPostUrl = "http://api.liwushuo.com/v2/posts_v2/%@"
//第一种广告点击详情后下面的你可能喜欢的内容
public let kADPostLikeUrl = "http://hawaii.liwushuo.com/api/posts/%@/recommend"
//第三种
public let kADCollection = "http://api.liwushuo.com/v2/collections/%@/posts?gender=1&generation=3&limit=20&offset=0"

//次要的横幅
public let kGiftSayBannersUrl = "http://api.liwushuo.com/v2/secondary_banners?gender=1&generation=3"

//精选(102是小导航栏解析的数据的id值)
public var kGiftSaySelectUrl = "http://api.liwushuo.com/v2/channels/%@/items_v2?ad=2&gender=1&generation=3&limit=20&offset=0"

//热门
public let kHotUrl = "http://api.liwushuo.com/v2/items?limit=20&offset=0&gender=1&generation=3"

//分类
//攻略
//栏目
public let kCategoryStrategyColumnUrl = "http://api.liwushuo.com/v2/columns?limit=11&offset=0"

//除了栏目以外的
public let kCategoryStrategyNoColumnUrl = "http://api.liwushuo.com/v2/channel_groups/all"

//单品
public let kCategoryItemUrl = "http://api.liwushuo.com/v2/item_categories/tree"

//我
//设置按钮里面的推荐应用
public let kSetUpRecommendedUrl = "http://api.liwushuo.com/v2/apps/ios"





