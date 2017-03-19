//
//  WYNewsListController.h
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WYChannelModel.h"

@interface WYNewsListController : UIViewController

@property (nonatomic, strong) WYChannelModel *model;

@property (nonatomic, assign) NSInteger index;

- (id)initWithIndex:(NSInteger)index withChannelModel:(WYChannelModel *)model;


@end
