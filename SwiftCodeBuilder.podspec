#
# Be sure to run `pod lib lint SwiftCodeBuilder.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SwiftCodeBuilder'
  s.version          = '0.1.0'
  s.summary          = 'A sample and fast framework for generate swift code from swift code.'
  s.homepage         = 'https://github.com/Maru-zhang/SwiftCodeBuilder'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Maru-zhang' => 'zhangbinhui@souche.com' }
  s.source           = { :git => 'https://github.com/Maru-zhang/SwiftCodeBuilder.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'SwiftCodeBuilder/Classes/**/*'
end
