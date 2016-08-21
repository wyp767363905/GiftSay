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

//次要的横幅
public let kGiftSayBannersUrl = "http://api.liwushuo.com/v2/secondary_banners?gender=1&generation=3"

//精选(102是小导航栏解析的数据的id值)
public let kGiftSaySelectUrl = "http://api.liwushuo.com/v2/channels/102/items_v2?ad=2&gender=1&generation=3&limit=20&offset=0"

//礼物
public let kGiftSayGiftUrl = "http://api.liwushuo.com/v2/channels/111/items_v2?gender=1&generation=3&limit=20&offset=0"

//热门
public let kHotUrl = "http://api.liwushuo.com/v2/items?limit=20&offset=0&gender=1&generation=3"

//分类
//攻略除了栏目以外的"http://api.liwushuo.com/v2/channel_groups/all"
//栏目:"http://api.liwushuo.com/v2/columns?limit=11&offset=0"

//单品:"http://api.liwushuo.com/v2/item_categories/tree"








