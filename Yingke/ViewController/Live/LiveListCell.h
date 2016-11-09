//
//  LiveListCell.h
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseAvatarImageView.h"

@interface LiveListCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIView *bgView;
@property (nonatomic, weak) IBOutlet BaseAvatarImageView *avatarImageView;
@property (nonatomic, weak) IBOutlet UILabel *nickNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *cityLabel;
@property (nonatomic, weak) IBOutlet UILabel *audienceNumerLabel;
@property (nonatomic, weak) IBOutlet UILabel *audienceDescLabel;

@property (nonatomic, weak) IBOutlet UIButton *coverBtn;
@property (nonatomic, weak) IBOutlet UIButton *statusBtn;

@property (nonatomic, weak) IBOutlet UILabel *descLabel;

+ (CGFloat)cellHeightForItem:(LiveListItem *)item;

- (void)bindItem:(LiveListItem *)item;

@end
