Pod::Spec.new do |s|
  s.name = "AdobeManager"
  s.version = "1.0"
  s.license = { :type => "COMMERCIAL", :text => "Created and licensed by Alexandr Kovalenko. Copyright 2021  Alexandr Kovalenko. All rights reserved." }
  s.summary = "Template project for quickly spinning up new plugins."
  s.homepage = "https://github.com/alex-kovalenko/TargetExample"
  s.authors = "Aleksandr Kovalenko"

  s.source = { :git => "git@github.com:alex-kovalenko/TargetExample.git", :tag => "#{s.version}" }
  s.swift_version = "5.3"

  s.ios.deployment_target = "12.0"

  s.source_files = ["AdobeManager/**/*.swift"]

  s.dependency "AEPTarget", "~> 3.1"
  s.dependency "AEPAnalytics", "~> 3.0"
  s.dependency "AEPIdentity", "~> 3.3"
  s.dependency "AEPLifecycle", "~> 3.3"
  s.dependency "AEPMobileServices", "~> 3.0"
  s.dependency "AEPSignal", "~> 3.3"
end
