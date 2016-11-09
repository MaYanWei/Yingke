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
    
    self.loadingImageView.image = [UIImage imageNamed:@"refresh_fly_0001"];
    
    NSMutableArray *animationImages = [NSMutableArray arrayWithCapacity:28];
    for (int i = 0; i < 28; i++) {
        @autoreleasepool {
            NSString *imageNamed = [NSString stringWithFormat:@"refresh_fly_00%02d", i + 1];
            [animationImages addObject:kImage(imageNamed)];
        }
    }
    self.loadingImageView.animationImages = animationImages;
    self.loadingImageView.animationDuration = 0.6;
    self.loadingImageView.animationRepeatCount = MAXFLOAT;
}

- (void)dealloc
{
    self.loadingImageView.animationImages = nil;
    self.loadingImageView = nil;
}

@end
