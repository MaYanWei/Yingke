//
// DemoTableFooterView.m
//
// @author Shiki
//

#import "RefreshTableFooterView.h"

@implementation RefreshTableFooterView

- (void) awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    [super awakeFromNib];
    
    self.infoLabel.textColor = k999999;
}

- (void) dealloc
{
    NSLog(@"RefreshTableFooterView dealloc");
    
    self.activityIndicator = nil;
    self.infoLabel = nil;
}

@end
