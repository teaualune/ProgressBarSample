//
//  PBSViewController.m
//  ProgressBarSample
//
//  Created by Teaualune Tseng on 12/12/25.
//  Copyright (c) 2012年 Teaualune Tseng. All rights reserved.
//

#import "PBSViewController.h"
#import "UIActivityIndicatorView+Custom.h"
#import <AudioToolbox/AudioToolbox.h>

@interface PBSViewController ()

-(void) startRequest;

@end

@implementation PBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    
    self.customProgressView.trackImage = [UIImage imageNamed:@"track.png"];
    self.customProgressView.progressImage = [UIImage imageNamed:@"progress.png"];
    self.customProgressView.progress = 0.3;
    
    method = 0;
    receivedData = [NSMutableData data];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)indicator:(id)sender
{
    method = 0;
    [self.indicator startAnimatingInView:self.view];
    [self startRequest];
}

-(IBAction)defaultProgressBar:(id)sender
{
    method = 1;
    self.defaultProgressView.progress = 0;
    [self startRequest];
}

-(IBAction)customProgressBar:(id)sender
{
    method = 2;
    self.customProgressView.progress = 0;
    [self startRequest];
}

-(void) startRequest
{    
    NSURLConnection *connection = [NSURLConnection connectionWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://dl.dropbox.com/u/10407268/18492850.jpg"]] delegate:self];
    
    [connection start];
}

-(void)connection:(NSURLConnection *)connection didWriteData:(long long)bytesWritten totalBytesWritten:(long long)totalBytesWritten expectedTotalBytes:(long long)expectedTotalBytes
{
    if (method == 1) {
        self.defaultProgressView.progress = ((float) totalBytesWritten) / ((float) expectedTotalBytes);
    } else if (method == 2) {
        self.customProgressView.progress = ((float) totalBytesWritten) / ((float) expectedTotalBytes);
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [receivedData appendData:data];
}

-(void)connectionDidFinishDownloading:(NSURLConnection *)connection destinationURL:(NSURL *)destinationURL
{
    if (method == 0) {
        [self.indicator stopAnimatingAndResume];
    } else if (method == 1) {
        
    } else if (method == 2) {
        
    }

    UIImage *image = [UIImage imageWithData:receivedData];
    self.imageView.image = image;
    receivedData.length = 0;
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
    CFBundleRef mainBundle = CFBundleGetMainBundle ();
    CFURLRef soundFileURLRef  = CFBundleCopyResourceURL (mainBundle,CFSTR ("se16"), CFSTR ("wav"), NULL);
    SystemSoundID soundID;
    
    AudioServicesCreateSystemSoundID ( soundFileURLRef, &soundID);
    
    AudioServicesPlayAlertSound(soundID);
    
}

@end
