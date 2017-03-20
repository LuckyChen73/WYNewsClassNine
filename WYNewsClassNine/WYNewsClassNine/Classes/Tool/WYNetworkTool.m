//
//  WYNetworkTool.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNetworkTool.h"

@implementation WYNetworkTool

+ (instancetype)sharedTool
{
    static WYNetworkTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tool = [[WYNetworkTool alloc]init];
    });
    
    return tool;
}


- (void)requestWithURL:(NSString *)urlStr withMethod:(NSString *)method withParameters:(id)parameters withCallBack:(void (^)(id))callBack
{
    //调用 afn 发起 get 请求
    if ([method isEqualToString:@"GET"]) {
        
        [self GET:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
//            NSLog(@"******%@",responseObject);
            
            callBack(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            callBack(nil);
        }];
        
    }
    
    //调用 afn 发起 post 请求
    if ([method isEqualToString:@"POST"]) {
        
        [self POST:urlStr parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            callBack(responseObject);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            NSLog(@"%@",error);
            callBack(nil);
        }];
        
    }
    
}



@end
