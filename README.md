JMBackgroundCameraView
======================
Use a front or back camera on backgroundView in your app. This is perfect for Logins or Welcome screens.

##Installation
At this moment, You can install only a way, manually.
For install, you can import JMBackgroundCameraView folder to your project. Import `JMBackgroundCameraView.h` and init a view.
This Folder already contains **blur effect**, now I use `UIERealTimeBlurView` to Blur but in few days I replace this library for another one.

##Usage
It's very easy. 
1. Define `JMBackgroundCameraView `:

    @property (nonatomic, strong) JMBackgroundCameraView *v;

2. You can use two constructors:

    `-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position blur:(BOOL)blur;`

    `-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position;`
