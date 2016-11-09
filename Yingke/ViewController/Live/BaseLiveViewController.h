//
//  BaseLiveViewController.h
//  Yingke
//
//  Created by mayw on 2016/11/9.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "BaseViewController.h"
#import "LivingView.h"

@interface BaseLiveViewController : BaseViewController

@property (nonatomic, strong) LivingView *livingView;
@property (nonatomic, assign) LiveType liveType;

@end
