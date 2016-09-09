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
public var kHotUrl = "http://api.liwushuo.com/v2/items?limit=20&offset=0&gender=1&generation=3"
//单品(上面网址传id下来)
public let kHotDetailItemUrl = "http://api.liwushuo.com/v2/items/%@"
public let kHotDetailLikeUrl = "http://api.liwushuo.com/v2/items/%@/recommend"
//评论
public let kHotCommentsUrl = "http://api.liwushuo.com/v2/items/%@/comments?limit=20&offset=0"

//分类
//攻略
//栏目
public let kCategoryStrategyColumnUrl = "http://api.liwushuo.com/v2/columns?limit=11&offset=0"

//栏目点击事件详情(上面的id)http://api.liwushuo.com/v2/columns/13?limit=20&offset=0
public let kColumnDetailUrl = "http://api.liwushuo.com/v2/columns/%ld?limit=20&offset=0"

//除了栏目以外的
public let kCategoryStrategyNoColumnUrl = "http://api.liwushuo.com/v2/channel_groups/all"

//除了栏目以外的点击详情http://api.liwushuo.com/v2/channels/111/items_v2?limit=20&offset=0
public let kNoColumnDetailUrl = "http://api.liwushuo.com/v2/channels/%ld/items_v2?limit=20&offset=0"

//搜索点击进入第一个界面内容的网址
public let kSearchKeyWordsUrl = "http://api.liwushuo.com/v2/search/hot_words"

//点击搜索或者输入搜索内容的网址(keyword后面就是搜索关键字用URL转换的)首先是攻略界面
//http://api.liwushuo.com/v2/search/post?keyword=%E6%9C%88%E9%A5%BC&limit=20&offset=0&sort=

//后是单品
//http://api.liwushuo.com/v2/search/item?keyword=%E6%9C%88%E9%A5%BC&limit=20&offset=0&sort=

//热度排行
//http://api.liwushuo.com/v2/search/item?keyword=%E6%9C%88%E9%A5%BC&limit=20&offset=0&sort=hot

//价格从低到高
//http://api.liwushuo.com/v2/search/item?keyword=%E6%9C%88%E9%A5%BC&limit=20&offset=0&sort=price%3Aasc

//价格从高到低
//http://api.liwushuo.com/v2/search/item?keyword=%E6%9C%88%E9%A5%BC&limit=20&offset=0&sort=price%3Adesc

//第一个界面中点击使用选礼神器快速挑选礼物(上面的四个按钮的内容)
//http://api.liwushuo.com/v2/search/item_filter

//内容(默认情况)
//http://api.liwushuo.com/v2/search/item_by_type?limit=20&offset=0

//顺序是(personality个性 price价格 scene场合 sort热度 target对象)
//所有选项都选的情况
//http://api.liwushuo.com/v2/search/item_by_type?limit=20&offset=0&personality=26&price=0_50&scene=30&sort=hot&target=18

//单品
public let kCategoryItemUrl = "http://api.liwushuo.com/v2/item_categories/tree"

//我
//设置按钮里面的推荐应用
public let kSetUpRecommendedUrl = "http://api.liwushuo.com/v2/apps/ios"





