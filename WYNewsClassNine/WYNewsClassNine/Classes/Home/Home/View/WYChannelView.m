//
//  WYChannelView.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYChannelView.h"
#import "WYLabel.h"

@implementation WYChannelView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        //实例化数组属性,把模型数组赋值为数组属性
        _modelArr = [WYChannelModel channelModel];
        
        [self setupUI];
    }
    return self;
}


- (void)setupUI
{
    self.backgroundColor = [UIColor whiteColor];
    
    //取消滚动条
    self.showsHorizontalScrollIndicator = NO;
    
    //lab 的 x 坐标
    CGFloat originX = 0;
    
    //遍历模型数组，添加 lab
    for (WYChannelModel *model in _modelArr) {
        
        //创建 lab
        WYLabel *lab = [WYLabel labelWithModel:model];
        
        lab.isSelected = NO;
        
        //创建 lab 的 frame
        CGRect frame = CGRectMake(originX, 0, lab.bounds.size.width, 40);
        
        lab.frame = frame;
        
        lab.userInteractionEnabled = YES;
        
        //每创建一个 lab，origin 的 x 就改为下一个 lab 的 origin
        originX += lab.bounds.size.width;
        
        [self addSubview:lab];
        
    }
    
    //设置频道视图的 contentSize
    self.contentSize = CGSizeMake(originX, 40);
    
}


@end
