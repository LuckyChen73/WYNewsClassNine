//
//  WYChannelView.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol WYChannelViewDelegate <NSObject>

- (void)channelView:(NSInteger)index;

@end


@interface WYChannelView : UIScrollView

@property (nonatomic, weak) id<WYChannelViewDelegate> delegate;



@property (nonatomic, strong) NSArray *modelArr;

//是否为选中的下标
@property (nonatomic, assign) NSInteger isSelectedIndex;


@end
