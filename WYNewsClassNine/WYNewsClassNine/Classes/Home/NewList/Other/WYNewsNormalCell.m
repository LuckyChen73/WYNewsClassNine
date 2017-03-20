//
//  WYNewsNormalCell.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYNewsNormalCell.h"
#import <Masonry.h>
#import <UIImageView+WebCache.h>

@interface WYNewsNormalCell ()

@property (nonatomic, strong) UIImageView *newsImage;
@property (nonatomic, strong) UILabel *newsTitle;
@property (nonatomic, strong) UILabel *source;
@property (nonatomic, strong) UILabel *replyCount;


@end

@implementation WYNewsNormalCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setupUI];
    }
    return self;
}

#pragma mark - 添加子控件
- (void)setupUI
{
    //MARK:1- 创建控件
    //图片
    UIImageView *imgV = [[UIImageView alloc]init];
    imgV.image = [UIImage imageNamed:@"about_hd"];
    [imgV sizeToFit];
    [self.contentView addSubview:imgV];
    
    
    //标题
    UILabel *titleLab = [[UILabel alloc] init];
    titleLab.text = @"追寻习近平总书记的初心：正定篇";
    titleLab.numberOfLines = 2;
    [self.contentView addSubview:titleLab];
    
    
    //来源
    UILabel *sourceLab = [[UILabel alloc] init];
    sourceLab.text = @"央视";
    sourceLab.font = [UIFont systemFontOfSize:15];
    sourceLab.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:sourceLab];
    
    
    //回复数
    UILabel *replyCountLab = [[UILabel alloc]init];
    replyCountLab.text = @"688";
    replyCountLab.font = [UIFont systemFontOfSize:13];
    replyCountLab.textColor = [UIColor darkGrayColor];
    [self.contentView addSubview:replyCountLab];
    
    
    //MARK:2- 布局
    [imgV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.top.offset(8);
        make.width.mas_offset(100);
        make.height.mas_offset(80);
        make.bottom.offset(-8);
        
    }];
    
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgV.mas_right).offset(10);
        make.top.equalTo(imgV.mas_top).offset(0);
        make.right.offset(-20);
    }];
    
    [sourceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab.mas_left).offset(0);
        make.bottom.equalTo(imgV.mas_bottom).offset(0);
    }];
    
    [replyCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-10);
        make.bottom.equalTo(imgV.mas_bottom).offset(0);
    }];
    
    //记录
    _newsImage = imgV;
    _newsTitle = titleLab;
    _source = sourceLab;
    _replyCount = replyCountLab;
    
    
}



- (void)setNewsModel:(WYNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    [_newsImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]];
    _newsTitle.text = newsModel.title;
    _source.text = newsModel.source;
    _replyCount.text = newsModel.replyCount;

    
}














- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
