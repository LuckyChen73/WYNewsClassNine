//
//  WYLabel.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYChannelModel.h"

@interface WYLabel : UILabel


/**
 一创建 label 就给 label 赋值

 @param model <#model description#>
 @return <#return value description#>
 */
+ (instancetype)labelWithModel:(WYChannelModel *)model;


@property (nonatomic, assign) BOOL isSelected;


@end
