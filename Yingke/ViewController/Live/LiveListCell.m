//
//  LiveListCell.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "LiveListCell.h"
#import "LiveAudienceViewController.h"

#define kLiveListCoverRate 0.97

@implementation LiveListCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    
    self.width = kScreenWidth;
    self.coverBtn.height = self.width * kLiveListCoverRate;
    
    self.nickNameLabel.textColor = k555555;
    self.audienceNumerLabel.textColor = kFFC565;
    self.cityLabel.textColor = self.audienceDescLabel.textColor = k999999;
    self.descLabel.textColor = k666666;
    self.coverBtn.backgroundColor = kF2F4F5;
    
    [UIButtonFactory configureBtn:self.statusBtn type:MWBtnTypeStatusLiving];
    
    [self.coverBtn addTarget:self action:@selector(coverBtnClick:) forControlEvents:UIControlEventTouchUpInside];
}

+ (CGFloat)cellHeightForItem:(LiveListItem *)item
{
    if (item.cacheHeight) {
        return [item.cacheHeight floatValue];
    } else {
        CGFloat height = item.name.length > 0 ? (kScreenWidth * kLiveListCoverRate + 100) : (kScreenWidth * kLiveListCoverRate + 64);
        item.cacheHeight = [NSString stringWithFormat:@"%f", height];
        return height;
    }
}

- (void)bindItem:(LiveListItem *)item
{
    self.bgView.top = 0;
    self.bgView.height = [item.cacheHeight floatValue] - 10;
    
    [self.avatarImageView setImageWithURLString:kScaleAvatarImage(item.creator.portrait, kAvtarImageSWidth, kAvtarImageSWidth) level:item.creator.level];
    [self.coverBtn sd_setImageWithURL:[NSURL URLWithString:kScaleCoverImage(item.creator.portrait, kAvtarImageLWidth, kAvtarImageLWidth)] forState:UIControlStateNormal placeholderImage:nil];
    self.nickNameLabel.text = item.creator.nick;
    self.audienceNumerLabel.text = item.online_users;
    self.cityLabel.text = [TransformHelper transCity:item.city];
    self.descLabel.text = item.name;
}

- (void)coverBtnClick:(UIButton *)btn
{
    LiveAudienceViewController *audienceVC = [[LiveAudienceViewController alloc] init];
    [self.getNavigationController pushViewController:audienceVC animated:YES];
}

@end
