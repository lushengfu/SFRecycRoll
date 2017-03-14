//
//  SFNewsCollectionViewCell.m
//  SFRecycRoll
//
//  Created by lushengfu on 2017/3/14.
//  Copyright © 2017年 CM. All rights reserved.
//

#import "SFNewsCollectionViewCell.h"

@interface SFNewsCollectionViewCell ()

@property (nonatomic, strong)UIImageView *newsImgView;

@property (nonatomic, strong)UILabel *titleLabel;

@end

@implementation SFNewsCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.newsImgView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.newsImgView.frame = self.bounds;
    self.titleLabel.frame = CGRectMake(0, 0, self.frame.size.width, 30);
}

- (void)setNewsModel:(SFNewModel *)newsModel
{
    _newsModel = newsModel;
    
    self.newsImgView.image = [UIImage imageNamed:newsModel.icon];
    self.titleLabel.text = newsModel.title;
}

#pragma mark - getter and setter
- (UIImageView *)newsImgView
{
    if (!_newsImgView) {
        self.newsImgView = [[UIImageView alloc] init];
    }
    return _newsImgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.backgroundColor = [UIColor lightGrayColor];
        _titleLabel.alpha = 0.6;
    }
    return _titleLabel;
}


@end
