//
//  BaseAvatarImageView.m
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "BaseAvatarImageView.h"

@interface BaseAvatarImageView ()

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation BaseAvatarImageView

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self configureViewCircleType];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configureViewCircleType];
    }
    return self;
}

- (void)setImageWithURLString:(NSString *)url level:(NSString *)level
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:nil];
}

@end
