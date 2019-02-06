platform :ios, '12.1'

target 'AcknowledgementSample' do
  use_frameworks!

  # Pods for AcknowledgementSample
  pod 'Swiftilities/Acknowledgements'
  
  # https://www.raywenderlich.com/259-top-10-libraries-for-ios-developers
  pod 'AFNetworking'
  pod 'SDWebImage'
  pod 'Alamofire'
  pod 'MBProgressHUD'
  pod 'Masonry'
  pod 'SwiftyJSON'
  pod 'SVProgressHUD'
  pod 'MJRefresh'
  pod 'CocoaLumberjack'
  pod 'Realm'

end

# https://github.com/CocoaPods/CocoaPods/wiki/Acknowledgements
post_install do | installer |
    require 'fileutils'
    FileUtils.cp_r('Pods/Target Support Files/Pods-AcknowledgementSample/Pods-AcknowledgementSample-acknowledgements.plist', 'AcknowledgementSample/Acknowledgements.plist', :remove_destination => true)
end
