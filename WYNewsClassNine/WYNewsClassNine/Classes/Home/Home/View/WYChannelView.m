//
//  WYChannelView.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYChannelView.h"
#import "WYLabel.h"


const int baseTag = 6866;

@interface WYChannelView ()<WYChannelViewDelegate>


@end

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
    self.bounces = NO;
    
    self.backgroundColor = [UIColor whiteColor];
    
    //取消滚动条
    self.showsHorizontalScrollIndicator = NO;
    
    //标签下标
    NSInteger idx = 0;
    
    //lab 的 x 坐标
    CGFloat originX = 0;
    
    //遍历模型数组，添加 lab
    for (WYChannelModel *model in _modelArr) {
        
        //创建 lab
        WYLabel *lab = [WYLabel labelWithModel:model];
        
        lab.isSelected = NO;
        
        //给 lab 添加一个 tag，所有view 默认 tag 都为0，添加 basetag 可以防止有多个视图对象 tag 都为0时，取错对象
        lab.tag = baseTag + idx;
        
        //创建 lab 的 frame
        CGRect frame = CGRectMake(originX, 0, lab.bounds.size.width, 40);
        
        lab.frame = frame;
        
        lab.userInteractionEnabled = YES;
        //给 lab 添加手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(changeIndex:)];
        [lab addGestureRecognizer:tap];

        //每创建一个 lab，origin 的 x 就改为下一个 lab 的 origin
        originX += lab.bounds.size.width;
        
        idx += 1;
        
        [self addSubview:lab];
        
    }
    
    //将第0个设为高亮，在项目启动时
    [self setIsSelectedIndex:0];
    
    //设置频道视图的 contentSize
    self.contentSize = CGSizeMake(originX, 40);
    
}

//实现点按手势的监听方法
- (void)changeIndex:(UITapGestureRecognizer *)tap
{
    //取到 lab和它的 index
    WYLabel *lab = (WYLabel *)tap.view;
    NSInteger index = lab.tag - baseTag;
    
    //选中的 lab
    [self setIsSelectedIndex:index];
    
    //判断代理是否实现代理方法
    if ([self.channelDelegate respondsToSelector:@selector(channelView:)]) {
        [self.channelDelegate channelView:index];
    }
    
    
    
}


- (void)setIsSelectedIndex:(NSInteger)isSelectedIndex
{
    NSLog(@"------%zd",isSelectedIndex);
    
    //通过下标拿到标签
    WYLabel *selectLab = [self viewWithTag:_isSelectedIndex + baseTag];
    //取消原来的 lab 选中状态
    selectLab.isSelected = NO;
    
    
    //通过下标拿到标签
    WYLabel *willSelectLab = [self viewWithTag:isSelectedIndex + baseTag];
    //把将要选中的 lab 选中状态改为 yes
    willSelectLab.isSelected = YES;
    
    
    //如果选中高亮的 lab 超出屏幕，则让它滚动到可视区域
    CGFloat originX = willSelectLab.frame.origin.x;
    CGFloat rightX = willSelectLab.frame.origin.x + willSelectLab.frame.size.width;
    
    if (originX < self.contentOffset.x || rightX > self.contentOffset.x) {
        
        [self scrollRectToVisible:willSelectLab.frame animated:YES];
    }
    
    
    //把当前选中的 lab 的下标赋值给原来的选中 lab 的下标
    _isSelectedIndex = isSelectedIndex;
    
}




@end
