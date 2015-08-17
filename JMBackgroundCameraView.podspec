Pod::Spec.new do |s|

s.platform = :ios, '8.0'
s.ios.deployment_target = '8.0'
s.name = "JMBackgroundCameraView"
s.summary = "JMBackgroundCameraView allow use camera in a UIViewController or another class in a easy way"
s.requires_arc = true

s.version = "1.0"
s.license = { :type => "MIT", :file => "LICENSE" }

s.author = { "Joan Molinas" => "joanmramon@gmail.com" }
s.homepage = "https://github.com/ulidev/JMBackgroundCameraView"
s.source = { :git => "https://github.com/ulidev/JMBackgroundCameraView.git", :tag => s.version.to_s }
s.framework = "UIKit"
s.source_files = "JMBackgroundCameraView/JMBackgroundCameraView/JMBackgroundCameraView.{h,m}"
end