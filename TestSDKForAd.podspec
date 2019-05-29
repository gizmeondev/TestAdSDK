
Pod::Spec.new do |spec|

  spec.name         = "TestSDKForAd"
  spec.version      = "1.0.0"
  spec.summary      = "Test ad sdk fr pod."
  spec.description  = "This pod is used for testing ad sdks in iOS."
  spec.homepage     = "https://gizmeon.com"
  spec.license      = "MIT"
  spec.author       = { "gizmeondev" => "firoze@gizmeon.com" }
  spec.platform     = :ios, "8.0"

  spec.source = { :git => "https://github.com/gizmeondev/TestAdSDK.git", :tag => "1.0.0" }

  spec.source_files  = "TestSDK"
  spec.exclude_files = "Classes/Exclude"

end
