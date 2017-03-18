//
//  WYLabel.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYLabel.h"

const CGFloat bigFont = 18;
const CGFloat smallFont = 15;

@interface WYLabel ()


@end

@implementation WYLabel

+(instancetype)labelWithModel:(WYChannelModel *)model
{
    WYLabel *lab = [[WYLabel alloc] init];
    //给 lab 赋值并设置 lab 的属性
    lab.text = model.tname;
    //对齐
    lab.textAlignment = NSTextAlignmentCenter;
    //大小
    lab.font = [UIFont systemFontOfSize:bigFont];
    //颜色
    lab.textColor = [UIColor redColor];
    
    [lab sizeToFit];
    
    return lab;
}

- (void)setIsSelected:(BOOL)isSelected
{
    _isSelected = isSelected;
    
    if (isSelected == NO) {
        
        self.font = [UIFont systemFontOfSize:smallFont];
        self.textColor = [UIColor blackColor];
        
    }else {
        
        self.font = [UIFont systemFontOfSize:bigFont];
        self.textColor = [UIColor redColor];
    }
    
    
    
}



@end
