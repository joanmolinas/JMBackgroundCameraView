//
//  JMBackgroundCameraView.h
//  JMBackgroundCameraView
//
//  Created by Joan Molinas on 23/10/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "UIERealTimeBlurView.h"

typedef NS_ENUM(NSInteger, DevicePositon) {
    DevicePositonFront,
    DevicePositonBack
};

@interface JMBackgroundCameraView : UIView

@property (nonatomic, strong) AVCaptureSession *session;
@property (nonatomic, strong) AVCaptureDeviceInput *input;
@property (nonatomic, strong) AVCaptureDevice *device;
@property (nonatomic, strong) AVCaptureStillImageOutput *imageOutput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *preview;
@property (nonatomic, strong) UIERealTimeBlurView* blurLayer;

@property (nonatomic, assign) UIInterfaceOrientation orientation;


-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position blur:(BOOL)blur;
-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position;

- (void)changePreviewOrientation:(UIInterfaceOrientation)interfaceOrientation;

-(void)removeBlurEffect;
-(void)addBlurEffect;
@end
