Pod::Spec.new do |s|

s.name             = 'SwiftOTP'
s.version          = '3.0.2'
s.summary          = 'A Pure Swift library for generating One Time Passwords (OTP)'
s.description      = 'SwiftOTP is a pure Swift library for generating One Time Passwords (OTP) commonly used for two factor authentication. SwiftOTP supports both HMAC-Based One Time Passwords (HOTP) and Time Based One Time Passwords (TOTP) defined in RFC 4226 and RFC 6238 respectively.'
s.homepage         = 'https://github.com/lachlanbell/SwiftOTP'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'lachlanbell' => 'me@lachlanbell.com.au' }
s.source           = { :git => 'https://github.com/lachlanbell/SwiftOTP.git', :tag => s.version.to_s }

s.ios.deployment_target = '13.0'
s.osx.deployment_target = '10.15'
s.watchos.deployment_target = '6.0'
s.tvos.deployment_target = '13.0'

s.source_files = 'SwiftOTP/**/*.{swift,h}'
end

