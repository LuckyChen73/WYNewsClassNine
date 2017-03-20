//
//  WYNewsModel.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYNewsModel : NSObject
//回复数
@property (nonatomic, copy) NSString *replyCount;
//文章 id
@property (nonatomic, copy) NSString *docid;
//是否是头部
@property (nonatomic, assign) BOOL hasHead;
//文章标题
@property (nonatomic, copy) NSString *title;
//新闻 url
@property (nonatomic, copy) NSString *url;
//新闻来源
@property (nonatomic, copy) NSString *source;
//是否是大图
@property (nonatomic, assign) BOOL imgType;
//图片地址
@property (nonatomic, copy) NSString *imgsrc;

//是否是第一张图片的其余图片
@property (nonatomic, strong) NSArray *imgExtra;



@end
