Pod::Spec.new do |s|
  s.name             = 'TZImagePickerController'
  s.version          = '3.8.6.BAITU.b2'
  s.summary          = 'A short description of TZImagePickerController.'

  s.description      = <<-DESC
  fork TZImagePickerController.
                       DESC


  s.homepage         = 'https://github.com/BaiTu-iOS/TZImagePickerController.git'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'wudongge' => 'dg.wu@liaoke.tv' }
  s.source           = { :git => 'https://github.com/BaiTu-iOS/TZImagePickerController.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.4'
  s.swift_version         = '5.0'
  s.static_framework      = true

  
  s.subspec 'Core' do |ss|
    ss.source_files = 'TZImagePickerController/Classes/**/*.{h,m}'
    ss.resource     = 'TZImagePickerController/Assets/*.bundle'
    ss.frameworks   = "Photos", "PhotosUI"
  end
  
end
