#
# Be sure to run `pod lib lint LLSliderController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LLSliderController'
  s.version          = '1.0.0'
  s.summary          = '简单实现侧滑'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
    简单实现侧滑，可以设置左侧滑还是有侧滑，同时可以设置侧滑宽度
                       DESC

  s.homepage         = 'https://github.com/wilson7156'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '704110362@qq.com' => '704110362@qq.com' }
  s.source           = { :git => 'https://github.com/wilson7156/LLSliderController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LLSliderController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LLSliderController' => ['LLSliderController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
