//
//  UIActivityIndicatorView+Custom.h
//  ProgressBarSample
//
//  Created by Teaualune Tseng on 12/12/25.
//  Copyright (c) 2012年 Teaualune Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIActivityIndicatorView (Custom)

-(void) startAnimatingInView:(UIView *)view;

-(void) stopAnimatingAndResume;

@end
