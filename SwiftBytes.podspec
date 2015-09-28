Pod::Spec.new do |s|

  s.name         = "SwiftBytes"
  s.version      = "0.3.0"
  s.summary      = "Collection of helper methods for byte manipulation in Swift"

  s.description  = <<-DESC
                   This library contains a collection of helper methods for
                   byte manipulation in Swift.

                   If you're like me, and can never remember whether you should
                   double right-shift or tripple left-shift to get to the
                   bits you want, then this library might be of some use to
                   you.
                   DESC

  s.homepage     = "https://github.com/dapperstout/swift-bytes"
  s.license      = { :type => "MIT" }

  s.author       = "Dapperstout"
  s.source       = { :git => "https://github.com/dapperstout/swift-bytes.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'

  s.source_files = "Bytes/Bytes/**/*.swift"
  s.requires_arc = true

end
