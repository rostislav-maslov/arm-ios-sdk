Pod::Spec.new do |s|
  s.name             = 'ArmSdk'
  s.version          = '0.4.0'
  s.summary          = 'This is summary'
 
  s.description      = <<-DESC
This fantastic view changes its color gradually makes your app look fantastic!
                       DESC
 
  s.homepage         = 'https://github.com/rostislav-maslov/arm-ios-sdk'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rostislav Maslov' => 'maslov.rostislav@gmail.com' }
  s.source           = { :git => 'https://github.com/rostislav-maslov/arm-ios-sdk.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '10.0'
  s.source_files = 'Sources/**/*.swift'
 
end
