JMBackgroundCameraView
======================
Use a front or back camera on backgroundView in your app. This is perfect for Logins or Welcome screens.

##Installation
At this moment, You can install only a way, manually.
For install, you can import JMBackgroundCameraView folder to your project. Import `JMBackgroundCameraView.h` and init a view.
This Folder already contains **blur effect**.

##Usage
It's very easy. 

1. Define `JMBackgroundCameraView `:

    @property (nonatomic, strong) JMBackgroundCameraView *v;

2. You can use two constructors, device position for back or front camera:

    `-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position blur:(BOOL)blur;`
    
    or:

    `-(instancetype)initWithFrame:(CGRect)frame positionDevice:(DevicePositon)position;`
    
3. Just need add view `addSubview`

##Requeriments
Optimitzed for iOS7 or higher
