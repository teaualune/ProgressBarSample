//
//  PBSViewController.h
//  ProgressBarSample
//
//  Created by Teaualune Tseng on 12/12/25.
//  Copyright (c) 2012年 Teaualune Tseng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PBSViewController : UIViewController<NSURLConnectionDownloadDelegate, NSURLConnectionDataDelegate>
{
    int method;
    NSMutableData *receivedData;
}

@property (nonatomic, weak) IBOutlet UIImageView *imageView;

@property (nonatomic, strong) UIActivityIndicatorView *indicator;

@property (nonatomic, weak) IBOutlet UIProgressView *defaultProgressView;

@property (nonatomic, weak) IBOutlet UIProgressView *customProgressView;

-(IBAction)indicator:(id)sender;
-(IBAction)defaultProgressBar:(id)sender;
-(IBAction)customProgressBar:(id)sender;

@end
