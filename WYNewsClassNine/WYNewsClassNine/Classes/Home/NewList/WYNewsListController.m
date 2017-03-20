//
//  WYNewsListController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNewsListController.h"
#import <Masonry.h>
#import "WYNewsNormalCell.h"

@interface WYNewsListController ()<UITableViewDataSource>

@end
//重用标识
static NSString *normalCellID = @"normalCellID";


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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTableView];
}

#pragma mark - 添加 tableView
- (void)addTableView
{
    //创建tabView
    UITableView *tabV = [[UITableView alloc] init];
    tabV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabV];
    [tabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    //设置数据源
    tabV.dataSource = self;
    
    //注册 cell
    [tabV registerClass:[WYNewsNormalCell class] forCellReuseIdentifier:normalCellID];
    
    //设置 tabView 的行高
    tabV.estimatedRowHeight = 200;
    tabV.rowHeight = UITableViewAutomaticDimension;
    
}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WYNewsNormalCell *normalCell = [tableView dequeueReusableCellWithIdentifier:normalCellID forIndexPath:indexPath];
    
    
    return normalCell;
}


#pragma mark - 加载数据
- (void)loadData
{
    
    
    
}






@end
