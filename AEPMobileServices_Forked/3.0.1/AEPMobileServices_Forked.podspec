Pod::Spec.new do |s|
  s.name         = "AEPMobileServices_Forked"
  s.version      = "3.0.1"
  s.summary      = "Mobile Services library for Adobe Experience Platform SDK. Written and maintained by Adobe."
  s.description  = <<-DESC
                   This is an attempt to repackage AEMMobileSerivces static framework as a dynamic one. Not a workable solution.
                   The Mobile Services library provides APIs that allow use of the Mobile Services product in the Adobe Experience Platform SDK.
                   DESC

  s.homepage     = "https://github.com/Adobe-Marketing-Cloud/acp-sdks/releases"

  s.license      = {:type => "Commercial", :file => "LICENSE.md"}
  s.author       = "Adobe Experience Platform SDK Team"
  s.source       = { :git => 'https://github.com/Adobe-Marketing-Cloud/acp-sdks.git', :tag => "v#{s.version}-AEPMobileServices" }
  s.platform     = :ios, '10.0'

  s.cocoapods_version = ">= 1.10"
  s.swift_version = '5.1'

  s.dependency "AEPCore"

  s.ios.source_files = [
      "AEPMobileServices.xcframework/ios-arm64_armv7_armv7s/Headers/*.h",
      "include/Empty.m"
  ]
  s.ios.frameworks = "UIKit", "SystemConfiguration", "WebKit"
  s.ios.libraries = "sqlite3.0"
  s.ios.vendored_libraries = "AEPMobileServices.xcframework/ios-arm64_armv7_armv7s/libAEPMobileServices_iOS.a"

  s.prepare_command = [
    "lipo AEPMobileServices.xcframework/ios-arm64_i386_x86_64-simulator/libAEPMobileServices_iOS.a -extract i386 -output i386.a",
    "lipo AEPMobileServices.xcframework/ios-arm64_i386_x86_64-simulator/libAEPMobileServices_iOS.a -extract x86_64 -output x86_64.a",
    "lipo AEPMobileServices.xcframework/ios-arm64_armv7_armv7s/libAEPMobileServices_iOS.a x86_64.a -create -output AEPMobileServices.xcframework/ios-arm64_armv7_armv7s/libAEPMobileServices_iOS.a",  
    "lipo AEPMobileServices.xcframework/ios-arm64_armv7_armv7s/libAEPMobileServices_iOS.a i386.a -create -output AEPMobileServices.xcframework/ios-arm64_armv7_armv7s/libAEPMobileServices_iOS.a"  
  ].join("; ")

  s.pod_target_xcconfig = { 
    "LIBRARY_SEARCH_PATHS" => "$(SDKROOT)/usr/lib/swift $(TOOLCHAIN_DIR)/usr/lib/swift/$(PLATFORM_NAME) $(TOOLCHAIN_DIR)/usr/lib/swift-5.0/$(PLATFORM_NAME)", 
    "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" 
  }
  s.user_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "arm64" }
end