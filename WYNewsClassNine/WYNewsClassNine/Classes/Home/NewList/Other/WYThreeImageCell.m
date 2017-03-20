//
//  WYThreeImageCell.m
//  WYNewsClassNine
//
//  Created by chenWei on 2017/3/20.
//  Copyright © 2017年 陈伟. All rights reserved.
//

#import "WYThreeImageCell.h"

#import <UIImageView+WebCache.h>

@interface WYThreeImageCell ()




@property (weak, nonatomic) IBOutlet UILabel *titleLab;

@property (weak, nonatomic) IBOutlet UIImageView *img1View;

@property (weak, nonatomic) IBOutlet UIImageView *img2View;

@property (weak, nonatomic) IBOutlet UIImageView *img3View;

@property (weak, nonatomic) IBOutlet UILabel *sourceLab;

@property (weak, nonatomic) IBOutlet UILabel *replyCountLab;


@end


@implementation WYThreeImageCell

- (void)setNewsModel:(WYNewsModel *)newsModel
{
    _newsModel = newsModel;
    
    _titleLab.text = newsModel.title;
    
    [_img1View sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]];
    
    NSString *imgStr2 = _newsModel.imgExtra[0][@"imgsrc"];
    [_img2View sd_setImageWithURL:[NSURL URLWithString:imgStr2]];
    
    NSString *imgStr3 = _newsModel.imgExtra[1][@"imgsrc"];
    [_img3View sd_setImageWithURL:[NSURL URLWithString:imgStr3]];
    
    _sourceLab.text = newsModel.source;
    _replyCountLab.text = newsModel.replyCount;
    
}





- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
