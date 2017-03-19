//
//  WYNewsListController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNewsListController.h"
#import <Masonry.h>

@interface WYNewsListController ()

@end

@implementation WYNewsListController

- (instancetype)initWithIndex:(NSInteger)index withChannelModel:(WYChannelModel *)model
{
    if (self = [super init]) {
        
        self.index = index;
        _model = model;
        
    }
    
    
    return self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0];
    
    //添加调试标签
//    UILabel *debugLab = [[UILabel alloc]init];
//    
//    debugLab.textColor = [UIColor whiteColor];
//    
//    debugLab.text = [NSString stringWithFormat:@"第 %zd 页  %@",_index,_model.tname];
//    
//    [self.view addSubview:debugLab];
//    
//    [debugLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.offset(0);
//        make.centerY.offset(0);
//        
//        make.size.mas_offset(CGSizeMake(100, 40));
//    }];

    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
