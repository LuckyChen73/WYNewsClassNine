//
//  WYChannelModel.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WYChannelModel : NSObject

//频道id
@property (nonatomic, copy) NSString *tid;
//频道名字
@property (nonatomic, copy) NSString *tname;


/**
 获取所有频道模型数据

 @return <#return value description#>
 */
+ (NSArray *)channelModel;


@end
