//
// DemoTableHeaderView.m
//
// @author Shiki
//

#import "RefreshTableHeaderView.h"

@implementation RefreshTableHeaderView
@synthesize loadingImageView;

- (void)awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    [super awakeFromNib];
    
    self.loadingImageView.image = [UIImage imageNamed:@"loading_01"];
    self.loadingImageView.animationImages = [NSMutableArray arrayWithObjects:
                                             [UIImage imageNamed:@"loading_01"],
                                             [UIImage imageNamed:@"loading_02"],
                                             [UIImage imageNamed:@"loading_03"],
                                             [UIImage imageNamed:@"loading_04"],
                                             [UIImage imageNamed:@"loading_05"],
                                             [UIImage imageNamed:@"loading_06"],
                                             nil];
    self.loadingImageView.animationDuration = 0.6;
    self.loadingImageView.animationRepeatCount = MAXFLOAT;
}

- (void)dealloc
{
    self.loadingImageView.animationImages = nil;
    self.loadingImageView = nil;
}

@end
