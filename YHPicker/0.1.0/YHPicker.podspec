Pod::Spec.new do |s|
  s.name             = 'YHPicker'
  s.version          = '0.1.0'
  s.description  = <<-DESC 
                          YHPicker 是一个选择相机或者相册的工具YHPicker 是一个选择相机或者相册的工具YHPicker 是一个选择相机或者相册的工具YHPicker 是一个选择相机或者相册的工具YHPicker 是一个选择相机或者相册的工具
                      DESC
  s.summary          = 'The YHPicker utilities you always wish you had.'
  s.homepage         = 'https://github.com/lewis180777/YHPicker'
  s.license          =   { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lewis180777' => '491099116@qq.com' }
  s.source           = {:git => 'https://github.com/lewis180777/YHPicker.git', :tag => s.version} 
  s.requires_arc          = true
  s.platform         = :ios, '6.0'

  s.source_files = 'YHPicker/**/*.{h,m}'

  # s.public_header_files = “Pod/Classes/**/*.h”
 
  #依赖关系，该项目所依赖的其他库，如果有多个需要填写多个s.dependency
  #s.dependency “AFNetworking”

 
end
