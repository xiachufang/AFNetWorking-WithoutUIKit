Pod::Spec.new do |s|
  s.name     = 'AFNetWorking-WithoutUIKit'
  s.version  = '1.1.0'
  s.license  = 'MIT'
  s.summary  = 'A delightful iOS and OS X AFNetworking-3.1.0 framework.'
  s.homepage = 'https://github.com/xiachufang/AFNetWorking-WithoutUIKit'
  s.social_media_url = 'https://twitter.com/AFNetworking'
  s.authors  = { 'Mattt Thompson' => 'm@mattt.me' }
  s.source   = { :git => 'https://github.com/xiachufang/AFNetWorking-WithoutUIKit.git', :tag => s.version, :submodules => true }
  s.requires_arc = true
  
  s.public_header_files = 'AFNetWorking-WithoutUIKit/AFNetworking.h'
  s.source_files = 'AFNetWorking-WithoutUIKit/AFNetworking.h'
  
  pch_AF = <<-EOS
  
#ifndef TARGET_OS_IOS
  #define TARGET_OS_IOS TARGET_OS_IPHONE
#endif

#ifndef TARGET_OS_WATCH
  #define TARGET_OS_WATCH 0
#endif

#ifndef TARGET_OS_TV
  #define TARGET_OS_TV 0
#endif

EOS
  s.prefix_header_contents = pch_AF
  
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'
  
  s.subspec 'Serialization' do |ss|
    ss.source_files = 'AFNetWorking-WithoutUIKit/AFURL{Request,Response}Serialization.{h,m}'
    ss.public_header_files = 'AFNetWorking-WithoutUIKit/AFURL{Request,Response}Serialization.h'
    ss.watchos.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.ios.frameworks = 'MobileCoreServices', 'CoreGraphics'
    ss.osx.frameworks = 'CoreServices'
  end

  s.subspec 'Security' do |ss|
    ss.source_files = 'AFNetWorking-WithoutUIKit/AFSecurityPolicy.{h,m}'
    ss.public_header_files = 'AFNetWorking-WithoutUIKit/AFSecurityPolicy.h'
    ss.frameworks = 'Security'
  end

  s.subspec 'Reachability' do |ss|
    ss.ios.deployment_target = '8.0'
    ss.osx.deployment_target = '10.9'
    ss.tvos.deployment_target = '9.0'

    ss.source_files = 'AFNetWorking-WithoutUIKit/AFNetworkReachabilityManager.{h,m}'
    ss.public_header_files = 'AFNetWorking-WithoutUIKit/AFNetworkReachabilityManager.h'

    ss.frameworks = 'SystemConfiguration'
  end

  s.subspec 'NSURLSession' do |ss|
    ss.dependency 'AFNetWorking-WithoutUIKit/Serialization'
    ss.ios.dependency 'AFNetWorking-WithoutUIKit/Reachability'
    ss.osx.dependency 'AFNetWorking-WithoutUIKit/Reachability'
    ss.tvos.dependency 'AFNetWorking-WithoutUIKit/Reachability'
    ss.dependency 'AFNetWorking-WithoutUIKit/Security'

    ss.source_files = 'AFNetWorking-WithoutUIKit/AF{URL,HTTP}SessionManager.{h,m}', 'AFNetWorking-WithoutUIKit/AFCompatibilityMacros.h'
    ss.public_header_files = 'AFNetWorking-WithoutUIKit/AF{URL,HTTP}SessionManager.h', 'AFNetWorking-WithoutUIKit/AFCompatibilityMacros.h'
  end

end

