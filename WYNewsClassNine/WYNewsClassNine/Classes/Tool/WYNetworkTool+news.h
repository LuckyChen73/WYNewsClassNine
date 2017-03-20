//
//  WYNetworkTool+news.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNetworkTool.h"

@interface WYNetworkTool (news)


/**
 获取网易新闻的列表的数据

 @param tid  tid 字符串
 @param callBack 完成回调，将模型数组直接返回
 */
- (void)requestNewsListWithTid:(NSString *)tid withCallBack:(void(^)(NSArray *modelArr))callBack;


/**
 获取网易新闻的详细页的数据

 @param docid 新闻的 id
 @param callBack  完成回调，将处理好的网易新闻的正文 html 字符串返回
 */
- (void)requestNewsListWithDetail:(NSString *)docid withCallBack:(void (^)(NSString *bodyStr))callBack;



@end
