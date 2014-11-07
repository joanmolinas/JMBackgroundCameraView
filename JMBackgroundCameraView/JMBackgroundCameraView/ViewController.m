//
//  ViewController.m
//  JMBackgroundCameraView
//
//  Created by Joan Molinas on 23/10/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "ViewController.h"
#import "UIERealTimeBlurView.h"
#import "JMBackgroundCameraView.h"

@interface ViewController () <UITextFieldDelegate>
@end

@implementation ViewController {
    JMBackgroundCameraView *v;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
     v = [[JMBackgroundCameraView alloc] initWithFrame:self.view.frame positionDevice:DevicePositonBack blur:YES];
    [self.view addSubview:v]; 
    
    UISwitch *s = [[UISwitch alloc]initWithFrame:CGRectMake(0, 100, 100, 40)];
    [s addTarget:self action:@selector(switchState:) forControlEvents:UIControlEventTouchUpInside];
    s.center = CGPointMake(self.view.frame.origin.x + self.view.frame.size.width/2, s.frame.origin.y);
    [v addSubview:s];
    
    UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, s.frame.origin.y + s.frame.size.height + 30, v.frame.size.width, 300)];
    text.text = @"JMBackgroundCameraView, enjoy!";
    text.font = [UIFont fontWithName:@"HelveticaNeue-Thin" size:50];
    text.textColor = [UIColor colorWithWhite:0.4 alpha:1.0];
    text.textAlignment = NSTextAlignmentCenter;
    text.numberOfLines = 0;
    [v addSubview:text];
    
}


-(void)switchState:(id)sender{
    [sender isOn] ? [v removeBlurEffect] :  [v addBlurEffect];
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    [v changePreviewOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:duration];
}


@end
