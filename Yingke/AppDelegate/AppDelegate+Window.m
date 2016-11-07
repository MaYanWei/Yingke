//
//  AppDelegate+Window.m
//  Yingke
//
//  Created by mayw on 2016/11/7.
//  Copyright © 2016年 mayw. All rights reserved.
//

#import "AppDelegate+Window.h"
#import "BaseNavigationController.h"
#import "LiveListTableViewController.h"
#import "UIImage+Color.h"

@implementation AppDelegate (Window)

+ (void)configureNavbar:(UINavigationBar *)bar
{
    [bar setBarTintColor:kThemeColor];
    [bar setTintColor:kFFFFFF];
    [bar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                 kFFFFFF, NSForegroundColorAttributeName, kFont17, NSFontAttributeName, nil]];
    [bar setBackgroundImage:[UIImage imageWithColor:kThemeColor size:CGSizeMake(kScreenWidth, kNavigationBarHeight)] forBarMetrics:UIBarMetricsDefault];
    [bar setShadowImage:[[UIImage alloc] init]];
}

- (void)initWindow
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    LiveListTableViewController *liveListTableVC = [[LiveListTableViewController alloc] init];
    BaseNavigationController *baseNav = [[BaseNavigationController alloc] initWithRootViewController:liveListTableVC];
    
    self.window.backgroundColor = kFFFFFF;
    self.window.rootViewController = baseNav;
    [self.window makeKeyAndVisible];
    
    [AppDelegate configureNavbar:[UINavigationBar appearance]];
}

@end
