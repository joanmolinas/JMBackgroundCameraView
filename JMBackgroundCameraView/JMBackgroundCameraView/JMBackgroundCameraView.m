//
//  JMBackgroundCameraView.m
//  JMBackgroundCameraView
//
//  Created by Joan Molinas on 23/10/14.
//  Copyright (c) 2014 joan molinas ramon. All rights reserved.
//

#import "JMBackgroundCameraView.h"


@implementation JMBackgroundCameraView {
    UIERealTimeBlurView *blurView;
}
-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position blur:(BOOL)blur {
    if (self = [super initWithFrame:frame]) {
        [self initCameraInPosition:position];
        blurView = [[UIERealTimeBlurView alloc] initWithFrame:self.frame];
        [self addBlurEffect];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position {
    if (self = [super initWithFrame:frame]) {
        [self initCameraInPosition:position];
    }
    return self;
}
-(void)initCameraInPosition:(DevicePositon)position {
    self.session = [AVCaptureSession new];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    NSArray *devices = [NSArray new];
    devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if (position == DevicePositonBack) {
            if ([device position] == AVCaptureDevicePositionBack) {
                _device = device;
                break;
            }
        }else {
            if ([device position] == AVCaptureDevicePositionFront) {
                _device = device;
                break;
            }
        }
    }
    
    NSError *error;
    
    self.input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:&error];
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    self.imageOutput = [AVCaptureStillImageOutput new];
    
    NSDictionary *outputSettings = @{AVVideoCodecKey:AVVideoCodecJPEG};
    
    [self.imageOutput setOutputSettings:outputSettings];
    [self.session addOutput:self.imageOutput];
    
    self.preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [self.preview setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.layer addSublayer:self.preview];
    
    [self.session startRunning];
    
    

}


- (void)changePreviewOrientation:(UIInterfaceOrientation)interfaceOrientation duration:(NSTimeInterval)duration
{
    if (!self.preview) {
        return;
    }
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if (interfaceOrientation == UIInterfaceOrientationLandscapeRight || interfaceOrientation == UIInterfaceOrientationLandscapeLeft) {
            [self.preview setFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width)];
            
            if (blurView) {
                [blurView setFrame:CGRectMake(0, 0,  self.frame.size.height, self.frame.size.width)];
            }
        }else{
            [self.preview setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
           
            if (blurView) {
                [blurView setFrame:CGRectMake(0, 0,  self.frame.size.width, self.frame.size.height)];
            }
        }
        [self previewOrientation:interfaceOrientation];
    } completion:NULL];
}

- (void)previewOrientation:(UIInterfaceOrientation)interfaceOrientation{
    
    [CATransaction begin];
    
    self.orientation = interfaceOrientation;
    
    if (interfaceOrientation == UIInterfaceOrientationLandscapeRight) {
        self.preview.connection.videoOrientation = AVCaptureVideoOrientationLandscapeRight;
        
    }else if (interfaceOrientation == UIInterfaceOrientationLandscapeLeft){
        self.preview.connection.videoOrientation = AVCaptureVideoOrientationLandscapeLeft;
        
    }else if (interfaceOrientation == UIDeviceOrientationPortrait){
        self.preview.connection.videoOrientation = AVCaptureVideoOrientationPortrait;
        
    }else if (interfaceOrientation == UIDeviceOrientationPortraitUpsideDown){
        self.preview.connection.videoOrientation = AVCaptureVideoOrientationPortraitUpsideDown;
    }
    
    [CATransaction commit];
}

-(void)removeBlurEffect {
    [blurView removeFromSuperview];
    blurView = nil;
}

-(void)addBlurEffect {
    if (blurView == nil) {
        if (self.orientation == UIInterfaceOrientationLandscapeRight || self.orientation == UIInterfaceOrientationLandscapeLeft) {
            blurView = [[UIERealTimeBlurView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.height, self.frame.size.width)];
        }else{
            blurView = [[UIERealTimeBlurView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        }
    }
    [self insertSubview:blurView atIndex:1];
}

@end
