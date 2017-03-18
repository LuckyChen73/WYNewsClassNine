//
//  WYChannelModel.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYChannelModel.h"
#import <YYModel.h>

@implementation WYChannelModel


+ (NSArray *)channelModel
{
    //获取频道的二进制数据
    NSData *data = [NSData dataWithContentsOfURL:[[NSBundle mainBundle]URLForResource:@"topic_news.json" withExtension:nil]];
    
    //反序列化
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    
    //从字典中取到 tlist 字典数组
    NSArray *dicArr = dic[@"tList"];
    
    //把字典数组转成模型数组
    NSArray *modelArr = [NSArray yy_modelArrayWithClass:[WYChannelModel class] json:dicArr];
    
    return modelArr;
}




@end
