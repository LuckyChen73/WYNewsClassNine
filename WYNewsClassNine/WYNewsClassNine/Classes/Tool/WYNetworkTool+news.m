//
//  WYNetworkTool+news.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNetworkTool+news.h"
#import "WYNewsModel.h"
#import <YYModel.h>

@implementation WYNetworkTool (news)

- (void)requestNewsListWithTid:(NSString *)tid withCallBack:(void (^)(NSArray *))callBack
{
    //把传进的 tid 与 url 字符串拼接
    NSString *urlStr = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/headline/%@/0-20.html",tid];
    
    [[WYNetworkTool sharedTool] requestWithURL:urlStr withMethod:@"GET" withParameters:nil withCallBack:^(id response) {
      
        if (response != nil) {
            //根据对应的 tid 取到的字典数组
            NSArray *dicArr = response[tid];
            
            //把字典数组转模型数组
            NSArray *modelArr = [NSArray yy_modelArrayWithClass:[WYNewsModel class] json:dicArr];
            
            //返回模型数组
            callBack(modelArr);
        }else {
            
            callBack(nil);
        }
        
    }];
}


- (void)requestNewsListWithDetail:(NSString *)docid withCallBack:(void (^)(NSString *))callBack
{
    //把传进的 docid 与 url 字符串拼接
    NSString *urlStr = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/full.html",docid];
    
    [[WYNetworkTool sharedTool] requestWithURL:urlStr withMethod:@"GET" withParameters:nil withCallBack:^(id response) {
        
        //根据 docid取出详情页的字典
        NSDictionary *bodyDic = response[docid];

        //取到正文 html 字符串
        NSString *bodyStr = bodyDic[@"body"];
        
        //取到正文的图片
        NSArray *bodyImgArr = bodyDic[@"img"];
        
        //正文显示样式，从本地加载
        NSString *cssStr = [NSString stringWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"news.css" withExtension:nil]  encoding:NSUTF8StringEncoding error:NULL];
        
        //将所有的注释掉的 `<!--IMG#0-->` 格式的图片字符串,替换成hmtl中 img标签
        for (NSDictionary *img in bodyImgArr) {
            //把图片地址拼接成 htmlStr
            NSString *htmlStr = [NSString stringWithFormat:@"<img src=%@>",img[@"src"]];
            
            //用 htmlStr 替换 img[@"ref"];
            bodyStr = [bodyStr stringByReplacingOccurrencesOfString:img[@"ref"] withString:htmlStr];
            
        }
        
        //将 css 与 body 拼接成一个完整的 htmlStr
        NSString *htmlStr = [NSString stringWithFormat:@"%@%@",cssStr,bodyStr];
        
        //回调，将 htmlStr 传给控制器显示
        callBack(htmlStr);
    
    }];
    
    
}

@end
