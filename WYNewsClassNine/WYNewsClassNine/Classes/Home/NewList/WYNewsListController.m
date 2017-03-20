//
//  WYNewsListController.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/18.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNewsListController.h"
#import <Masonry.h>

@interface WYNewsListController ()<UITableViewDataSource>

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
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self addTableView];
}

#pragma mark - 添加 tableView
- (void)addTableView
{
    UITableView *tabV = [[UITableView alloc] init];
    tabV.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:tabV];
    [tabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    tabV.dataSource = self;
    
    [tabV registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}



#pragma mark - 数据源方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = indexPath.description;
    return cell;
}


#pragma mark - 加载数据
- (void)loadData
{
    
    
    
}






@end
