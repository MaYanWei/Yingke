//
//  LivingView.h
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, LiveType)
{
    LiveTypeUnkown    = 0,
    LiveTypeAudience  = 1,
    LiveTypePlayback  = 2,
    LiveTypeAnchor    = 3
};

@interface LivingView : UIView

- (instancetype)initWithFrame:(CGRect)frame liveType:(LiveType)type;

@end
