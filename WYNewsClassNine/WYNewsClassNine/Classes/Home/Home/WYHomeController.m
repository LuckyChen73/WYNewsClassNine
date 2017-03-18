//
//  WYHomeController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYHomeController.h"
#import <Masonry.h>
#import "WYChannelView.h"

@interface WYHomeController ()

@end

@implementation WYHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self addChannelView];
    
    
}


//添加频道视图
- (void)addChannelView
{
    WYChannelView *view = [[WYChannelView alloc]init];
    
    view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:view];
    
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(64);
        make.left.right.offset(0);
        make.height.offset(40);
    }];
    
    
}








@end
