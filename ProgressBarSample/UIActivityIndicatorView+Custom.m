//
//  UIActivityIndicatorView+Custom.m
//  ProgressBarSample
//
//  Created by Teaualune Tseng on 12/12/25.
//  Copyright (c) 2012年 Teaualune Tseng. All rights reserved.
//

#import "UIActivityIndicatorView+Custom.h"
#import <QuartzCore/QuartzCore.h>

@implementation UIActivityIndicatorView (Custom)

-(void) startAnimatingInView:(UIView *)view
{
    self.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
    self.hidesWhenStopped = YES;
    self.center = CGPointZero;
    
    UIView *blackView = [[UIView alloc] initWithFrame:CGRectMake(self.center.x - 50, self.center.y - 50, 100, 100)];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.alpha = 0.5;
    blackView.layer.cornerRadius = 10;
    
    UIView *container = [[UIView alloc] init];
    [container addSubview:blackView];
    [container addSubview:self];
    
//    [self addSubview:blackView];
    container.center = view.center;
    [view addSubview:container];
    [self startAnimating];
    self.superview.superview.userInteractionEnabled = NO;
}

-(void) stopAnimatingAndResume
{
    [self stopAnimating];
    self.superview.superview.userInteractionEnabled = YES;
    [self.superview removeFromSuperview];
}

@end
