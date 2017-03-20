//
//  WYNetworkTool.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

@interface WYNetworkTool : AFHTTPSessionManager

//单例
+ (instancetype)sharedTool;


/**
 网络中间层

 @param urlStr  url 字符串
 @param method 请求方式
 @param parameters 请求参数
 @param callBack 回调 block
 */
- (void)requestWithURL:(NSString *)urlStr withMethod:(NSString *)method withParameters:(id)parameters withCallBack:(void(^)(id))callBack;




@end
